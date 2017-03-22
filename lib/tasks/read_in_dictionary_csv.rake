require 'csv'

namespace :db do

  desc "Import the dictionary CSV to database"
  task :words => :environment do
    counter = 0
    dictionary_path = "#{Rails.root}/lib/assets/dictionary.csv"
    CSV.foreach(dictionary_path) do |row|
      word = row
      imported_word = Word.create(word: word)
      puts "#{imported_word.errors.full_messages.join(", ")}" if imported_word.errors.any?
      counter += 1 if imported_word.persisted?
    end
    puts "Imported #{counter} words"
  end
end


#Imported 235886 words
