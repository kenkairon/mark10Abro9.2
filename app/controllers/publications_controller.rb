class PublicationsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :tengo_permisos?, except: [:index, :show, :new]
  before_action :set_publication, only: %i[ show edit update destroy ]
  
  # GET /publications or /publications.json
  def index
    @publications = Publication.order(:title).page(params[:page])
  end

  # GET /publications/1 or /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    2.times {@publication.labels.build}
  end

  # GET /publications/1/edit
  def edit
    1.times {@publication.labels.build}
  end

  # POST /publications or /publications.json
  def create
    @publication = Publication.new(publication_params)
    respond_to do |format|
      if @publication.save
        format.html { redirect_to publication_url(@publication), notice: "La Publicación fue Creada con éxito." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to publication_url(@publication), notice: "La Publicación se Actualizó con éxito." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def destroy
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to publications_url, notice: "La Publicación ha sido Eliminada." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:title, :description, :route, :price, :user_id, :photo, labels_attributes: [:id, :contact, :_destroy])
    end
end
