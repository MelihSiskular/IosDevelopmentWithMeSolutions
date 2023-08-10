//
//  main.swift
//  interview
//
//  Created by Melih Şişkular on 28.07.2023.
//

import Foundation

/*
var pascalTriangleArray = [[Int]]()

//Triangle starts with '1' on the top.That info solves everyting
pascalTriangleArray.append([1])
//After that each number is the sums which two numbers of above


//We need to know how many lines have?
//1  line1
//1-1  line2
//1-2-1 line3
//1-3-3-1 line4
//1-4-6-4-1 line5
//It shows us there are number as much as line number


//Now I'm gonna write a func
//I'll give a number where I want to go triangle and we'll able to see Pascal's Triangle


func SolvingPascalTriangle(lineNumber: Int) {
    
    for _ in 1...lineNumber - 1 {
        pascalTriangleArray.append([])
    } //We created line as much as we want
    
    


}


SolvingPascalTriangle(lineNumber: 4)


print(pascalTriangleArray)
print("")
for i in pascalTriangleArray {
    print(i)
}
*/
//---------------------------------Pascal's Triangle------------------------------
var PascalArray = [[Int]]()
var howManyLine = 0

func PascalsTriangleSolve(numRows: Int) -> [[Int]] { ///We'll give the function a number and that number our wouıld be line number and function return an answer array
    
    howManyLine = numRows ///For last print
    
    let topNumber = 1 ///I used a lot
    
    guard numRows > 0 else {return [[]]} ///We have to sure number is proper
    
    for _ in 1...numRows  {
        PascalArray.append([]) ///We add line as much as we want
    }
    
    for i in 1...2 {
        while PascalArray[i - 1].count < i { ///How many number are there in a line, We placed them.
            PascalArray[i-1].append(topNumber)
        }
    }
    
    guard numRows > 2 else {return PascalArray} ///There is no problem until second line but then Triangle start to occur
    
    for i in 2...numRows - 1 { ///First and second line okay, tough stage is after the second line so third index
        
        ///Indexes are crucial for this question at least in my solution
        var number1index = -1
        var number2index = 0
        
        ///Here is the loop which solve the problem
        while PascalArray[i].count <= i  && number1index < PascalArray[i-1].count{
       
            if number1index < 0 { ///First 1 for each line
                PascalArray[i].append(topNumber)
                number1index += 1
                number2index += 1
                continue
            }
            
            while number1index < PascalArray[i-1].count - 1 {
                PascalArray[i].append(PascalArray[i-1][number1index] + PascalArray[i-1][number2index])
                number1index += 1
                number2index += 1
            }
            
            PascalArray[i].append(topNumber) ///Last 1 for each line

        }
    }
    
    return PascalArray ///Eventually We find the correct answer
}
/*
PascalsTriangleSolve(numRows: 10)
print("Pascal's Triangle has \(howManyLine) line")
for i in PascalArray {
    print(i)
}
*/

func solveQuestion1() {
    var sum = 0
    var threeTimes = 3
    var fiveTimes = 5
    var fifteenTimes = 15
    
    // 3K
    while threeTimes < 1000 {
        sum += threeTimes
        threeTimes += 3
    }
    
    // 5K
    while fiveTimes < 1000 {
        sum += fiveTimes
        fiveTimes += 5
    }
    
    // 15K
    while fifteenTimes < 1000 {
        sum -= fifteenTimes
        fifteenTimes += 15
    }
    print(sum) //233168
    
}
//solveQuestion1()

func solveQuestion2() {
    
    var sumOfEvenFibonacciNumbers = 0
    var fibonacciArray = [1,2]
    fibonacciArray.reverse()
    
    var number1 = fibonacciArray[0]
    var number2 = fibonacciArray[1]
  

    
    while number1 + number2 < 4000000 {
        fibonacciArray.insert(number1 + number2, at: 0)
        number1 = fibonacciArray[0]
        number2 = fibonacciArray[1]
    }
     
    
    fibonacciArray.reverse()
    print(fibonacciArray)
    
    for i in fibonacciArray {
        if i % 2 == 0 { //Even
            sumOfEvenFibonacciNumbers += i
        }else { //Odd
            
        }
    }
    print(sumOfEvenFibonacciNumbers) //4613732
}

//solveQuestion2()

