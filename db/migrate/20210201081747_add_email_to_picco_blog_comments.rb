class AddEmailToPiccoBlogComments < ActiveRecord::Migration[5.2]
  def self.up
    add_column :picco_blog_comments, :email,          :string

    add_column :picco_blog_comments, :parent_id,      :integer
    add_column :picco_blog_comments, :lft,            :integer
    add_column :picco_blog_comments, :rgt,            :integer
    add_column :picco_blog_comments, :depth,          :integer
    add_column :picco_blog_comments, :children_count, :integer, null: false, default: 0

    PiccoBlog::Comment.reset_column_information
    PiccoBlog::Comment.rebuild!
  end

  def self.down
    remove_column :picco_blog_comments, :parent_id
    remove_column :picco_blog_comments, :lft
    remove_column :picco_blog_comments, :rgt
    remove_column :picco_blog_comments, :depth
    remove_column :picco_blog_comments, :children_count
  end
end
