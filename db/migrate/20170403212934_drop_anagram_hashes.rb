class DropAnagramHashes < ActiveRecord::Migration[5.0]
  def change
    drop_table :anagram_hashes
  end
end
