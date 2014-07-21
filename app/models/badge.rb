class Badge < ActiveRecord::Base

  has_many :archivements
  has_many :users, through: :archivements

end
