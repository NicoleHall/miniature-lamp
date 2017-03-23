require "rails_helper"

RSpec.describe "Anagram API", type: :request do

  describe "GET /anagrams" do
    context "fetch for words with anagrams" do

      it "finds the anagrams" do
        get "/anagrams", params: {word: ["read"]}
        expect(JSON.parse(response.body)).to eq(["dare", "dear"])
        expect(response).to have_http_status(200)
      end
    end
  end
end
