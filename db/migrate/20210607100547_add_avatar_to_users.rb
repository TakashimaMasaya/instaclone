class AddAvatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :avatar, :string
  end
end