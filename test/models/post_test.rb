# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  avatar      :string(255)
#  description :text(65535)      not null
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
