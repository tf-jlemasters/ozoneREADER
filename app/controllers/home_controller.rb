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
    
    if @final_output == 'Non-applicable Zip-Code'
      @api_color = 'gray'
    elsif @final_output <= 50
      @api_color = 'green'
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = 'yellow'
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = 'orange'
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = 'red'
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = 'purple'
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = 'maroon'
    end
  end
end
