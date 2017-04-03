class AnagramFinder

  def self.sorted_string(string)
    string.chars.sort.join
  end

  def self.anagram?(string_1, string_2)
    sorted_string(string_1) == sorted_string(string_2)
  end

  def self.words
    File.readlines("lib/assets/dictionary.txt").map do |line|
      line.chomp.downcase
    end
  end

  def self.words_by_sorted_string#(word_from_params)
    words.each_with_object(Hash.new []) do |word, hash|
      hash[sorted_string(word)] += [word]
    end
  end

  def self.return_anagrams_hash
    anagram_hash = Hash.new
    words_by_sorted_string.keys.sort.map do |sorted_string|
      anagram_hash[sorted_string] = words_by_sorted_string[sorted_string]
    end
    anagram_hash
  end
end
