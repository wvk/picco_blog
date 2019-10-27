module PiccoBlog
  class Comment < ActiveRecord::Base
    belongs_to :post
  end
end
