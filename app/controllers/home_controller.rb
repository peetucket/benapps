class HomeController < ApplicationController

  # this is the home page
  def index

  end

  def days_left
    @days_left = (Date.parse('2018-11-26') - Date.today).to_i
  end

end
