module PiccoBlog
  class Post < ActiveRecord::Base
    include Authored
    extend FriendlyId
    friendly_id :title, use: [:slugged, :history]
    acts_as_taggable_on :tags
    dragonfly_accessor :featured_image

    paginates_per PiccoBlog.posts_per_page

    has_many :comments

    validates :title, :text, :state, presence: true
    validates_property :format, of: :featured_image, in: [:jpeg, :jpg, :png], case_sensitive: false,
                        message: "should be either .jpeg, .jpg, .png", if: :featured_image_changed?

    enum state: [:visible, :hidden]

    private

    def self.search(term)
      posts = self.arel_table
      query_string = "%#{term}%"
      param_matches_string =  ->(param){
        posts[param].matches(query_string)
      }

      self.where(param_matches_string.(:title).or(param_matches_string.(:text)))
    end

  end
end
