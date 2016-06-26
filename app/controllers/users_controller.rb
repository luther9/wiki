class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def downgrade
    @user = User.find params[:user_id]
    @user.update_attribute :role, :standard
    flash[:notice] = 'You are now a standard user.'
    redirect_to user_path @user
  end
end
