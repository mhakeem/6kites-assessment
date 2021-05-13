class NotesController < ApplicationController
  def new
    @movie_id = params[:movie_id]
    @note = Note.new
  end

  def create
    @movie_id = params[:movie_id]
    @note_entry = params[:note][:entry]
    @note = Note.new(movie_id: @movie_id, entry: @note_entry)
    
    if @note.save
      redirect_to movie_path(@movie_id), notice: 'Note created!'
    else
      render :new
    end
  end

  def edit
    @note = Note.find_by(params[:id])
  end

  def update
    @note = Note.find_by(params[:id])
    
    if @note.update(note_params)
      redirect_to movie_path(@note.movie_id), notice: 'Note updated!'
    else
      render :edit
    end
  end

  private
  def note_params
    params.require(:note).permit(:entry, :movie_id)
  end

end
