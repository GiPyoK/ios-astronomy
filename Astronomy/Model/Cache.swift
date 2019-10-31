//
//  Cache.swift
//  Astronomy
//
//  Created by Gi Pyo Kim on 10/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key: Hashable, Value> {
    private var cacheDictionary: [Key: Value] = [:]
    
    private var queue = DispatchQueue(label: "Cache Queue")
    
    func cache(value: Value, forKey: Key) {
        queue.async {
            self.cacheDictionary[forKey] = value
        }
    }
    
    func value(forKey: Key) -> Value? {
        queue.sync {
            return cacheDictionary[forKey]
        }
    }
}