# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  description :text             not null
#  images      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, PostImageUploader
  serialize :images, JSON

  validates :images, presence: true
  validates :description, presence: true, length: { maximum: 1000 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  scope :body_contain, ->(word) { where('description LIKE ?', "%#{word}%") }
  scope :comment_body_contain, ->(word) { joins(:comments).where('comments.body LIKE ?', "%#{word}%") }
  scope :username_contain, ->(word) { joins(:user).where('username LIKE ?', "%#{word}%") }
end
