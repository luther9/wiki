class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def new
  end

  def show
  end

  def edit
  end

  def destroy
  end
end
