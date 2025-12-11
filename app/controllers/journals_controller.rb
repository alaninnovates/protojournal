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

    if @journal.update(journal_params)
      render turbo_stream: turbo_stream.replace("journal_summary_#{@journal.id}", partial: "journals/summary", locals: { journal: @journal })
    else
      head :unprocessable_entity
    end
  end


  private
  def journal_params
    params.require(:journal).permit(:week_start, :week_end, :summary)
  end
end
