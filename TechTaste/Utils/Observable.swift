//
//  Observable.swift
//  TechTaste
//
//  Created by Maria Clara Dias on 16/06/25.
//

import Foundation

class Observable<T> {
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    private var listener: ((T?) -> Void)?
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    func bind (_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
}
