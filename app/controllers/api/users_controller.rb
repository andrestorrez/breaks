class Api::UsersController < ApiController
	before_action :authenticate_user!

	def index
		render json: @current_user.teams.first.users.where.not(id: @current_user.id).order(id: :asc).to_json
	end

	def add_member
  	user = User.new user_admin_params
  	user.password = "123456"
  	user.teams << @current_user.teams.first

  	if user.save
  		render json: user.to_json
  	else
  		render json: {message: user.errors.messages}, status: 422
  	end
  end

  private
  	def user_admin_params
  		params.require(:user).permit :email, :password, :role, :start_working_date
  	end
end
