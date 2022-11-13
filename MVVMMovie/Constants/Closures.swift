//
//  Closures.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

import Foundation

typealias VoidClosure = (() -> Void)
typealias StringClosure = ((String) -> Void)
typealias IntClosure = ((Int) -> Void)
typealias DoubleClosure = ((Double) -> Void)
typealias AnyClosure<T: Any> = ((T) -> Void)
typealias BoolClosure = ((Bool) -> Void)
