class ResumeEntriesController < ApplicationController

  def new
    @resume_entry = ResumeEntry.new
  end

  def create
    @prev_entry = ResumeEntry.all.find_by(resume_entries_params)
    @resume_entry = ResumeEntry.new(resume_entries_params)
    if @resume_entry.valid? && !@prev_entry
      @resume_entry.save
      redirect_to @resume_entry.resume
    else
      flash[:error] = @resume_entry.errors.full_messages
      if @prev_entry
        flash[:error] << "Entry already exists on resume"
      end
      redirect_to new_resume_entry_path
    end
  end

  def update
    @resume_entry = ResumeEntry.find(params[:id])
    if @resume_entry.update(resume_entry_params)
      flash[:msg] = "Resume succesfully updated"
      redirect_to @resume_entry
    else
      flash[:error] = @resume_entry.errors.errors.full_messages
      redirect_to edit_resume_entry_path(@resume_entry)
    end
  end

  def destroy

  end

  private

  def resume_entries_params
    params.require(:resume_entry).permit(:resume_id, :entry_id)
  end


end
