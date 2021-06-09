# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  description :text(65535)      not null
#  images      :string(255)
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
class Post < ApplicationRecord
  mount_uploader :images, PostImageUploader
  # mount_uploaders :images, PostImageUploader

end
