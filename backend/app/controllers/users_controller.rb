class UsersController < ActionController::API
    
    def create
        @user = User.create!(create_params)
        render json: { user: @user}
    rescue StandardError => e
        render json: { error: e }, status: :bad_request
    end

    def read
        instance = User.find_by!({ id: "42" })
        render status: :created
    rescue StandardError => e
        render json: { error: e }, status: :bad_request
    end

    def readAll
        @user = User.all
        render json: @user, status: :ok
    end

    def create_params
        params.require(:user).permit(:name, :email, :cpf)
    end

    def read_params
        params.require(:user).permit(:id)
    end
end

=begin 

params = 
ActionController::Parameters.new(
    user: { name: "Francesco", 
            email: something@gmail, 
            cpf: "123456789" })

=end

