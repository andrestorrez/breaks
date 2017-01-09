class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :teams
  has_many :vacation_requests
  has_many :accounts
  has_secure_token

  before_save :set_days_available

  def as_json(attr = {})
  	{email: email, token: token, teams: teams, role: role, available_days: available_days, days_left: days_left}
  end


  def admin?
  	role==0
  end

  def user?
  	!admin?
  end

  def days_left
    available_days - vacation_requests.where("start_date > ? ", Time.now.beginning_of_year).approved.map(&:total_days).sum.to_i
  end

  private
    def vacations_select
      VacationRequest.select("(EXTRACT(DOY FROM end_date) - EXTRACT(DOY FROM start_date)) as total_days ").where(user_id: id)
    end

    def set_days_available
      if !start_working_date.blank? && (total = Time.now.year - start_working_date.year)
        total = 1 if total <= 0
        case total
        when 1
          self.available_days = 10
        when 2
          self.available_days = 12
        when 3
          self.available_days = 15
        else
          self.available_days = 20
        end
      end
      true
    end
end
