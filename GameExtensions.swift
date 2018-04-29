//
//  GameExtensions.swift
//  These extensions are handy for game–making.
//
//  Created by Leevi on 25/08/14.
//  MIT License
//
//  Copyright (c) 2014 Leevi Heino
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import UIKit

// MARK: String extensions

extension String {
    
    // string[index] returns a character.
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
}

// MARK: Float extensions

extension Float {
    
    /**
     Returns the median value of a sorted integer list.
     
     @param ints: [Int] - sorted list of integers.
     
     @return Float - median value.
     */
    static func median(_ ints: [Int]) -> Float {
        if ints.count % 2 == 0 {
            let a = ints[Int(ints.count / 2) - 1]; let b = ints[Int(ints.count / 2)]; let c = ((Float(a) + Float(b)) / 2)
            return c
        }
        return Float(ints[Int(ints.count / 2)])
    }
    
    /**
     Returns the mean value of an integer list.
     
     @param ints: [Int] - list of integers.
     
     @return Float - mean value.
     */
    static func mean(_ ints: [Int]) -> Float {
        var sum = 0
        for var i in ints {
            sum += i
        }
        return Float(sum) / Float(ints.count)
    }
}

// MARK: Int extensions

extension Int {
    
    /**
     Returns true if integer is even.
     */
    func even() -> Bool {
        if self % 2 == 0 {
            return true
        }
        return false
    }
    
    /**
     Returns the factorial value of a positive integer.
     
     @param i: Int
     
     @return Int - factorial value.
     */
    static func factorial(_ i: Int) -> Int {
        if i <= 1 {
            return 1
        }
        return i * factorial(i - 1)
    }
    
    /**
     Returns the lowest value of an integer list.
     
     @param ints: [Int] - list of integers.
     
     @return Int - min value.
     */
    static func minValue(_ ints: [Int]) -> Int {
        var a = Int.max
        for var i in 0...ints.count - 1 {
            if a > ints[i] {
                a = ints[i]
            }
        }
        return a
    }
    
    /**
     Returns the highest value of an integer list.
     
     @param ints: [Int] - list of integers.
     
     @return Int - max value.
     */
    static func maxValue(_ ints: [Int]) -> Int {
        var a = Int.min
        for var i in 0...ints.count - 1 {
            if a < ints[i] {
                a = ints[i]
            }
        }
        return a
    }
    
    /**
     Returns a pseudo-random Int within a given range. Example: random(-1...1)
     
     @param range: Range<Int> - int1...int2, where int1 < int2. Negative values are allowed.
     
     @return Int - random value.
     */
    static func random(_ range: Range<Int>) -> Int {
        var offset = 0
        if range.lowerBound < 0 { // Allows negative values for range
            offset = abs(range.lowerBound)
        }
        let min = UInt32(range.lowerBound + offset)
        let max = UInt32(range.upperBound   + offset)
        return Int(min + arc4random_uniform(max - min)) - offset
    }
}

// MARK: UIColor extensions

extension UIColor {
    
    static func randomFoodColour() -> UIColor {
        let colours = [orangePeelColour(), yellowLemonColour(), orangeTomatoColour(), brownChocolateColour(), greenOliveColour()]
        let r: Range<Int> = 0..<colours.count
        return colours[Int.random(r)]
    }
    
    static func randomMetalColour() -> UIColor {
        let colours = [greyDimColour(), greySilverColour(), greyLightSlateColour(), whiteIvoryColour(), blueLightSteelColour()]
        let r: Range<Int> = 0..<colours.count
        return colours[Int.random(r)]
    }
    
    static func randomBackgroundColour() -> UIColor {
        let colours = [redBrickColour(), brownSaddleColour(), greenOliveColour(), greyDimColour()]
        let r: Range<Int> = 0..<colours.count
        return colours[Int.random(r)]
    }
    
    // MARK: Orange colours
    
    static func orangePeelColour() -> UIColor {
        return UIColor(red: 1.0, green: 0.6, blue: 0.0, alpha: 1.0)
    }
    
