class CollaboratorsController < ApplicationController
  def create
    wiki = Wiki.find(params[:wiki_id])
    user = User.find(params[:user_id])
    collaborator = Collaborator.new(wiki: wiki, user: user)

    if collaborator.save
      flash[:notice] = "Collaborator saved"
    else
      flash[:error] = "Error saving collaborator.  Try again."
    end
    redirect_to edit_wiki_path wiki
  end

  def destroy
    wiki = Wiki.find(params[:wiki_id])
    collaborator = wiki.collaborators.where(user_id: (params[:id])).first
    if collaborator.destroy
      flash[:notice] = "Collaborator removed"
    else
      flash[:error] = "Error removing collaborator.  Try again."
    end
    redirect_to edit_wiki_path wiki
  end
end
