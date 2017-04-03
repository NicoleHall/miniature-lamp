require 'rails_helper'

RSpec.describe 'AnagramFinder' do
  describe 'AnagramFinder' do
    context 'AnagramFinder' do
      let!(:anagram_finder) { AnagramFinder }

        it "sorts the letters in a word" do
          expect(anagram_finder.sorted_string("read")).to eq("ader")
        end

        it "can identify if two strings are anagrams" do
          expect(anagram_finder.anagram?("dare", "read")).to be(true)
        end

        it "can read in the dictionary.txt file and removes capitals" do
          expect(anagram_finder.words.first(5)).to eq(["a", "a", "aa", "aal", "aalii"])
          expect(anagram_finder.words.first).not_to eq(["A"])
        end

        it "should set the hash up properly" do
          allow(anagram_finder).to receive(:words).and_return(["dare", "dear"])
          #words = anagram_finder.words
          expect(anagram_finder.words_by_sorted_string).to eq({"ader"=>["dare", "dear"]})
        end

        it "should return a hash where the sorted_string is the key and the value is an array of anagrams" do
          allow(anagram_finder).to receive(:words_by_sorted_string).and_return({"ader"=>["dare", "dear"]})
          expect(anagram_finder.return_anagrams_hash).to eq({"ader"=>["dare", "dear"]})
        end

    end
  end
end
