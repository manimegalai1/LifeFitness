import UIKit

// Question 1

/* Write code to calculate the optimum number of coins (the coins are 1c, 5c, 10c, 20c, 50c and
$1) to return when giving change after a purchase. For example: the optimum coins for $1.90
are 1 x $1, 1 x 50c and 2 x 20c. */

func optimalCoins(amount: Double) -> String {
    var value = amount + 0.001
    var i = 0
    var aryCoin = [0, 0, 0, 0, 0, 0] as [Double]
    let aryValue = [1, 0.5, 0.2, 0.1, 0.05, 0.01]
    let aryString = ["x1$,", "x50c,", "x20c,", "x10c,", "x5c,", "x1c"]
    var strResult = ""

    while value > 0.01 {

        aryCoin[i] = (value / aryValue[i] ).rounded(.towardZero)
        if aryCoin[i] > 0
            {
                strResult = strResult + " \(aryCoin[i])" + aryString[i]
            }
        value = value.truncatingRemainder(dividingBy: aryValue[i])
        i += 1
    }
    return strResult
}

print("Question 1 Output :\n \(optimalCoins(amount: 1.9)) \n")

/* ---------------------------------------------------------------------------------------------- */

// Question 2

// Write a code which rotates the pattern 90 degrees counter-clock-wise.

func rotateArray(ary2d : [[Int]]){
    
    let row = ary2d.count - 1
    let col = ary2d[0].count - 1

    var ary2dreversed = Array(repeating: Array(repeating: 0, count: row+1), count: col+1)

    for m in 0...row
    {
     for n in 0...col
     {
       ary2dreversed[col-n][m] = ary2d[m][n]
     }
    }
    
    print("\nQuestion 2 Output :")
    for m in 0...col {print(ary2dreversed[m])}
    
}

rotateArray(ary2d: [ [1,1,0,0],
[1,1,0,0],
[1,1,0,0],
[1,1,1,1],
[1,1,1,1] ])

/* ---------------------------------------------------------------------------------------------- */

//Question 5

/* For each test case, output one line containing Case #x: y, where x is the test case number
(starting from 1) and y is the last number that Nanny will name before falling asleep,
according to the rules described in the statement. */

func sleepTask(aryNum : [Int]){
    
    print("\nQuestion 5 Output :")
    for (index, element) in aryNum.enumerated()
    {
        var Digits = [0,1,2,3,4,5,6,7,8,9]
        let Number = element
        var tempNumber : Int
        var finalNumber : Int
        var ToRemove : Int
        var Dataset : String

        if 0 <= Number && Number <= 200 { Dataset = "Test Set 1 - Visible" as String }
        else { Dataset = "Test Set 2 - Hidden" as String }

        checkloop : for multiply in 1...400000
        {
            finalNumber = multiply * Number
            tempNumber =  multiply * Number
            while ( tempNumber > 0 )
            {
                (tempNumber, ToRemove) = tempNumber.quotientAndRemainder(dividingBy: 10)
                Digits = Digits.filter(){ $0 != ToRemove}
            }
            if Digits.count == 0
            {
                print("Case#\(index+1):\(finalNumber)")
                break checkloop
             }
      
        }
        if Digits.count > 0 { print("Case#\(index+1):INSOMNIA")}
    }
    
}

sleepTask(aryNum: [0,1,2,11,1692])



    






