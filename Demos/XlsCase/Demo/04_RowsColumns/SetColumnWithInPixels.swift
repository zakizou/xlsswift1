import XCTest
@testable import Spire_Xls

class SetColumnWithInPixelsTests: TestCaseBase {

    func testSetColumnWithInPixels() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetColumnWithInPixels.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set the width of the third column to 400 pixels
        try sheet.SetColumnWidthInPixels(3, 400)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/SetColumnWithInPixels.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
