# == Schema Information
#
# Table name: shortners
#
#  id            :integer          not null, primary key
#  shortened_url :string
#  actual_url    :text
#  http_status   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ShortnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
