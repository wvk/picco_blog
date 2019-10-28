# This migration comes from picco_blog (originally 20181027654987)
if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  class CreatePiccoBlogImages < ActiveRecord::Migration[4.2]; end
else
  class CreatePiccoBlogImages < ActiveRecord::Migration; end
end

CreatePiccoBlogImages.class_eval do
  def change
    create_table :picco_blog_images do |t|
      t.integer :author_id
      t.string :description
      t.string :slug

      t.string :image_uid
      t.string :image_name

      t.timestamps null: false

      t.index ["slug"], name: "index_picco_blog_images_on_slug"
      t.index ["author_id"], name: "index_picco_blog_images_on_author_id"
    end
  end
end
