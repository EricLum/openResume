class ResumesController < ApplicationController

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def show
    @resume = Resume.find(params[:id])
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.valid?
      @resume.save
      redirect_to @resume
    else
      flash[:error] = @resume.errors.full_messages
      redirect_to new_resume_path
    end
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      flash[:msg] = "Resume succesfully updated"
      redirect_to @resume
    else
      flash[:error] = @resume.errors.errors.full_messages
      redirect_to edit_resume_path(@resume)
    end
  end

  def destroy
    @resume.destroy
  end

  private

  def resume_params
    params.require(:resume).permit(:title, :user_id)
  end

end
