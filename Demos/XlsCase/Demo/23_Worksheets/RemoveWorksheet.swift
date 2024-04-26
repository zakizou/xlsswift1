import XCTest
@testable import Spire_Xls

class RemoveWorksheetTests: TestCaseBase {
    func testRemoveWorksheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/RemoveWorksheet.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemoveWorksheet.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Remove a worksheet by sheet index
        try workbook.get_Worksheets().RemoveAt(1)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/RemoveWorksheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}