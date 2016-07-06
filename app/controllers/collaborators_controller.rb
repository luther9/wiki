class CollaboratorsController < ApplicationController
  def create
    collaborator = Collaborator.new
    collaborator.user_id = params[:user]
    collaborator.wiki_id = params[:wiki]
    collaborator.save
    redirect_to wiki_path collaborator.wiki_id
  end

  def destroy
    collaborator = Collaborator.find params[:id]
    collaborator.destroy
    redirect_to wiki_path collaborator.wiki_id
  end
end
