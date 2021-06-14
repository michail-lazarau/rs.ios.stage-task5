import UIKit

class MessageDecryptor: NSObject {
    
//    struct ValueInBrackets {
//        var numToRepeat: Int
//        var outSize: Int
//    }
    
    func decryptMessage(_ message: String) -> String {
        var intArr: [Int] = [Int]()
        var stringArr: [String] = [String]()
        var storeString: String = ""
        var numToRepeat: Int? //num * 10 - изменение разрядности
        
        for value in message{
            if value.isNumber {
                numToRepeat = numToRepeat != nil ? numToRepeat! * 10 + Int(String(value))! : Int(String(value))!
            } else if value == "[" {
                if numToRepeat != nil{
                    intArr.append(numToRepeat!)
                }
                numToRepeat = 0
                stringArr.append(String(storeString))
                storeString = ""
            } else if value == "]" {
                var temp = stringArr.popLast()
                let iterator: Int = intArr.popLast() ?? 1
                guard iterator != 0 else {
                    return ""
                }
                for _ in 0...iterator-1 { // стремное преобразование sequence
                    temp?.append(storeString)
                    }
                storeString = temp!
            } else {
                storeString = storeString + String(value)
            }
            
        }
        return storeString
    }
}
