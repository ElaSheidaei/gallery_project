class AddUserIdToGalleries < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :user_id, :integer
    add_index :galleries, :user_id
    # add_refrences :galleries, :user
  end
end