func solveQuestion3() {
    
    var primesArray = [2] //I'll append prime numbers to this array
    
    var lastValue = 600851475143 // Aim Number
    
    var divideBy = 0 //I used this number to detect is Prime Factor or not
    
    var primeFactors = [Int]() //Every number which is Prime Factor will append this array
    
    for i in 3...10000{ // I need to determine a limit for primes.
        //If ıt doesn't work I'll enhance the value of limit. (SPOILER: IT WORKS)
        var prime = false
        for j in 2...i {
            if i % j == 0 {
                // !prime
                break
            }else {
                // prime
                prime = true
            }
            
        }
        if prime {
            primesArray.append(i) //Prime Number's done
        }
    }
    primesArray.reverse()

    //The most important stage. Find Prime Factors
    while lastValue > 0 {
        divideBy = primesArray.last!
        
        if lastValue % divideBy == 0 {
            lastValue = lastValue / divideBy
            primeFactors.append(divideBy)
        }else {
            primesArray.removeLast() //If ıt doesn't divide, We use next prime Until ıt divides
        }
        
        if lastValue == 1 {
            break
        }
        
    }
    
   //Eventually we find the answer
    print(primeFactors.max()!) //6857
    
    
   
    
}
//solveQuestion3()

func solveQuestion4() {
    
    var number1 = 999
    var number2 = 999
    
    var Palindromes = [Int]()
    
    var numberSTR = ""
    var numberSTRreverse = ""
   
    //3 Digit Numbers!!!!
    while number1 > 100 {
        
        numberSTR = String(number1 * number2)
        numberSTRreverse = String(numberSTR.reversed())
        
        if numberSTR == numberSTRreverse {
            Palindromes.append(number1 * number2)
            //It's a palindrome number
            //but we have no idea it's the biggest one
            
            number2 -= 1
        }else {
            if number2 == 100 {
                
                number1 -= 1
                number2 = number1
            }else {
           
                number2 -= 1
            }
        }
        
      
    }
    print(Palindromes.max()!) //906609
  
  
}
//solveQuestion4()



func solveQuestion5() {
    var numbers = [Int]()
    var primeArray: [Double] = [2.0,3.0,5.0,7.0,11.0,13.0,17.0,19.0]
    for i in 2...20 {
        numbers.append(i)
    }
    
    var smallestMultiple = 1.0

    var currentPrime = 0.0
    
   
    
    while numbers.count > 0 {
        currentPrime = Double(primeArray.first!)
        var index = 0
        var isPrime = 0
        
        for i in numbers {
            if Double(i)/currentPrime == 1.0 {
                numbers.remove(at: index)
                isPrime += 1
            }else {
                if i % Int(currentPrime) == 0 {
                    numbers.remove(at: index)
                    numbers.insert(i/Int(currentPrime), at: index)
                }else {
                    
                }
             
                index += 1
                
            }
            
        }
        if isPrime > 0 {
            smallestMultiple *= currentPrime
        }else {
            primeArray.removeFirst()
        }
       
        
    }
    print(Int(smallestMultiple)) //Answer: 232792560
}

//solveQuestion5()

func solveQuestion6() {
    var numbers = [Int]()
    
    for i in 1...100 {
        numbers.append(i)
    }
    
    var sumOfSquares = 0
    var squareOfTheSum = 0
    
    for i in numbers {
        
        sumOfSquares += i*i
        
    }
    
    for i in numbers {
        
        squareOfTheSum += i
        
    }
    
    squareOfTheSum = squareOfTheSum * squareOfTheSum
    
    print(squareOfTheSum - sumOfSquares) //25164150
}

//solveQuestion6()


func solveQuestion7() {
    
    var primes = [2]
    
    var i = 3
    
   
    
    while primes.count < 10001 { //We're doing this again and again until we reach 100001st prime number
        var startedValue = 2
        
        var isPrime = true
        
        while startedValue < i {
            if i % startedValue == 0 {
                isPrime = false
                break
            }
           
            startedValue += 1
        }
        
        if isPrime {
            primes.append(i)
        }
        i += 1
        
    }
    print(primes.count) // There are 10001 prime numbers
    print(primes.last!) //Answer: 104743
 
  
    

    
}

//solveQuestion7()


func solveQuestion8() {
    var number = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
    var arrayNumber = Array(number)
    
    
    
    

}

    
//solveQuestion8()

func solveQuestion9() {
    for i in 1...500 {
        for j in 1...500 {
            var squareOfC:Float = Float((i*i) + (j*j))
            var k = squareOfC.squareRoot()
            if Float(i + j) + k == 1000.0 {
                
                print(i)              //200
                print(j)              //375
                print(Int(k))         //425
                print(i * j * Int(k)) //Answer: 31875000
                
            }
        }
    }
   
    
}

solveQuestion9()

func solveQuestion10() {
    
    
    var lastNumber = 3
    
    var sumOfPrimes = 2
    
    
    while lastNumber < 2000000 {
        
        var isPrime = true
        
        var startedValue = 2
        
        while startedValue < lastNumber {
            if lastNumber % startedValue == 0 {
                isPrime = false
                break
            }else {
                startedValue += 1
            }
        }
        
        if isPrime {
            sumOfPrimes += lastNumber
        }
        
        lastNumber += 1
        
        
    }

    print(sumOfPrimes) //Answer: 142913828922
}

//solveQuestion10()
