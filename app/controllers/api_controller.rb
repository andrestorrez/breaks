class ApiController <  ActionController::API



	protected
		def authenticate_user!
			@current_user = User.find_by token: params[:auth_token]
			render json: {message: "User not authenticated!"}, status: 422 unless @current_user
		end
end
