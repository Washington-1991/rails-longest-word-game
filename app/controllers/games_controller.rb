class GamesController < ApplicationController
  def new
    all_letters = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
    @letters = []
    grid = []
    10.times { @letters << all_letters[rand(25)] }
  end

  def score
    @word = params[:word]
    @raw_letters = params[:letters]
    @letters = params[:letters].gsub(' ', '').split(//)
    @result = ''
    if attempt_inside_grid?(@word, @letters)
      if english_word?(@word)
        @result = 'win'
      else
        @result = 'noword'
      end
    else
      @result = 'nogrid'
    end
  end
end
