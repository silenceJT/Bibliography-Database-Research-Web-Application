class BibliosController < ApplicationController
  before_action :set_biblio, only: [:show, :edit, :update, :destroy]
  
  def index
    #@biblios = Biblio.all
    
    @query = Biblio.search do
      fulltext params[:search]
    end
    @biblios = @query.results
  end
  
  def show
  end
  
  def new
    @biblio = Biblio.new
  end
  
  def edit
  end
  
  def create
    @biblio = Biblio.new(biblio_params)
    
    respond_to do |format|
      if @biblio.save
        format.html { redirect_to @biblio, notice: 'Biblio was successfully created.' }
        format.json { render :show, status: :created, location: @biblio }
      else
        format.html { render :new }
        format.json { render json: @biblio.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @biblio.update(biblio_params)
        format.html { redirect_to @biblio, notice: 'Biblio was successfully updated.' }
        format.json { render :show, status: :ok, location: @biblio }
      else
        format.html { render :edit }
        format.json { render json: @biblio.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @biblio.destroy
    respond_to do |format|
      format.html { redirect_to biblios_url, notice: 'Biblio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    def set_biblio
      @biblio = Biblio.find(params[:id])
    end
    
    def biblio_params
      params.require(:biblio).permit(:author, :year, :title, :publication, 
                                  :publisher, :biblio_name, :language_published, 
                                  :language_researched, :country_of_research, 
                                  :keywords, :isbn, :issn, :url, :date_of_entry)
    end
  
  
  def search
    @biblios = Biblio.search do
      keywords params[:query]
    end.results
    
    respond_to do |format|
      format.html { render :action => "index" }
      format.xml { render :xml => @biblios }
    end
  end
end
