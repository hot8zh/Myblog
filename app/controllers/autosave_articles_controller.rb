class AutosaveArticlesController < ApplicationController
  # GET /autosave_articles
  # GET /autosave_articles.xml
  def index
    @autosave_articles = AutosaveArticle.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @autosave_articles }
    end
  end

  # GET /autosave_articles/1
  # GET /autosave_articles/1.xml
  def show
    @autosave_article = AutosaveArticle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @autosave_article }
    end
  end

  # GET /autosave_articles/new
  # GET /autosave_articles/new.xml
  def new
    @autosave_article = AutosaveArticle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @autosave_article }
    end
  end

  # GET /autosave_articles/1/edit
  def edit
    @autosave_article = AutosaveArticle.find(params[:id])
  end

  # POST /autosave_articles
  # POST /autosave_articles.xml
  def create
    @autosave_article = AutosaveArticle.new(params[:autosave_article])

    respond_to do |format|
      if @autosave_article.save
        flash[:notice] = 'AutosaveArticle was successfully created.'
        format.html { redirect_to(@autosave_article) }
        format.xml  { render :xml => @autosave_article, :status => :created, :location => @autosave_article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @autosave_article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /autosave_articles/1
  # PUT /autosave_articles/1.xml
  def update
    @autosave_article = AutosaveArticle.find(params[:id])

    respond_to do |format|
      if @autosave_article.update_attributes(params[:autosave_article])
        flash[:notice] = 'AutosaveArticle was successfully updated.'
        format.html { redirect_to(@autosave_article) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @autosave_article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /autosave_articles/1
  # DELETE /autosave_articles/1.xml
  def destroy
    @autosave_article = AutosaveArticle.find(params[:id])
    @autosave_article.destroy

    respond_to do |format|
      format.html { redirect_to(autosave_articles_url) }
      format.xml  { head :ok }
    end
  end
end
