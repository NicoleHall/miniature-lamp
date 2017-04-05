require 'rails_helper'

RSpec.describe Anagram, type: :model do
  it 'saves to the database with valid attributes' do
    anagram = Anagram.create!(sorted_word: "afrt", combinations: ["frat", "raft", "fart"])
    expect(anagram.combinations).to_not include("frat")
  end


  describe "#remove_invalid_combinations" do

    it 'removes invalid combinations when value does not exist in word table' do
      Word.create(word: "aal")
      anagram_with_invalid_combo = Anagram.new(sorted_word: "aal", combinations: ["aal", "ala"])

      anagram_with_invalid_combo.save
      expect(anagram_with_invalid_combo.combinations).to eq(["aal"])

    end

  end

  describe ".save_valid_combos_to_table" do
    it "populates the Anagram table with valid records" do
      expect{ Anagram.save_valid_combos_to_table }.to change{ Anagram.count }.from(0).to(50)
      #this should not pass
    end
  end
end
