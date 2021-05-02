class UsersController < ApplicationController
    # before_action :authenticate, only: [:me, :update]

    def index
        users = User.all 
        render json: users 
    end 

    def login
        user = User.find_by(name: params[:name])
        # if user && user.authenticate(params[:name])
            render json: user
        # else 
        #     render json: {errors:  ["invalid user"]}
        # end
    end 

    def me
        # checking some identifying info about the request 
        render json: @current_user
    end 

    def show 
        user = User.find(params[:id])
        render json: user
    end 

    def create
        user = User.create(user_params)
        render json: user 
    end 

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end 

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end 

    def favorites
        user = User.find(params[:id])
        render json: user.favorites
    end 

    private 

    def user_params 
        params.permit(:name, :age, :lifestyle)
    end 

end