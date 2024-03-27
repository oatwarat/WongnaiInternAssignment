//
//  WongnaiInternAssignmentTests.swift
//  WongnaiInternAssignmentTests
//
//  Created by Warat Poovorakit on 26/3/2567 BE.
//

import XCTest
@testable import WongnaiInternAssignment

class WongnaiInternAssignmentTests: XCTestCase {
    var viewController: ViewController!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    // MARK: - Fetch Photos Test
    func testFetchPhotos() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch photos from API")
       
        // When
        viewController.viewModel.fetchPhotos { result in
            switch result {
            case .success(let photoResponse):
                XCTAssertGreaterThan(photoResponse.photos.count, 0, "Expected photos to be fetched")
            case .failure(let error):
                XCTFail("Fetching photos failed with error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 15.0)
    }
    
    // MARK: - Refresh Data Test
    func testRefreshFetchesNewData() {
        // Given
        let expectation = XCTestExpectation(description: "Refresh and fetches new data")
        let initialPhotos = viewController.viewModel.photos

        // When
        viewController.refreshData()

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            XCTAssertGreaterThan(self.viewController.viewModel.photos.count, initialPhotos.count, "Expected new photos to be fetched after refresh")
            XCTAssertEqual(self.viewController.tableView.numberOfRows(inSection: 0), self.viewController.viewModel.numberOfPhotos, "Table view should have the same number of rows as the fetched photos")

            self.viewController.tableView.layoutIfNeeded()
            RunLoop.current.run(until: Date().addingTimeInterval(1.0))

            let lastIndexPath = IndexPath(row: self.viewController.viewModel.numberOfPhotos - 1, section: 0)

            guard let lastCell = self.viewController.tableView.cellForRow(at: lastIndexPath) as? ProductsTableViewCell else {
                expectation.fulfill()
                return
            }

            if let lastPhoto = self.viewController.viewModel.photo(at: lastIndexPath.row) {
                XCTAssertEqual(lastCell.nameLabel.text, lastPhoto.name, "Expected the new cell to display the correct photo name")
                XCTAssertEqual(lastCell.likesLabel.text, "\(lastPhoto.votesCount) likes", "Expected the new cell to display the correct number of likes")
            } else {
                XCTFail("Expected a photo at the last index path")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 15.0)
    }
}
