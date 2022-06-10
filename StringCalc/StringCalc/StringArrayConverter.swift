//
//  StringArrayConverter.swift
//  StringCalc
//
//  Created by Marc Buchser on 26.05.22.
//

import Foundation


class StringArrayConverter{
    
    let delimiter_characters = CharacterSet.init(charactersIn: "\n,")
    
    func stringValuesToIntArray(_ stringNumbers: String) -> [Int?] {
        return stringNumbers.components(separatedBy: delimiter_characters).map { Int($0)}
      }
    
    func stringValuesToIntArrayWithoutControlSequence(_ stringNumbers: String, withDelimiter delimiterChar: String) -> [Int?] {
        return trimControlSequence(of: stringNumbers).components(separatedBy: delimiterChar).map { Int($0)}
      }
    
    func trimControlSequence(of string: String) -> String {
        let index = string.index(string.startIndex, offsetBy: 4)
        return String(string[index...])
    }

}
