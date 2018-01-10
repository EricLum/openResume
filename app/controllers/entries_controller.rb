class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.valid?
      @entry.save
      redirect_to @entry
    else
      flash[:error] = @entry.errors.full_messages
      redirect_to new_entry_path
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      flash[:msg] = "Entries succesfully updated"
      redirect_to @entry
    else
      flash[:error] = @entry.errors.errors.full_messages
      redirect_to edit_entry_path(@entry)
    end
  end

  def destroy
    @entry.destroy
  end

  private

  def entry_params
    params.require(:entry).permit(:job_title, :start_date, :end_date, :description)
  end

end
