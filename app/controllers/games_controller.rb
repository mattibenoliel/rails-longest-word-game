require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters_random = (0...10).map { ('A'..'Z').to_a[rand(26)] }
    @letters_random
  end

  def score
    # params[:word] -> decomper chaque lettre et verif si chacune est presente ds params[:letter_choice]
    hash_back = JSON.load(open("https://wagon-dictionary.herokuapp.com/#{params[:word]}"))
    if params[:word] == ""
      return @result = 'Vide'
    else
      if params[:word].upcase.split(//).all? { |letter| params[:letters_choice].include?(letter) }
        if hash_back['found'] == true
          @result = 'mot anglais et correspond'
          @result
        else
          @result = 'No English'
          @result
        end
      else
        @result = 'Lettre pas inclus'
        @result
      end
    end
  end

end
