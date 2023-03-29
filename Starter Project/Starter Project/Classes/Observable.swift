//
//  Observable.swift
//  Starter Project
//
//  Created by iOSayed on 29/03/2023.
//

import Foundation

class Observable<T> {
    
    // MARK: - Properties

    var value:T? {
        didSet{
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    // MARK: - Initialization
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    // MARK: - Listener Closure
    
    //  closure that gets called whenever the observed variable's value changes.
    private var listener: ((T?)->Void)?
    
    // MARK: - Binding
    
    // Bind the listener closure to the observed variable.
    func bind (_ listener: @escaping ((T?)->Void)){
        listener(value)
        self.listener = listener
    }
    
}

