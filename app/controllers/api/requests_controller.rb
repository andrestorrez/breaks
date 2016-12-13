class Api::RequestsController < ApiController

	before_action :authenticate_user!
	before_action :set_request, only: [:update]

	def index
		requests = @current_user.admin? ? @current_user.teams.first.vacation_requests.order(id: :asc) : @current_user.vacation_requests.order(id: :desc)
		render json: requests
	end

	def create
		request = VacationRequest.new request_params
		request.user = @current_user
		if request.save
			render json: request
		else
			render json: {message: request.errors.messages}, status: 422
		end
	end

	def update
		@request.assign_attributes(request_admin_params)
		@request.admin = @current_user
		if @current_user.admin? && @request.save
			render json: @request
		else
			render json: {message: @request.errors.messages}, status: 422
		end
	end

	private
		def set_request
			@request = VacationRequest.find_by id: params[:id]
		end

		def request_params
			params.require(:vacation_request).permit :start_date, :end_date, :message
		end

		def request_admin_params
			params.require(:vacation_request).permit :comments, :accepted, :rejected
		end
end
