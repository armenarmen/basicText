class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit]

  def show
  end

  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { redirect_to :back, notice: 'You need to write something!' }
      end
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:content, :user_id, users_params: [:name, :email, :password, :password_confirmation])
    end
end
