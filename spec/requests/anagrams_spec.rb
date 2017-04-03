require "rails_helper"

RSpec.describe "Anagram API", type: :request do

  describe "GET /anagrams" do
    context "fetch for words with anagrams" do
      xit "finds the anagrams" do
        get "/anagrams", params: {word: ["read"]}
        expect(JSON.parse(response.body)).to eq(["dare", "dear"])
        expect(response).to have_http_status(200)
      end
    end

    context "fetch for words with no anagrams" do
      xit "does not find any anagrams" do
        get "/anagrams", params: {word: ["zyxwv"]}
        expect(JSON.parse(response.code)).to eq("Unexpected response code")
        expect(Anagram.all.size).to eq(0)
        expect(response).to have_http_status(200)
      end
    end
  end
end
