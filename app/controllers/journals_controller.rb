class JournalsController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    @journal = project.journals.build(journal_params)
    if @journal.save
      redirect_to project_path(@journal.project_id), notice: 'Journal entry was successfully created.'
    else
      flash.now[:alert] = 'There was an error creating the journal entry.'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])

    if journal_params.key?(:reflection)
      if @journal.reflection
        if @journal.reflection.update(journal_params[:reflection])
          render turbo_stream: turbo_stream.replace("journal_reflection_#{@journal.id}", partial: "journals/reflection", locals: { journal: @journal })
        else
          head :unprocessable_entity
        end
      else
        reflection = @journal.build_reflection(journal_params[:reflection])
        if reflection.save
          render turbo_stream: turbo_stream.replace("journal_reflection_#{@journal.id}", partial: "journals/reflection", locals: { journal: @journal })
        else
          head :unprocessable_entity
        end
      end
    else
      if @journal.update(journal_params)
        render turbo_stream: turbo_stream.replace("journal_summary_#{@journal.id}", partial: "journals/summary", locals: { journal: @journal })
      else
        head :unprocessable_entity
      end
    end
  end

  def export
    @journal = Journal.find(params[:id])
    respond_to do |format|
      format.html do
        redirect_to project_journal_path(@journal.project, @journal)
      end
      format.pdf do
        render pdf: "report",
               template: "journals/export",
               page_size: "A4",
               margin: { top: 10, bottom: 10, left: 10, right: 10 },
               show_as_html: params.key?('debug'),
               disposition: "attachment"
      end
    end
  end

  private

  def journal_params
    params.require(:journal).permit(:week_start, :week_end, :summary, reflection: [:challenges, :supports, :next_steps], objectives_attributes: [:id, :description, :_destroy])
  end
end
