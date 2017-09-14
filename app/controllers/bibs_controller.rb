class BibsController < ApplicationController
  before_action :set_bib, only: [:show, :edit, :update, :destroy]

  # GET /bibs
  # GET /bibs.json
  def index
    @bibs = Bib.search(params[:search_form], params[:search])
    @bibs = Kaminari.paginate_array(@bibs).page(params[:page]).per(20)
    #@bibs = Bib.search(params[:search])
    #@bibs = if params[:search]
      #Bib.fulltext_search("%#{params[:search]}%")
      #Bib.all.select {|b| b.author.include?(params[:search])} 
    #else
      #Bib.all
    #end
    
    #@query = Bib.search do
    #    fulltext params[:search]
    #end
    #@bibs = @query.results
  end
    
  

  # GET /bibs/1
  # GET /bibs/1.json
  def show
  end

  # GET /bibs/new
  def new
    @bib = Bib.new
  end

  # GET /bibs/1/edit
  def edit
  end

  # POST /bibs
  # POST /bibs.json
  def create
    @bib = Bib.new(bib_params)

    respond_to do |format|
      if @bib.save
        format.html { redirect_to @bib, notice: 'Bib was successfully created.' }
        format.json { render :show, status: :created, location: @bib }
      else
        format.html { render :new }
        format.json { render json: @bib.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bibs/1
  # PATCH/PUT /bibs/1.json
  def update
    respond_to do |format|
      if @bib.update(bib_params)
        format.html { redirect_to @bib, notice: 'Bib was successfully updated.' }
        format.json { render :show, status: :ok, location: @bib }
      else
        format.html { render :edit }
        format.json { render json: @bib.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bibs/1
  # DELETE /bibs/1.json
  def destroy
    @bib.destroy
    respond_to do |format|
      format.html { redirect_to bibs_url, notice: 'Bib was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bib
      @bib = Bib.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bib_params
      params.require(:bib).permit(:author, :year, :title, :publication, :publisher, :biblio_name, :language_published, :language_researched, :country_of_research, :keywords, :isbn, :issn, :url, :date_of_entry)
    end
    

  

end
