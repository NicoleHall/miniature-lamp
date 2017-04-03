require 'rails_helper'

RSpec.describe 'Anagram API', type: :request do
  let!(:word_1) { Word.create(word: "a") }
  let!(:word_2) { Word.create(word: "b") }
  let!(:word_3) { Word.create(word: "c") }

  # def json returns this: JSON.parse(response.body)

  describe 'POST /words' do

    context 'when the request is valid' do

      it 'adds a single word to the corpus' do
        post "/words", params: {word: ["banana"]}
        expect(Word.count).to eq(4)
        expect(json.first['word']).to eq("banana")
        expect(response).to have_http_status(201)
      end

      it 'adds a mulitple words to the corpus' do
        post "/words", params: {word: ["peach", "cherry"]}
        expect(Word.count).to eq(5)
        expect(json.first['word']).to eq("peach")
        expect(json.second['word']).to eq("cherry")
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'DELETE /words' do
    before { delete "/words" }

    it 'has no words in the db' do
      expect(Word.count).to eq(0)
      expect(response).to have_http_status(204)
    end
  end

  describe 'DELETE /word' do
    it 'deletes a single word from the corpus' do
      delete "/words/a"
      expect(Word.find_by(word: "a")).not_to be_present
      expect(Word.count).to eq(2)
      expect(response).to have_http_status(200)
    end
  end
end
