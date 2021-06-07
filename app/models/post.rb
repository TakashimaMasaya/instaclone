# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  avatar      :string(255)
#  description :string(255)      not null
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
class Post < ApplicationRecord
  mount_uploader :avatar, PostImageUploader
  # mount_uploaders :avatar, PostImageUploader

end
