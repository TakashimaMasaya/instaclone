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
require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
