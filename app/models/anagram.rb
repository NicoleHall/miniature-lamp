class Anagram < ApplicationRecord

  before_save :remove_invalid_combinations

  def remove_invalid_combinations
    combinations.delete_if do |element|
       Word.find_by(word: element).nil?
    end
  end

  def self.save_valid_combos_to_table
    AnagramFinder.words_by_sorted_string.first(50).map do |nested_array|
      Anagram.create!(sorted_word: nested_array.first, combinations: nested_array.last)
    end
  end

end


#add a validation to make sure there are values in
#combinations before saving
