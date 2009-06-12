require 'pinyin.rb'
class ArticlesController < ApplicationController

  before_filter :authorize,:only=>["new","create","edit","update","destroy"]
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.paginate(:all,:page=>params[:page],:order=>"created_at desc",:per_page=>15,:conditions=>["category_id = ?",params[:category_id]])
    @category = "unknow"
    @categories = Category.find(:all)
    @lastest = Article.find(:all,:limit=>15,:order=>"created_at desc")
    @lastest_comments = Comment.find(:all,:limit=>15,:order=>"created_at desc")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find_by_permalink(params[:permalink])
    if @article
      @article.increment!(:visited_count, 1)
      @categories = Category.find(:all)
      @lastest = Article.find(:all,:limit=>10,:order=>"created_at desc")
      @comments = Comment.paginate(:all,:page=>params[:page],:order=>"created_at desc",:per_page=>25,:conditions=>["article_id = ?",@article])
      @lastest_comments = Comment.find(:all,:limit=>15,:order=>"created_at desc")
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @article }
      end
    else
      flash[:notice] = "这篇文章已经不存在了>.<"
      redirect_to root_url
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
    @category = "unknow"
    @categories = Category.find(:all)
    @lastest = Article.find(:all,:limit=>10,:order=>"created_at desc")
    @lastest_comments = Comment.find(:all,:limit=>15,:order=>"created_at desc")
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @categories = Category.find(:all)
    @lastest = Article.find(:all,:limit=>10,:order=>"created_at desc")
    @lastest_comments = Comment.find(:all,:limit=>15,:order=>"created_at desc")
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    @article.user_id = session[:user].id
    permlink = PinYin.instance
    @article.permalink = permlink.to_permlink(@article.title)

    respond_to do |format|
      if @article.save

        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(show_article_url(@article.permalink)) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])
    permlink = PinYin.instance.to_permlink(params[:article][:title])

    respond_to do |format|
      if @article.update_attributes(:title=>params[:article][:title],:content=>params[:article][:content],:permalink=>permlink)
        flash[:notice] = '日志更新成功！'
        format.html { redirect_to show_article_url(@article.permalink) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    Comment.delete_all("article_id = #{params[:id]}")
    Article.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end

  def uploadfile

  end
end
