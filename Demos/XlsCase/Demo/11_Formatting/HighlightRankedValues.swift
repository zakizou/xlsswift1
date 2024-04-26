import XCTest
@testable import Spire_Xls

class HighlightRankedValuesTests: TestCaseBase {

    func testHighlightRankedValues() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_6.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HighlightRankedValues.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the file from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Apply conditional formatting to range "D2:D10" to highlight the top 2 values
        let xcfs1 = try sheet.get_ConditionalFormats().Add()
        try xcfs1.AddRange(sheet.get_Range().get_Item("D2:D10"))
        let format1 = try xcfs1.AddTopBottomCondition(TopBottomType.Top, 2)
        try format1.set_FormatType(ConditionalFormatType.TopBottom)
        try format1.set_BackColor(Color.get_Red())

        // Apply conditional formatting to range "E2:E10" to highlight the bottom 2 values
        let xcfs2 = try sheet.get_ConditionalFormats().Add()
        try xcfs2.AddRange(sheet.get_Range().get_Item("E2:E10"))
        let format2 = try xcfs2.AddTopBottomCondition(TopBottomType.Bottom, 2)
        try format2.set_FormatType(ConditionalFormatType.TopBottom)
        try format2.set_BackColor(Color.get_ForestGreen())

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/HighlightRankedValues.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
