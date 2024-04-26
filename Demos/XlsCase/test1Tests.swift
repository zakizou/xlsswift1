import XCTest
@testable import Spire_Xls

final class test1Tests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let book:Workbook = try Workbook()
        //try book.LoadFromFile(TestUtil.DataPath + "Demo/AccessCell.xlsx")
        //try book.SaveToFile(TestUtil.OutputPath + "Demo/AccessCell.pdf")
        //XCTAssertEqual(test2().text, "Hello, World!")
    }
}
