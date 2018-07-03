class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #@user = User.new()
    #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
   @user = User.new(user_params)
   if @user.save
    redirect_to new_user_path
    else
    render 'new'
   end
  end

def edit
 @user = User.find(params[:id])

render 'new'
end


def update
  @user = User.find(params[:id])
  @user.update(username: params[:username], email: params[:email],password: params[:password])

end

  private

   # gives us back just the hash containing the params we need to
   # to create or update a post
   def user_params
     params.require(:user).permit(:username,:email,:password)
   end
end
