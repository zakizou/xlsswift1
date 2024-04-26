import XCTest
@testable import Spire_Xls

class SetDBNumFormattingTests: TestCaseBase {
    func testSetDBNumFormatting() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/SetDBNumFormatting.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.CreateEmptySheets(1)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set value for cells
        try (sheet.get_Range().get_Item("A1") as! CellRange).set_Value2(SpireInt32(123))
        try (sheet.get_Range().get_Item("A2") as! CellRange).set_Value2(SpireInt32(456))
        try (sheet.get_Range().get_Item("A3") as! CellRange).set_Value2(SpireInt32(789))

        // Get the cell range
        let range = try sheet.get_Range().get_Item("A1:A3")

        // Set the DB num format
        try range.set_NumberFormat("[DBNum2][$-804]General")

        // Auto fit columns
        try range.AutoFitColumns()

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetDBNumFormatting.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }
}
