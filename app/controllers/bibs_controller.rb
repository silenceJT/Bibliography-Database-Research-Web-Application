class BibsController < ApplicationController
  before_action :set_bib, only: [:show, :edit, :update, :destroy]
      
  # GET /bibs
  # GET /bibs.json
  def index
    @bibs = Bib.search(params[:search_form], params[:search])
    @entry = Array.new  
    if params[:search].present?
        @entry = @entry.push(params[:search])
    end
    # Row 1
    if params[:year].present?
        @bibs = @bibs.select {|b| b.year.include?(params[:year])}
        @entry = @entry.push(params[:year])
    end
    if params[:publication].present?
        @bibs = @bibs.select {|b| b.publication.downcase.include?(params[:publication].downcase)}
        @entry = @entry.push(params[:publication])
    end
    if params[:publisher].present?
        @bibs = @bibs.select {|b| b.publisher.downcase.include?(params[:publisher].downcase)}
        @entry = @entry.push(params[:publisher])
    end
    
    #Row 2
    if params[:LP].present?
        @bibs = @bibs.select {|b| b.language_published.downcase.include?(params[:LP].downcase)}
        @entry = @entry.push(params[:LP])
    end
    if params[:LR].present?
        @bibs = @bibs.select {|b| b.language_researched.downcase.include?(params[:LR].downcase)}
        @entry = @entry.push(params[:LR])
    end
    if params[:CR].present?
        @bibs = @bibs.select {|b| b.country_of_research.downcase.include?(params[:CR].downcase)}
        @entry = @entry.push(params[:CR])
    end
      
    #Row 3
    if params[:name].present?
        @bibs = @bibs.select {|b| b.biblio_name.downcase.include?(params[:name].downcase)}
        @entry = @entry.push(params[:name])
    end
    if params[:date].present?
        @bibs = @bibs.select {|b| b.date_of_entry.include?(params[:date])}
        @entry = @entry.push(params[:date])
    end
    if params[:tag].present?
        @bibs.select {|b| b.keywords.downcase.include?(params[:tag].downcase)}
        @entry = @entry.push(params[:tag])
    end
    
    @count = @bibs.count
    @bibs = Kaminari.paginate_array(@bibs).page(params[:page]).per(20)
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
      params.require(:bib).permit(:author, :year, :title, :publication, :publisher, :biblio_name, :language_published, :language_researched, :country_of_research, :keywords, :isbn, :issn, :url, :date_of_entry, :source)
    end
    

end
