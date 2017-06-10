class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @beers = @user.beers


    render("users/show.html.erb")
  end

  def my_likes
    @user = current_user
    @likes = current_user.likes

    render("my_likes.html.erb")

  end

end
