class QuotesController < ApplicationController


  def search_form_yahoo_yql
  # display form for searching omdb db
  end

  def index
    @message = "yahoo yql"

    @coin_name = params["get_quote"].downcase.parameterize(separator: '-')
    @response = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/#{@coin_name}")
    puts @response
    @user = current_user
    @portfolios = @user.portfolios
    @coin = @response[0]
    puts @coin
    @coinName = @coin['name']
    @coinSym = @coin['symbol']
    puts @coinName
    # @symbol = @response['query']['results']["quote"]['symbol']
    # @company_name = @response['query']['results']["quote"]['Name']
    # @stock = StockQuote::Stock.quote(@symbol)
  end


end
