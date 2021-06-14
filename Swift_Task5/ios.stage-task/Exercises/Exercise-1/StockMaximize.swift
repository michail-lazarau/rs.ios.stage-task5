import Foundation

class StockMaximize {
    func countProfit(prices: [Int]) -> Int {
        var pricesMutable = prices
        return countProfitWithInoutArray(prices: &pricesMutable)
    }
    
    func countProfitWithInoutArray(prices :inout [Int]) -> Int {
        var total: Int = 0
        while prices.count > 1 {
            // first cуществует только в скоупе
            let first = prices.first!
            prices = Array(prices.dropFirst())
            if let max = prices.max() {
                if max > first {
                    total += max - first
                }
            }
        }
        return total
    }
}
