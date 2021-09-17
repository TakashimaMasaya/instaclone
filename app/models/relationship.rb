# == Schema Information
#
# Table name: relationships
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  followed_id    :integer
#  followed_id_id :integer
#  follower_id    :integer
#  follower_id_id :integer
#
# Indexes
#
#  index_relationships_on_followed_id_id  (followed_id_id)
#  index_relationships_on_follower_id_id  (follower_id_id)
#
class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validates :follower_id, uniqueness: { scope: :followed_id }

  after_create_commit :create_activities

  private

  def create_activities
    Activity.create(subject: self, user: followed, action_type: :followed_me)
  end
end


