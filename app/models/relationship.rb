# == Schema Information
#
# Table name: relationships
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  followed_id    :integer
#  followed_id_id :bigint
#  follower_id    :integer
#
# Indexes
#
#  index_relationships_on_followed_id_id  (followed_id_id)
#
class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validates :follower_id, uniqueness: { scope: :followed_id }
end


