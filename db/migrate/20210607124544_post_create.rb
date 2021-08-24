class PostCreate < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.bigint :user_id

      t.timestamps
    end
  end
end
