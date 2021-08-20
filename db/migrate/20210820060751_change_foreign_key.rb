class ChangeForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :subject_type, :string
    remove_reference :activities, :subject, foreign_key: true
    add_reference :activities, :subject, polymorphic: true, index: true
  end
end
