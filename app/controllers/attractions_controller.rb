class AttractionsController < ApplicationController


def index
  @attractions = Attraction.all
end

def new
  @attraction = Attraction.new
end


def edit

  if current_user.admin

    @attraction = Attraction.find(params[:id])
  else
    render :index
  end
end


def show
  @attraction = Attraction.find(params[:id])
end



def update
  @attraction = Attraction.update(params[:id], attraction_params)
  render :show
end

def create
  if current_user.admin
 
  else 
    render :show
  end
end


def new_ride

  redirect_to user_path(current_user)
end
# def destroy
# end



def login
  @attraction = Attraction.new
end



private

# def set_attraction
#   @attraction = Attraction.find(params[:id])
# end

def attraction_params
  params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
end


end


