import XCTest
@testable import Spire_Xls

class ApplyColorScalesToDataRangeTests: TestCaseBase {
    func testApplyColorScalesToDataRange() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/ApplyColorScalesToDataRange.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Insert data to cell range from A1 to C4
        try sheet.get_Range().get_Item("A1").set_NumberValue(582)
        try sheet.get_Range().get_Item("A2").set_NumberValue(234)
        try sheet.get_Range().get_Item("A3").set_NumberValue(314)
        try sheet.get_Range().get_Item("A4").set_NumberValue(50)
        try sheet.get_Range().get_Item("B1").set_NumberValue(150)
        try sheet.get_Range().get_Item("B2").set_NumberValue(894)
        try sheet.get_Range().get_Item("B3").set_NumberValue(560)
        try sheet.get_Range().get_Item("B4").set_NumberValue(900)
        try sheet.get_Range().get_Item("C1").set_NumberValue(134)
        try sheet.get_Range().get_Item("C2").set_NumberValue(700)
        try sheet.get_Range().get_Item("C3").set_NumberValue(920)
        try sheet.get_Range().get_Item("C4").set_NumberValue(450)
        try sheet.get_AllocatedRange().set_RowHeight(15)
        try sheet.get_AllocatedRange().set_ColumnWidth(17)

        // Add color scales
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(sheet.get_AllocatedRange())
        let format = try xcfs.AddCondition()
        try format.set_FormatType(ConditionalFormatType.ColorScale)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ApplyColorScalesToDataRange.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
