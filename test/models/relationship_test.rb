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
require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
