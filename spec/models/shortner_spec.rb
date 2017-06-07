require 'spec_helper'

RSpec.describe Shortner, :type => :model do

  subject {
    Shortner.new(actual_url: "https://mail.google.com/mail/u/1/", shortened_url: "18dcf5", http_status: 301)
  }
  
  it "is valid with valid attributes(url format)" do
  	expect(subject).to be_valid
  end

  it "is not valid without a actual_url" do
	  expect(Shortner.create(actual_url: nil)).to_not be_valid
	end

	it "is not valid without a http_status" do
	  expect(Shortner.create(http_status: nil)).to_not be_valid
	end
end