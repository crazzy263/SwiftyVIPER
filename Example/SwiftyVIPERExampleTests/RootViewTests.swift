//
//  RootViewTests.swift
//  Project: SwiftyVIPERExample
//
//  Module: Root
//
//  By Cody Winton 11/9/16
//  codeRed 2016
//

// MARK: Imports

import SwiftyVIPER
@testable import SwiftyVIPERExample
import XCTest

// MARK: -

class RootViewTests: XCTestCase {

	// MARK: - Variables

	fileprivate var presenter: MockPresenter?
	fileprivate var view: RootViewController?

	// MARK: Test Functions

	func testPresenter() {
		view?.beginAppearanceTransition(true, animated: false)
		view?.endAppearanceTransition()
		XCTAssert(presenter?.isViewLoaded ?? false)

		view?.detailsSelected()
		XCTAssert(presenter?.isDetailsSelected ?? false)

		view?.set(title: "Root")
		XCTAssertEqual(view?.title, "Root")
	}

	// MARK: Setup

	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.

		let presenter = MockPresenter()
		self.presenter = presenter
		view = RootViewController(presenter: presenter)
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
}

// MARK: - Mock Classes

// MARK: -

private class MockPresenter: RootViewPresenterProtocol {

	// MARK: Variables

	var isViewLoaded: Bool = false

	var isDetailsSelected: Bool = false

	// MARK: Functions

	func viewLoaded() {
		isViewLoaded = true
	}

	func detailsSelected() {
		isDetailsSelected = true
	}
}
