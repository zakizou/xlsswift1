import XCTest
@testable import Spire_Xls

class RemoveRowBasedOnKeywordTests: TestCaseBase {

    func testRemoveRowBasedOnKeyword() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorkbookToHTML.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemoveRowBasedOnKeyword.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Find the string
        let cr = try sheet.FindString("Address", false, false)

        // Delete the row which includes the string
        try sheet.DeleteRow(cr.get_Row())
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/RemoveRowBasedOnKeyword.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
