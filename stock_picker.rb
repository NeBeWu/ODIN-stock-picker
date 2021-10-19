# frozen_string_literal: true

def stock_picker(stock_prices)
  trades = Array.new(stock_prices.length - 1) do |buy_day|
    Array.new(stock_prices.length - 1 - buy_day) do |translated_sell_day|
      stock_prices[translated_sell_day + buy_day + 1] - stock_prices[buy_day]
    end
  end
  max_trade = trades.map { |same_buy_day_array| same_buy_day_array.max }.max
  day_to_buy = trades.map { |same_buy_day_array| same_buy_day_array.max }.index(max_trade)
  day_to_sell = trades[day_to_buy].index(max_trade) + day_to_buy + 1
  [day_to_buy, day_to_sell]
end
