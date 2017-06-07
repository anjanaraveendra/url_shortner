require 'spec_helper'

describe UrlController do
  describe "Get list of urls" do
    it "show a list of all users" do
      a = []
      a << Shortner.create(shortened_url: "008833", actual_url: "https://mail.google.com/mail/u/1/", http_status: 301)
      a << Shortner.create(shortened_url: "000013", actual_url: "https://www.google.com", http_status: 301)
      get :index
      expect(a.size).to eq 2
    end
  end
end

