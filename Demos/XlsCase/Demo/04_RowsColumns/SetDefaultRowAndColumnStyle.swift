import XCTest
@testable import Spire_Xls

class SetDefaultRowAndColumnStyleTests: TestCaseBase {

    func testSetDefaultRowAndColumnStyle() throws {

        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/SetDefaultRowAndColumnStyle.xlsx"

        let workbook = try Workbook()

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Create a cell style and set the color
        let style = try workbook.get_Styles().Add("Mystyle")
        try style.set_Color(Color.get_Yellow())

        // Set the default style for the first row and column
        try sheet.SetDefaultRowStyle(1, style)
        try sheet.SetDefaultColumnStyle(1, style)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/SetDefaultRowAndColumnStyle.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
