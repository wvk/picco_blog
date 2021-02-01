module PiccoBlog
  class Comment < ActiveRecord::Base
    belongs_to :post

    acts_as_nested_set
  end
end
