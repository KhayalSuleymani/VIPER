//
//  PersistenceError.swift
//  VIPER
//
//  Created by ABA IT on 1/22/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import Foundation

enum PersistenceError : Error {
    case managedObjectContextNotFound
    case couldNotSaveAObject
    case objectNotFound
}



