//
//  ObservableOptions.swift
//  Observable
//
//  Created by Piervincenzo Parisi on 10/03/2019.
//  Copyright © 2019 Piervincenzo Parisi. All rights reserved.
//

import Foundation

public struct ObservableOptions: OptionSet {
    public static let initial = ObservableOptions(rawValue: 1 << 0)
    public static let old = ObservableOptions(rawValue: 1 << 1)
    public static let new = ObservableOptions(rawValue: 1 << 2)
    
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
