//
//  ConsoleView.swift
//  WarOfBeing
//
//  Created by Dima Manyahin on 8/26/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

enum MessageSize {
    case normal
    case big
}

class ConsoleView {
    
    static let `shared` = ConsoleView()
    
    func clearDisplay() {
        let cls = Process()
        let out = Pipe()
        cls.launchPath = "/usr/bin/clear"
        cls.standardOutput = out
        cls.launch()
        cls.waitUntilExit()
        print (String(data: out.fileHandleForReading.readDataToEndOfFile(), encoding: String.Encoding.utf8) ?? "", terminator:"")
    }
    
    func display(message: String, size: MessageSize = .normal) {
        print(self.string(from: message, with: size))
    }
    
    typealias CharacterView = Array<String>
    
    private func string(from message: String, with size: MessageSize) -> String {
        var result = message
        if size != .normal {
            var stringView : CharacterView = []
            message.forEach { char in
                if stringView.count == 0 {
                    stringView = self.mappedStings(for: char, with: size)
                } else {
                    for (index, line) in self.mappedStings(for: char, with: size).enumerated() {
                        stringView[index] += line
                    }
                }
            }

            if stringView.count > 0 {
                result = stringView.reduce("") { 
                    $0 + $1 + "\n"
                }
            }
        }
        return result
    }
    
    private func mappedStings(for char:Character, with size: MessageSize) -> CharacterView {
        var result : CharacterView = []
        if size == .big {
            let map : Dictionary<Character, Array<String>> = [
                "W" : [".     .     . ",
                       ".     .     . ",
                       ".     .     . ",
                       " .   . .   .  ",
                       "  . .   . .   ",
                       "   .     .    ",],
                "e" : ["      ",
                       "..... ",
                       ".     ",
                       "...   ",
                       ".     ",
                       "..... ",],
                "l" : ["      ",
                       ".     ",
                       ".     ",
                       ".     ",
                       ".     ",
                       "..... ",],
                "c" : ["      ",
                       " ...  ",
                       ".   . ",
                       ".     ",
                       ".   . ",
                       " ...  ",],
                "o" : ["      ",
                       " ...  ",
                       ".   . ",
                       ".   . ",
                       ".   . ",
                       " ...  ",],
                "m" : ["      ",
                       ".   . ",
                       ".. .. ",
                       ". . . ",
                       ".   . ",
                       ".   . ",],
                " " : ["    ",
                       "    ",
                       "    ",
                       "    ",
                       "    ",
                       "    ",],
                "t" : ["     ",
                       " .   ",
                       "...  ",
                       " .   ",
                       " . . ",
                       " ..  ",],
                "\"" : [".. ",
                        ",  ",
                        "   ",
                        "   ",
                        "   ",
                        "   ",],
                "a" : ["       ",
                       " ...   ",
                       "    .  ",
                       " ....  ",
                       ".   .  ",
                       " ... . ",],
                "r" : ["      ",
                       ". ... ",
                       "..  . ",
                       ".     ",
                       ".     ",
                       ".     ",],
                "f" : ["      ",
                       "  ..  ",
                       " .  . ",
                       "...   ",
                       " .    ",
                       " .    ",],
                "b" : ["     ",
                       ".    ",
                       ".    ",
                       "...  ",
                       ".  . ",
                       "...  ",],
                "i" : [" .  ",
                       "    ",
                       "..  ",
                       " .  ",
                       " .  ",
                       "... ",],
                "n" : ["      ",
                       ". ..  ",
                       "..  . ",
                       ".   . ",
                       ".   . ",
                       ".   . ",],
                "g" : ["       ",
                       " ... . ",
                       ".   .  ",
                       " ....  ",
                       "    .  ",
                       " `..   ",],
            ]
            result = map[char] ?? []
        }
        return result
    }
}
