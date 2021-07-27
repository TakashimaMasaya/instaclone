class RemoveFollowedIdIdFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships,followed_id_id, :bigint
  end
end
