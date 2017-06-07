class UrlController < ApplicationController

	def index
		@urls = Shortner.all
	end

	def redirect
    @url = Shortner.find_by(shortened_url: params[:link])
    @url.update_attributes(updated_at: Time.now)
    redirect_to @url.actual_url, :status => @url.http_status and return
  end
end