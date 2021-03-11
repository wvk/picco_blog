module PiccoBlog
  class Comment < ActiveRecord::Base
    belongs_to :post

    acts_as_nested_set

    validate :more_than_one_word


    protected

    def more_than_one_word
      if self.text.length < 10 or self.text.split(/\s+/).size < 2
        self.errors.add :text, "ein Bisschen mehr darf's schon sein!"
      end
    end
  end
end
