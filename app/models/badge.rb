class Badge < ActiveRecord::Base
  has_and_belongs_to_many :archivements
end
