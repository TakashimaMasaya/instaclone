# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  action_type  :integer          not null
#  read         :boolean          default(FALSE), not null
#  subject_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  subject_id   :integer
#  user_id      :integer
#
# Indexes
#
#  index_activities_on_subject_type_and_subject_id  (subject_type,subject_id)
#  index_activities_on_user_id                      (user_id)
#
require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
