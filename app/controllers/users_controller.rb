class UsersController < ApplicationController
  # before_each: set_user

def new
  @user = User.new
end

def show
end

def index
end

def update
end

def create

  @user = User.new(user_params)
   binding.pry
  if @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  else
    render :new
  end

end

# def destroy
# end

def edit
  set_user
end

def login
  @user = User.new
end

private

def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :admin, :password, :password_confirmation)
end




end


