import XCTest
@testable import Spire_Xls

class SetDefaultRowHeightTests: TestCaseBase {

    func testSetDefaultRowHeight() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CommonTemplate.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetDefaultRowHeight.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set default row height
        try sheet.set_DefaultRowHeight(30)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/SetDefaultRowHeight.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
