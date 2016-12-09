class Api::AuthController < ApiController
  def log_in
  	user = User.find_by(email: params[:email])
  	if user && user.valid_password?(params[:password])
  		render json: user.to_json
  	else
  		render json: {message: "Wrong Crendentials"}, status: 422
  	end
  end

  def log_out
  end
end
