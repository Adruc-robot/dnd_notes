class NotesController < ApplicationController
  before_action :get_campaign
  before_action :set_note, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /notes or /notes.json
  def index
    #@notes = Note.all
    @notes = @campaign.notes
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    #@note = Note.new
    #@note = current_user.notes.build
    #@note = @campaign.current_user.notes.build
    #@note = current_user.@campaign.notes.build
    @note = @campaign.notes.build
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    #@note = Note.new(note_params)
    #@note = @campaign.current_user.notes.build(note_params)
    @note = @campaign.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend("campaign-notes-list", partial: "notes/note", locals: {note: @note})
        end
        #format.html { redirect_to note_url(@note), notice: "Note was successfully created." }
        format.html { redirect_to campaign_path(@campaign), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend("campaign-notes-list", partial: "notes/note", locals: {note: @note})
        end
        #format.html { redirect_to note_url(@note), notice: "Note was successfully updated." }
        format.html { redirect_to campaign_path(@campaign), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy

    respond_to do |format|
      #format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      #format.html { redirect_to campaign_path(@campaign), notice: "Note was successfully destroyed." }
      format.html { redirect_to campaign_notes_path(@campaign), notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  private
    def correct_user
      @note = current_user.notes.find_by(id: params[:id])
      redirect_to campaign_notes_path, notice: "Not authorized!" if @note.nil?
    end
    def get_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
    
    def set_note
      @note = @campaign.notes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:user_id, :campaign_id, :note_text, :content, :note_heading, :audience, :category)
      #params.require(:note).permit(:user_id, :campaign_id, :content)
    end
end
