class AddFollowToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :followed_id, :integer
    add_column :relationships, :follower_id, :integer

    add_reference :relationships, :followed_id, foreign_key: true 
    add_reference :relationships, :follower_id, foreign_key: true 
  end
end