    static func orangeRedColour() -> UIColor {
        return UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)
    }
    
    static func orangeTomatoColour() -> UIColor {
        return UIColor(red: 1.0, green: 0.38, blue: 0.28, alpha: 1.0)
    }
    
    // MARK: Red colours
    
    static func redCrimsonColour() -> UIColor {
        return UIColor(red: 0.86, green: 0.08, blue: 0.24, alpha: 1.0)
    }
    
    static func redBrickColour() -> UIColor {
        return UIColor(red: 0.7, green: 0.13, blue: 0.13, alpha: 1.0)
    }
    
    // MARK: Pink colours
    
    static func pinkColour() -> UIColor {
        return UIColor(red: 1.0, green: 0.75, blue: 0.8, alpha: 1.0)
    }
    
    static func pinkHotColour() -> UIColor {
        return UIColor(red: 1.0, green: 0.41, blue: 0.7, alpha: 1.0)
    }
    
    // MARK: Yellow colours
    
    static func yellowGoldColour() -> UIColor {
        return UIColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0)
    }
    
    static func yellowLemonColour() -> UIColor {
        return UIColor(red: 1.0, green: 0.98, blue: 0.8, alpha: 1.0)
    }
    
    // MARK: Brown colours
    
    static func brownChocolateColour() -> UIColor {
        return UIColor(red: 0.82, green: 0.41, blue: 0.12, alpha: 1.0)
    }
    
    static func brownSaddleColour() -> UIColor {
        return UIColor(red: 0.55, green: 0.27, blue: 0.07, alpha: 1.0)
    }
    
    // MARK: Green colours
    
    static func greenOliveColour() -> UIColor {
        return UIColor(red: 0.5, green: 0.5, blue: 0.0, alpha: 1.0)
    }
    
    static func greenYellowColour() -> UIColor {
        return UIColor(red: 0.6, green: 0.8, blue: 0.2, alpha: 1.0)
    }
    
    static func greenForestColour() -> UIColor {
        return UIColor(red: 0.13, green: 0.55, blue: 0.13, alpha: 1.0)
    }
    
    // MARK: Cyan colours
    
    static func cyanAquaColour() -> UIColor {
        return UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    static func cyanLightColour() -> UIColor {
        return UIColor(red: 0.87, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    // MARK: Blue colours
    
    static func blueSkyColour() -> UIColor {
        return UIColor(red: 0.53, green: 0.81, blue: 0.92, alpha: 1.0)
    }
    
    static func blueRoyalColour() -> UIColor {
        return UIColor(red: 0.25, green: 0.41, blue: 0.88, alpha: 1.0)
    }
    
    static func blueLightSteelColour() -> UIColor {
        return UIColor(red: 0.69, green: 0.77, blue: 0.87, alpha: 1.0)
    }
    
    
    // MARK: Purple/Violet/Magenta colours
    
    static func violetColour() -> UIColor {
        return UIColor(red: 0.93, green: 0.51, blue: 0.93, alpha: 1.0)
    }
    
    static func purpleMediumColour() -> UIColor {
        return UIColor(red: 0.58, green: 0.44, blue: 0.86, alpha: 1.0)
    }
    
    static func magentaDarkColour() -> UIColor {
        return UIColor(red: 0.55, green: 0.0, blue: 0.55, alpha: 1.0)
    }
    
    // MARK: White/Grey/Black colours
    
    static func whiteIvoryColour() -> UIColor {
        return UIColor(red: 1.0, green: 1.0, blue: 0.94, alpha: 1.0)
    }
    
    static func whiteLinenColour() -> UIColor {
        return UIColor(red: 0.98, green: 0.94, blue: 0.9, alpha: 1.0)
    }
    
    static func greyDimColour() -> UIColor {
        return UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)
    }
    
    static func greyLightSlateColour() -> UIColor {
        return UIColor(red: 0.47, green: 0.53, blue: 0.6, alpha: 1.0)
    }
    
    static func greySilverColour() -> UIColor {
        return UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0)
    }
}
