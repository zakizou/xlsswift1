import XCTest
@testable import Spire_Xls

class SetSummaryColumnDirectionTests: TestCaseBase {

    func testSetSummaryColumnDirection() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetSummaryColumnDirection.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Group Columns
        try sheet.GroupByColumns(1, 4, true)

        // Set summary columns to right of details
        try sheet.get_PageSetup().set_IsSummaryRowBelow(true)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/SetSummaryColumnDirection.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
