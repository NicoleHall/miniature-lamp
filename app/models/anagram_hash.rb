class AnagramHash < ApplicationRecord
  serialize :sorted_word, JSON
end
