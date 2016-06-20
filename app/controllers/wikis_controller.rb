class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = 'Wiki was saved successfully.'
      redirect_to @wiki
    else
      flash.now[:alert] = 'There was an error saving the wiki.'
      render :new
    end
  end

  def show
    @wiki = Wiki.find params[:id]
  end

  def edit
    @wiki = Wiki.find params[:id]
  end

  def update
    @wiki = Wiki.find params[:id]
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = 'Wiki was updated successfully.'
      redirect_to @wiki
    else
      flash.now[:alert] = 'There was an error saving the wiki.'
      render :edit
    end
  end

  def destroy
  end
end
