//
//  XCTestCaseExtensions.swift
//  XcodeUITestingDemo
//
//  Created by Douglas Sjoquist on 3/3/16.
//  Copyright © 2016 Ivy Gulch LLC. All rights reserved.
//
//  Derived from JAMTestHelper.swift
//  Created by Joe Masilotti on 7/6/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

import XCTest

let kASDADefaultWaitForElementTimeout:NSTimeInterval = 5.0

extension XCTestCase {

    /**
     * Waits for the default timeout until `element.exists` is true.
     *
     * @param element the element you are waiting for
     * @see waitForElementToNotExist()
     */
    func waitForElementToExist(element: XCUIElement, timeout:NSTimeInterval = kASDADefaultWaitForElementTimeout, failureMessage:String? = nil) {
        waitForElement(element, toExist: true, timeout:timeout)
    }

    /**
     * Waits for the default timeout until `element.exists` is true.
     *
     * @param element the element you are waiting for
     * @see waitForElementToNotExist()
     */
    func waitForAnyElementToExist(elements: Array<XCUIElement>, timeout:NSTimeInterval = kASDADefaultWaitForElementTimeout) {
        waitForAnyElement(elements, toExist: true, timeout:timeout)
    }

    /**
     * Waits for the default timeout until `element.exists` is false.
     *
     * @param element the element you are waiting for
     * @see waitForElementToExist()
     */
    func waitForElementToNotExist(element: XCUIElement, timeout:NSTimeInterval = 0.0) {
        waitForElement(element, toExist: false, timeout:timeout)
    }

    // MARK: Private

    private func waitForAnyElement(elements: Array<XCUIElement>, toExist: Bool, timeout:NSTimeInterval = 0.0, failureMessage:String? = nil) {
        let anyElementPredicate = NSPredicate { (evaluatedObject, _) -> Bool in
            if let elements = evaluatedObject as? Array<XCUIElement> {
                for element in elements {
                    if element.exists == toExist {
                        return true
                    }
                }
            }
            return false
        }

        expectationForPredicate(anyElementPredicate, evaluatedWithObject:elements, handler: nil)
        waitForExpectationsWithTimeout(timeout) {
            error in
            if error != nil {
                let msg = toExist ? "exist" : "not exist"
                print("Timed out waiting for one of these elements to \(msg):")
                for element in elements {
                    print("  \(element.debugName)")
                }
                if failureMessage != nil {
                    print("Failure: \(failureMessage!)")
                }
            }
        }
    }

    private func waitForElement(element: XCUIElement, toExist: Bool, timeout:NSTimeInterval = 0.0, failureMessage:String? = nil) {
        let elementPredicate = NSPredicate(format: "exists = \(toExist)")
        expectationForPredicate(elementPredicate, evaluatedWithObject:element, handler: nil)
        waitForExpectationsWithTimeout(timeout) {
            error in
            if error != nil {
                let msg = toExist ? "exist" : "not exist"
                print("Timed out waiting for '\(element.debugName)' to \(msg):")
                if failureMessage != nil {
                    print("Failure: \(failureMessage!)")
                }
            }
        }
    }

    private func raiseTimeOutException(message: String) {
        NSException(name: "XCTestCase+ASDATesting Timeout Failure", reason: message, userInfo: nil).raise()
    }
}

extension XCUIElement {

    var debugName:String {
        get {
            var result = "\(self.elementType)"
            if !identifier.isEmpty {
                result += ", i=\(identifier)"
            }
            if !title.isEmpty {
                result += ", t=\(title)"
            }
            if !label.isEmpty {
                result += ", l=\(label)"
            }
            return result
        }
    }
}

extension XCUIElementQuery {

    func first() -> XCUIElement? {
        return self.count > 0 ? self.elementBoundByIndex(0) : nil
    }

    /**
     * Return single element in query that matches the identifier, default is first one
     *
     * @param identifier of elements to match
     * @param index of element desired
     * @return single element
     */
    func elementWithIdentifier(identifier: String, boundedByIndex:UInt = 0) -> XCUIElement {
        let views = self.matchingIdentifier(identifier)
        return views.elementBoundByIndex(boundedByIndex)
    }

    /**
     * Smash all labels together so we can use the value to check for a change
     *
     * @param elementQuery to use as source
     * @return single string with labels all concatenated together
     */
    func labelsJoinedBy(joinedBy:String = "") -> String {
        var result = ""
        var sep = ""
        for idx in 0..<self.count {
            result += sep + self.elementBoundByIndex(idx).label
            sep = joinedBy
        }
        return result
    }

    /**
     * Smash all titles together so we can use the value to check for a change
     *
     * @param elementQuery to use as source
     * @return single string with titles all concatenated together
     */
    func titlesJoinedBy(joinedBy:String = "") -> String {
        var result = ""
        var sep = ""
        for idx in 0..<self.count {
            result += sep + self.elementBoundByIndex(idx).title
            sep = joinedBy
        }
        return result
    }
    
}