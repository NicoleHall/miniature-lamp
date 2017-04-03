class AddColumnToAnagramHashs < ActiveRecord::Migration[5.0]
  def change
    add_column :anagram_hashes, :sorted_word, :string
  end
end
