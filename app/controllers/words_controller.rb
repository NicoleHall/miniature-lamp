class WordsController < ApplicationController

  #todo: handle errors for create. if words aren't created don't send a 201

  def create
    new_words = []
    #because of the transaction method it will take the logic and wrap it
    # in one sql statement not 10,000 individual ones

    Word.transaction do
      new_words = word_params.map do |word|
        Word.create(word: word)
      end
    end
    json_response(new_words, 201)
  end


  def destroy
    # - `DELETE /words/:word.json`: Deletes a single word from the data store.
    word_passed_in = params[:id]
    Word.find_by(word: word_passed_in).destroy
    json_response(word_passed_in)
  end

  def delete_all
    # - `DELETE /words.json`: Deletes all contents of the data store.
    #delete_all is faster than destroy_all b/c it ignores as much ruby on rails
    #destroy all is going to instantiate each record which we don't need
    deleted_count = Word.delete_all
    json_response(deleted_count, 204)
  end



  private
  def word_params
    params.require(:word)
  end


end
