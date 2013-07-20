class Url < ActiveRecord::Base

  def self.search_for(query)
    Url.where("url LIKE :query OR description LIKE :query", query: "%#{query}%")
  end
end
