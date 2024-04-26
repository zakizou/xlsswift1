import XCTest
@testable import Spire_Xls

class SetSummaryRowDirectionTests: TestCaseBase {

    func testSetSummaryRowDirection() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetSummaryRowDirection.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Group rows
        try sheet.GroupByRows(1, 4, true)

        // Set summary rows above details
        try sheet.get_PageSetup().set_IsSummaryRowBelow(false)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/SetSummaryRowDirection.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
