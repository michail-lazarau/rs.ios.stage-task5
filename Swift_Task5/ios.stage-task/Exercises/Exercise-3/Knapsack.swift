import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }

    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }

    func findMaxKilometres() -> Int {
        // building foodMatrix
        let wtFood = foods.map { Supply -> Int in
            Supply.weight
        }
        let valFood = foods.map { Supply -> Int in
            Supply.value
        }
        let foodMatrix = knapSack(p: maxWeight, w_i: wtFood, v_i: valFood)

        // building drinksMatrix
        let wtDrinks = drinks.map { Supply -> Int in
            Supply.weight
        }
        let valDrinks = drinks.map { Supply -> Int in
            Supply.value
        }
        let drinksMatrix = knapSack(p: maxWeight, w_i: wtDrinks, v_i: valDrinks)

        // finding the best solution
        let foodArr: [Int] = foodMatrix.last!
        let drinkArr: [Int] = drinksMatrix.last!.reversed()
        
        var maxDistance: Int = 0
        for i in stride(from: 0, to: foodArr.count, by: 1) {
            let val = min(foodArr[i], drinkArr[i])
            if val > maxDistance { maxDistance = val }
        }
         
        return maxDistance
    }
}

func knapSack(p: Int, w_i: [Int], v_i: [Int]) -> [[Int]] {
    let n = w_i.count
    var t = Array(repeating: Array(repeating: 0, count: p + 1), count: n + 1)
    for i in 0 ..< n + 1 {
        for j in 0 ..< p + 1 {
            if i == 0 || j == 0 {
                t[i][j] = 0
            } else if w_i[i - 1] <= j {
                t[i][j] = max(v_i[i - 1] + t[i - 1][j - w_i[i - 1]],
                              t[i - 1][j])
            } else {
                t[i][j] = t[i - 1][j]
            }
        }
    }

    return t
}
