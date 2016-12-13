class VacationRequest < ApplicationRecord

	attr_accessor :total_days

  belongs_to :user
  belongs_to :admin, foreign_key: "admin_user_id", class_name: "User"

  validates_presence_of :start_date, :end_date

  scope :approved, ->{where(accepted: true)}


  def as_json(attr = {})
  	{id: id, start_date: start_date, end_date: end_date, message: message || "", comments: comments || "",
  		approved: accepted, rejected: rejected, user: user, admin: admin, range: get_short_date_range}
  end

  def get_short_date_range
    start_date.blank? || end_date.blank? ? "--" : "#{start_date.strftime("%b %d")} - #{end_date.strftime("%b %d")}"
  end

  def get_long_date_range
    start_date.blank? || end_date.blank? ? "--" : "#{start_date.strftime("%b %d, %Y")} - #{end_date.strftime("%b %d, %Y")}"
  end

  def total_days
  	end_date - start_date
  end
end
