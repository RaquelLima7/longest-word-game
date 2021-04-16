require "open-uri"

class PagesController < ApplicationController
    def new
      @letters = ("A".."Z").to_a.sample(10)
    end

    def score
      @word = params[:word].upcase
      @letters = params[:letters].split
      @words_include = words_include?(@word, @letters)
      @english_word = english_word?(@word)
    end

    def words_include?(word, letters)
      @word.chars.all? { |letter| word.count(letter) <= letters.count(letter)} 
    end

    def english_word?(word)
      response = open("https://wagon-dictionary.herokuapp.com/#{word}")
      json = JSON.parse(response.read)
      json["found"]
    end
end
