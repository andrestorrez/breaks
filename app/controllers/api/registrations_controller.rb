class Api::RegistrationsController < ApiController

	before_action :authenticate_user!, only: [:reset_password, :change_password, :update]

  def sign_up
  	user = User.new(user_params)
  	country = Country.find_by(country_params) || Country.new(country_params)
  	team = Team.new(team_params)

  	user.teams << team
  	team.country = country

  	if user.save
  		render json: user.to_json
  	else
  		render json: {message: user.errors.messages}, status: 422
  	end
  end

  def reset_password
  end

  def change_password
  end

  def update
  end


  private

  	def user_params
  		params.require(:user).permit :email, :password
  	end

  	def team_params
  		params.require(:team).permit :name
  	end

  	def country_params
  		params.require(:country).permit :name, :iso, :lang
  	end
end
