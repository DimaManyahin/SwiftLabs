//
//  main.swift
//  Being2
//
//  Created by Dima Manyahin on 8/13/18.
//  Copyright © 2018 Dima Manyahin. All rights reserved.
//

import Foundation

do {
    
    print("Stuff of classes\n")
    // Stuff of classes
    do {
        print("Make mother and father")
        var father = BeingClass()
        var mother = BeingClass()

        print("\nMake first son")
        let son1 = BeingClass.makeChild(father: &father, mother: &mother)

        print("\nFamily tree")
        print(father)
        print(mother)
        print(son1)
        
        print("\nMake second son")
        let son2 = BeingClass.makeChild(father: &father, mother: &mother)

        print("\nFamily tree")
        print(father)
        print(mother)
        print(son2)

    }

    print("---------------------------------------------------")
    print("Stuff of structs\n")
    // Stuff of structs
    do {
        print("Make mother and father")
        var father = BeingStruct()
        var mother = BeingStruct()
        
        print("\nMake first son")
        let son1 = BeingStruct.makeChild(father: &father, mother: &mother)
        
        print("\nFamily tree")
        print(father)
        print(mother)
        print(son1)
        
        print("\nMake second son")
        let son2 = BeingStruct.makeChild(father: &father, mother: &mother)
        
        print("\nFamily tree")
        print(father)
        print(mother)
        print(son2)
        
    }
        
}
