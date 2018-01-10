class ResumeEntriesController < ApplicationController

  def new
    @resume_entries = ResumeEntryn.new
  end

  def create
    @resume_entry = Resume.new
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
