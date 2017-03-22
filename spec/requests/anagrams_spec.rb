require 'rails_helper'

RSpec.describe 'Anagram API', type: :request do
  let!(:word_1) { Word.create(word: "dare") }
  let!(:word_2) { Word.create(word: "dear") }

  describe 'GET /anagrams' do
    context 'fetch for words with anagrams' do

      it 'finds the anagrams' do
        get "/anagrams", params: {word: ["read"]}
        expect(JSON.parse(response.body)).to eq(["dare", "dear"])
      end
    end
  end
end
