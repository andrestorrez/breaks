class Team < ApplicationRecord
  belongs_to :country
  has_and_belongs_to_many :users

  validates :name, uniqueness: true
  validates_presence_of :name, :country_id


  def as_json(attr = {})
  	{name: name, country: {name: country.try(:name), iso: country.try(:iso), lang: country.try(:iso)}}
  end
end
