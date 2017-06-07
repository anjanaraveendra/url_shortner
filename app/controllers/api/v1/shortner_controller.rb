class Api::V1::ShortnerController < ApplicationController

	def create
    url = Shortner.find_by(actual_url: shortner_params[:actual_url])
    unless url
    	shortner = Shortner.new(beautify_params)
    	if shortner.save
    		render json: { shortner: shortner }
    	else
    		render json: { errors: shortner.errors.full_messages }
    	end
    else
    	render json: { message: "Url already exists. Below are the details", url: url }
    end
	end

	private

	def beautify_params
		shortened_url = SecureRandom.hex(3)  
  	shortner_params.merge!(shortened_url: shortened_url, http_status: 301)
	end

	def shortner_params
		params.require(:shortner).permit(:actual_url)
	end
end