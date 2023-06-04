//
//  Probllem.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import Foundation

class Probllem {
    static func findEqualSumIndex(_ input: [Int]) -> String {
        let endIndex: Int = input.count - 1
       
        if input.isEmpty || input.count <= 2 {
            return "index not found"
        }
        
        var leftSum: Int = .zero
        var rightSum: Int = .max

        for (index, _) in input.enumerated() {
            if index != 0 {
                leftSum = input[0...index - 1].reduce(0, { $0 + $1 })
                rightSum = input[(index + 1)...endIndex].reduce(0, { $0 + $1 })
            }
            
            if leftSum == rightSum {
                return "middle index is \(index)"
            }
        }
        
        return "index not found"
    }
    
    static func isPalindrom(_ input: String) -> String {
        if input.count == 1 {
            return "String is palindrom"
        }
        
        var flag = false
        for (index, character) in input.enumerated() {
            if character.lowercased() != input.charactersArray[input.count - index - 1].lowercased() {
                flag = true
                break
            }
        }
        
        if flag {
            return "String is not palindrome"
        }
        
        return "String is palindrome"
    }
}
