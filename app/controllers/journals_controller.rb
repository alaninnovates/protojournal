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
      respond_to do |format|
        format.turbo_stream do
          render partial: "journals/summary", locals: { journal: @journal }
        end

        format.html do
          redirect_to project_journal_path(@journal.project, @journal), notice: "Updated!"
        end
      end
    else
      # handle errors...
    end
  end


  private
  def journal_params
    params.require(:journal).permit(:week_start, :week_end, :summary)
  end
end
