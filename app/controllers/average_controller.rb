class AverageController < ApplicationController

  def index

  end

  def compute

    list_of_characters = params[:numbers].split(',')

    @list_of_numbers = []
    @size_of_list = 0
    @total = 0

    list_of_characters.each do |number|
      if is_number?(number)
        @total = @total + number.to_f
        @size_of_list = @size_of_list + 1
        @list_of_numbers << number
      end
    end

    if @size_of_list < 3
      flash[:error] = 'You must have at least 3 numbers.'
      redirect_to action: index
    else
      @average = @total / @size_of_list
    end

  end

end
