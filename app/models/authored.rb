module Authored
  extend ActiveSupport::Concern

  included do
    before_validation :set_author

    attr_accessor :author_id

    belongs_to :author, class_name: PiccoBlog.author_class.to_s
  end

  protected

  def set_author
    self.author = PiccoBlog.author_class.constantize.find(author_id)
  end

end
