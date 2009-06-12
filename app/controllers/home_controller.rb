class HomeController < ApplicationController
  def index
    @articles = Article.paginate(:all,:page=>params[:page],:order=>"created_at desc",:per_page=>15)
    @category = "unknow"
    @categories = Category.find(:all)
    @lastest = Article.find(:all,:limit=>10,:order=>"created_at desc")
    @lastest_comments = Comment.find(:all,:limit=>15,:order=>"created_at desc")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

end
