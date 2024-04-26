import XCTest
@testable import Spire_Xls

class MoveWorksheetTests: TestCaseBase {
    func testMoveWorksheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/MoveWorksheet.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Move worksheet
        try sheet.MoveWorksheet(2)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/MoveWorksheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

