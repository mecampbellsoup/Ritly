class Url < ActiveRecord::Base
  validates :link, :hash_code, presence: true 

end