class AverageController < ApplicationController

  def index

  end

  def compute

    if request.post?
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
        @error_message = 'You must have at least 3 numbers.'
      else
        @average = @total / @size_of_list
      end

    else

      redirect_to action: :index

    end

  end

  private
  def is_number?(string)
    true if Float(string) rescue false
  end

end
