class AnagramsController < ApplicationController

  def show
    require 'pry'; binding.pry

    word_passed_in_with_uri = params[:word]
    anagram_hash = {"afrt" => ["raft", "fart"]}
    json_response(anagram_hash.values)
  end

  private
  def anagram_params
    params.require(:word)
  end

  def set_limit
    if params[:limit].present?
      @limit = params[:limit].to_i ||= 3
    end
  end

end
