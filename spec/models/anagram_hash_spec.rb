require 'rails_helper'

RSpec.describe AnagramHash, type: :model do
  xit "is valid with valid attributes" do
    single_anagram_hash = AnagramHash.create(sorted_word: {"afrt" => ["frat", "raft"]})
    expect(AnagramHash.all.count).to be(1)
  end
end
