import XCTest
@testable import Spire_Xls

class HighlightDuplicateUniqueValuesTests: TestCaseBase {

    func testHighlightDuplicateUniqueValues() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_6.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HighlightDuplicateUniqueValues.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the file from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Use conditional formatting to highlight duplicate values in range "C2:C10" with IndianRed color
        let xcfs1 = try sheet.get_ConditionalFormats().Add()
        try xcfs1.AddRange(sheet.get_Range().get_Item("C2:C10"))
        let format1 = try xcfs1.AddCondition()
        try format1.set_FormatType(ConditionalFormatType.DuplicateValues)
        try format1.set_BackColor(Color.get_IndianRed())

        // Use conditional formatting to highlight unique values in range "C2:C10" with Yellow color
        let xcfs2 = try sheet.get_ConditionalFormats().Add()
        try xcfs2.AddRange(sheet.get_Range().get_Item("C2:C10"))
        let format2 = try xcfs2.AddCondition()
        try format2.set_FormatType(ConditionalFormatType.UniqueValues)
        try format2.set_BackColor(Color.get_Yellow())

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/HighlightDuplicateUniqueValues.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
