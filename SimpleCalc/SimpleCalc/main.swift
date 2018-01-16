//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var answer = 0
        let last = Int(args[args.endIndex - 1])
        if last != nil{
            var firstNumber = 0
            var secondNumber = 0
            var sign = ""
            var trigger = false
            for index in args{
                let num = Int(index)
                if num != nil && trigger == false{
                    firstNumber = Int(index)!
                    trigger = true;
                } else if num == nil {
                    sign = index;
                }
                
                if num != nil && trigger == true {
                    secondNumber = Int(index)!
                }
            }
            
            print("First: \(firstNumber)")
            print("Sign: \(sign)")
            print("Second: \(secondNumber)")
            
            if sign == "+" {
                answer = firstNumber + secondNumber
            } else if sign == "-" {
                answer = firstNumber - secondNumber
            } else if sign == "/" {
                answer = firstNumber / secondNumber
            } else if sign == "%" {
                answer = firstNumber % secondNumber
            } else if sign == "*" {
                answer = firstNumber * secondNumber
            }
        } else {
            let command = args[args.endIndex - 1]
            if command == "count" {
                answer = args.endIndex - 1
            } else if command == "avg" {
                var sum = 0
                for index in args{
                    let num = Int(index)
                    if num != nil {
                        sum = sum + Int(index)!
                    }
                }
                
                if (args.endIndex - 1) > 0 {
                    answer = sum / (args.endIndex - 1)
                    print(sum / (args.endIndex - 1))
                } else {
                    answer = 0;
                }
                
            } else if command == "fact" {
                let number = Int(args[args.startIndex])
                let i = Int(args[0])
                if number != nil {
                    answer = number!
                    for index in stride(from: i!-1, to: 1, by: -1) {
                        answer = answer * index;
                        print(answer)
                        print(index)
                    }
                } else {
                    answer = 0
                }
            }
        }
        return answer
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

