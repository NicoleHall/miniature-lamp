class AnagramsController < ApplicationController

  def show
    word_passed_in = params[:word].first

    sorted_string = AnagramFinder.sorted_string(word_passed_in)
    words = AnagramFinder.words
    words_by_sorted_string = AnagramFinder.words_by_sorted_string
    anagram_hash = AnagramFinder.return_anagrams_hash
    json_response(anagram_hash.values)
  end

  private
  def anagram_params
    params.require(:word)
  end

end
