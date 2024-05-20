require 'open-uri'

class GamesController < ApplicationController
  @letters
  def new
    @letters = []
    10.times { @letters << ("A".."Z").to_a.sample }
  end

  def score
    letters = params[:letters].chars
    check1 = params[:answer].chars.all? { |letter| letters.include?(letter.upcase) }
    check2 = false
    if check1
      url = "https://dictionary.lewagon.com/#{params[:answer]}"
      html = URI.open(url).read
      json = JSON.parse(html)
      check2 = json["found"]
      if check2
        @result = 3
      else
        @result = 2
      end
    else
      @result = 1
    end
  end
end
