module PiccoBlog
  class Image < ActiveRecord::Base
    include Authored
    extend FriendlyId
    friendly_id :name, use: [:slugged, :history]

    dragonfly_accessor :image

    validates_property :format,
        of: :image,
        in: [:jpeg, :jpg, :png],
        case_sensitive: false,
        message: "should be either .jpeg, .jpg, .png",
        if: :image_changed?

    default_scope -> { order(created_at: :desc) }

    def name
      self.image_name
    end

  end
end
