class ApplicationController < ActionController::Base
  before_filter :authenticate_user!, :except => [:index, :show, :about]

  protect_from_forgery
  def all
    @articles = Article.where(:state => ['3', '4'])
    
    respond_to do |format|
      format.html { render 'index' }                  # uses the same view as the default index
      format.xml  { render :xml => @articles }
    end
  end

  def about
  end
end
