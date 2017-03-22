class AnagramsController < ApplicationController

  def show
    #require 'pry'; binding.pry
    word_passed_in = params[:word]
    json_response(word_passed_in)
  end

  private
  def anagram_params
    params.require(:word)
  end


end
