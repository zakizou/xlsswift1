import XCTest
@testable import Spire_Xls

class HighlightAverageValuesTests: TestCaseBase {

    func testHighlightAverageValues() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_6.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HighlightAverageValues.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the file from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add conditional format for below average
        let format1 = try sheet.get_ConditionalFormats().Add()
        // Set the cell range to apply the formatting
        try format1.AddRange(sheet.get_Range().get_Item("E2:E10"))
        // Add below average condition
        let cf1 = try format1.AddAverageCondition(AverageType.Below)
        // Highlight cells below average values
        try cf1.set_BackColor(Color.get_SkyBlue())

        // Add conditional format for above average
        let format2 = try sheet.get_ConditionalFormats().Add()
        // Set the cell range to apply the formatting
        try format2.AddRange(sheet.get_Range().get_Item("E2:E10"))
        // Add above average condition
        let cf2 = try format2.AddAverageCondition(AverageType.Above)
        // Highlight cells above average values
        try cf2.set_BackColor(Color.get_Orange())

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/HighlightAverageValues.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
