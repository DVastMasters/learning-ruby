def stock_picker(stock_prices)
  best_profit = stock_prices.combination(2).reduce(Hash.new(0)) do |acc, combination|
    new_profit = combination[1] - combination[0] 
    next acc unless new_profit > acc[:profit]
    
    acc = {
      combination: combination,
      profit: new_profit
    }
  end

  days = [stock_prices.index(best_profit[:combination][0]), stock_prices.index(best_profit[:combination][1])]
end


p stock_picker([17,3,6,9,15,8,6,1,10])