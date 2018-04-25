class CoinsController < ApplicationController
  before_action :authenticate_user!

  def update
    coin = Coin.find_by(params[:id])
    coin.coin_name = params[:coin_name]
    coin.symbol = params[:symbol]
    coin.price_usd = params[:price_usd]
    coin.percent_change_1h = params[:percent_change_1h]
    coin.percent_change_24h = params[:percent_change_24h]
    coin.percent_change_7d = params[:percent_change_7d]

    coin.save
    redirect_to root_url
  end

  def edit
    @coin = coin.find_by(params[:id])
  end

  def new
   @coin = coin.new
  end

  def create

    puts "coin created", params.inspect

    @new_coin = Coin.create(
    coin_name: params[:coin][:coin_name],
    symbol: params[:coin][:symbol],
    price_usd: params[:coin][:price_usd],
    percent_change_1h: params[:coin][:percent_change_1h],
    percent_change_24h: params[:coin][:percent_change_24h],
    percent_change_7d: params[:coin][:percent_change_7d]

    )

    puts "newcoin", @new_coin

    @portfolio = Portfolio.find(params[:coin][:portfolios])
    @portfolio.coins << @new_coin

    if @new_coin
      redirect_to "/portfolios/#{@portfolio.id}"
    else
      render 'new'
    end
  end

  def index
    @user = current_user
    @portfolios = @user.portfolios

  end

  def show
    @coin = Coin.find(params[:id])
    puts "hey"
    puts @coin.portfolio_ids
    @symbol = @coin.symbol
    @coinName = @coin.coin_name.downcase.parameterize(separator: '-')

    @response = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/#{@coinName.downcase}")

    @feed = HTTParty.get("http://webhose.io/filterWebContent?token=c4300877-e351-4571-bb45-460143af3204&format=json&sort=crawled&q=#{@coin.coin_name}%20language%3Aenglish%20site_type%3Anews%20language%3Aenglish")
    @feeds = @feed['posts']
    @feeds.each do |post|
      puts post['thread']['title'] 
    end 
    @coininfo = @response[0]
  end


  def destroy
    
    @portCoin = Coin.find(params[:id])
    puts "hey"
    puts @portCoin.portfolio_ids
    @portCoin.destroy
    redirect_to current_user
  end

end