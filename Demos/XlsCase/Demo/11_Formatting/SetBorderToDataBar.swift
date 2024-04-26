import XCTest
@testable import Spire_Xls

class SetBorderToDataBarTests: TestCaseBase {
    func testSetBorderToDataBar() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_9.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetBorderToDataBar.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load an excel document
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the databar format
        let xcfs = try sheet.get_ConditionalFormats() as! XlsWorksheetConditionalFormats
        let cf = try xcfs.get_Item(0).get_Item(0)
        let dataBar1 = try cf.get_DataBar()
        try dataBar1.get_BarBorder().set_Type(DataBarBorderType.DataBarBorderSolid)
        try dataBar1.get_BarBorder().set_Color(Color.get_Red())

        // Set to new data bar
        try sheet.get_Range().get_Item("E1").set_NumberValue(200)
        let xcfs2 = try (sheet.get_ConditionalFormats() as! XlsWorksheetConditionalFormats).Add()
        try xcfs2.AddRange(sheet.get_Range().get_Item("E1"))
        let cf2 = try xcfs2.AddCondition()
        try cf2.set_FormatType(ConditionalFormatType.DataBar)
        try cf2.get_DataBar().get_BarBorder().set_Type(DataBarBorderType.DataBarBorderSolid)
        try cf2.get_DataBar().get_BarBorder().set_Color(Color.get_Red())
        try cf2.get_DataBar().set_BarColor(Color.get_GreenYellow())

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = "Demo/SetBorderToDataBar.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
