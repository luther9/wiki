class CollaboratorsController < ApplicationController
  def create
    collaborator = Collaborator.new
    collaborator.user = params[:user]
    collaborator.wiki = params[:wiki]
    collaborator.save
  end

  def destroy
    collaborator = Collaborator.find params[:collaborator]
    collaborator.destroy
  end
end
