class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end


  def all
    @articles = Article.where(:state => ['3', '4'])
    
    respond_to do |format|
      format.html { render 'index' }                  # uses the same view as the default index
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
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

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
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
    @article = Article.find(params[:id])
    
    if(@article.state < 3)
      @article.destroy
      else
      flash[:error] = 'The article could not be deleted.'
    end

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end

  def myarticles
    @myarticles = current_user.articles.all
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @myarticles }
    end
  end
  
  def submit
    @article = current_user.articles.find(params[:id])
    
    # submit only, if article is currently in draft or rejected-state
    if (@article.state == 0) or (@article.state == 2)
      @article.state = 1
      @article.submitted = Time.now
      
      if @article.save
        flash[:notice] = 'Your article was successfully submitted for approval.'
      else
        flash[:error] = 'There was an error while submitting your article.'   
      end           
    else
      flash[:error] = 'This article can not be submitted.'  
    end
    
    respond_to do |format|
      format.html { redirect_to(:action => 'myarticles') }
      format.xml  { head :ok }
    end
  end
  def update
  @article = current_user.articles.find(params[:id])

  # if an article has already been accepted, the user is not allowed to change title and teaser
  if @article.state > 2
    params[:article].delete(:title)
    params[:article].delete(:teaser)
  end

  respond_to do |format|
    if @article.update_attributes(params[:article])
      format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
      format.xml  { head :ok }
    else
      format.html { render :action => "edit" }
      format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
    end
  end
end
  protected
  def record_not_found
    flash[:error] = 'The article you requested could not be found.'
    redirect_to root_url
  end  
  
end
