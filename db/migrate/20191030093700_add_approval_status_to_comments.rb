class AddApprovalStatusToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :picco_blog_comments, :approved, :boolean, default: false
  end
end
