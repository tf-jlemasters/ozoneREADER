class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=11050&distance=0&API_KEY=D941B95C-C2F2-42E7-A0E5-5D71DFB59939'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
      
    # Check for empty input
    if @output.empty?
      @final_output = 'Non-applicable Zip-Code'
    elsif  !@output
      @final_output = 'Non-applicable Zip-Code'
    else
      @final_output = @output[0]['AQI']
    end
  end
end
