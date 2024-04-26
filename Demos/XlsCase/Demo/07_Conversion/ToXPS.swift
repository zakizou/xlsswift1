import XCTest
@testable import Spire_Xls

class ToXPSTests: TestCaseBase {

    func testToXPS() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ToXPS.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToXPS.xps"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile, .XPS)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ToXPS.xps"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
