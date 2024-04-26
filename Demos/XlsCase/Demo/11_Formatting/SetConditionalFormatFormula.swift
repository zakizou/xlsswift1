import XCTest
@testable import Spire_Xls

class SetConditionalFormatFormulaTests: TestCaseBase {
    func testSetConditionalFormatFormula() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/SetConditionalFormatFormula.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Get the default first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add ConditionalFormat
        let xcfs = try sheet.get_ConditionalFormats().Add()

        // Define the range
        try xcfs.AddRange(sheet.get_Range().get_Item("B5"))

        // Add condition
        let format = try xcfs.AddCondition()
        try format.set_FormatType(ConditionalFormatType.CellValue)

        // If greater than 1000
        try format.set_FirstFormula("1000")
        try format.set_Operator(ComparisonOperatorType.Greater)
        try format.set_BackColor(Color.get_Orange())

        try sheet.get_Range().get_Item("B1").set_NumberValue(40)
        try sheet.get_Range().get_Item("B2").set_NumberValue(500)
        try sheet.get_Range().get_Item("B3").set_NumberValue(300)
        try sheet.get_Range().get_Item("B4").set_NumberValue(400)

        // Set a SUM formula for B5
        try sheet.get_Range().get_Item("B5").set_Formula("=SUM(B1:B4)")

        // Add text
        try sheet.get_Range().get_Item("C5").set_Text("If Sum of B1:B4 is greater than 1000, B5 will have orange background.")

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetConditionalFormatFormula.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
