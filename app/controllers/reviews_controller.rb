class ReviewsController < ApplicationController
   before_filter :login_required, :only => ["new", "create", "edit", "update"]

  def index
    @reviews = Review.all
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def new
    @review = Review.new
    respond_to do |wants|
      wants.html

    end
    
  end
  
  def create
    @review = Review.new(params[:review])
    respond_to do |wants|
      if @review.save
        wants.html do
          flash[:notice] = "Successfully created review."
          redirect_to @review
        end

      else
        wants.html { render :action => 'new' }
        
      end
    end
  end
  
  def edit
    @review = Review.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end
  
  def update
    @review = Review.find(params[:id])
    respond_to do |wants|
      if @review.update_attributes(params[:review])
        wants.html do
          flash[:notice] = "Successfully updated review."
          redirect_to @review
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Successfully removed review."
    redirect_to reviews_url
  end
end
