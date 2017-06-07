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

class Shortner < ApplicationRecord
  validates :actual_url, presence: true
  validates_format_of :actual_url, with: URI.regexp(%w[http https])
  validates_uniqueness_of :shortened_url, case_sensitive: false
end
