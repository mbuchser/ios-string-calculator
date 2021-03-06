//
//  StringCalculator.swift
//  StringCalc
//
//  Created by Marc Buchser on 26.05.22.
//

import Foundation


class StringCalculator{
        
    let stringArrayConverter = StringArrayConverter()
    let delimiter_character : Character = "\n"
    let command_sequence_regex = "//.\\n"
    let double_forward_slash = "//"
    let errorMsg_IncompleteCmdSequence = "Incomplete command sequence"
    let errorMsg_NegativeNumbersFound = "Negative numbers found: "

    enum InputErrors: Error {
        case ErrorNegativeNumbers(String)
        case ErrorTwoDelimitersInARow(String)
        case ErrorNumberOutOfRange(String)
        case ErrorCommandSequenceIncomplete(String)
    }
    
    func add(_ numbers: String) throws -> Int {
        if (findFirstOccurrence(of: double_forward_slash, in: numbers) != nil) {
            guard try isValidControlSequence(in: numbers) else {
                throw InputErrors.ErrorCommandSequenceIncomplete(errorMsg_IncompleteCmdSequence)
            }
            let delimiterChar = findDelimiterChar(input: numbers)
            do {
                return try addAllNumbersFromIntegerArray(stringArrayConverter.stringValuesToIntArrayWithoutControlSequence(numbers, withDelimiter: delimiterChar))
            } catch {
                throw error
            }
        } else {
            do{
                return try addAllNumbersFromIntegerArray(stringArrayConverter.stringValuesToIntArray(numbers))
            } catch {
                throw error
            }
        }
    }
    
    func addAllNumbersFromIntegerArray(_ intNumberArray: [Int?]) throws -> Int {
        guard intNumberArray.filter({ $0 == nil }).isEmpty else {
            return 0
        }
        guard intNumberArray.filter({ $0! < 0 }).isEmpty else {
            throw InputErrors.ErrorNegativeNumbers(errorMsg_NegativeNumbersFound + findNegativeNumbers(in: intNumberArray).map{ String($0)}.joined())
        }
        return Int(intNumberArray.reduce(0) { $0 + $1! })
    }
    
    func findFirstOccurrence(of string: String, in text: String) -> String.Index? {
        return text.range(of: string)?.lowerBound
    }
    
    func findDelimiterChar(input: String) -> String {
        return String(input[input.index(input.startIndex, offsetBy: 2)..<input.firstIndex(of: delimiter_character)!])
    }
    
    func isValidControlSequence(in str: String) throws -> Bool {
        let regex = try! NSRegularExpression(pattern: command_sequence_regex, options: [])
        let matches = regex.matches(in: str, options: [], range: NSRange(str.startIndex..., in: str))
        return (matches.first.map {
            String(str[Range($0.range, in: str)!])
        } != nil)
    }
    
    func findNegativeNumbers(in array: [Int?]) -> [Int] {
        var negativeNumbers: [Int] = []
        for number in array {
            if number! < 0 {
                negativeNumbers.append(number!)
            }
        }
        return negativeNumbers
    }
    
}
