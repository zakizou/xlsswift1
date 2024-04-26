import XCTest
@testable import Spire_Xls

class SetRowColorByConditionalFormatTests: TestCaseBase {
    func testSetRowColorByConditionalFormat() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetRowColorByConditionalFormat.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the file from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Select the range that you want to format
        let dataRange = try sheet.get_AllocatedRange()

        // Set conditional formatting
        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(dataRange)
        let format1 = try xcfs.AddCondition()
        // Determines the cells to format
        try format1.set_FirstFormula("=MOD(ROW(),2)=0")
        // Set conditional formatting type
        try format1.set_FormatType(ConditionalFormatType.Formula)
        // Set the color
        try format1.set_BackColor(Color.get_LightSeaGreen())

        // Set the backcolor of the odd rows as Yellow
        let xcfs1 = try sheet.get_ConditionalFormats().Add()
        try xcfs1.AddRange(dataRange)
        let format2 = try xcfs.AddCondition()
        try format2.set_FirstFormula("=MOD(ROW(),2)=1")
        try format2.set_FormatType(ConditionalFormatType.Formula)
        try format2.set_BackColor(Color.get_Yellow())

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetRowColorByConditionalFormat.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
