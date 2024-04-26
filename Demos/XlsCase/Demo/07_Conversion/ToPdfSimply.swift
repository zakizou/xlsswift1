import XCTest
@testable import Spire_Xls

class ToPdfSimplyTests: TestCaseBase {

    func testToPdfSimply() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ToPDF.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToPdfSimply.pdf"

        // Create a workbook
        let workbook = try Workbook()

        // Load an excel document
        try workbook.LoadFromFile(inputFile)

        // Convert excel to pdf
        try workbook.SaveToFile(outputFile, .PDF)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ToPdfSimply.pdf"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
