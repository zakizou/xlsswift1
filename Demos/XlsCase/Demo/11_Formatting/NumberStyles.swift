import XCTest
@testable import Spire_Xls

class NumberStylesTests: TestCaseBase {
    func testNumberStyles() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/NumberStyles.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/NumberStyles.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the file from disk
        try workbook.LoadFromFile(inputFile)

        // Initialize the workbook
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Input a number value for the specified cell and set the number format
        try sheet.get_Range().get_Item("B10").set_Text("NUMBER FORMATTING")
        try (sheet.get_Range().get_Item("B10").get_Style().get_Font()).set_IsBold(true)

        try sheet.get_Range().get_Item("B13").set_Text("0")
        try sheet.get_Range().get_Item("C13").set_NumberValue(1234.5678)
        try sheet.get_Range().get_Item("C13").set_NumberFormat("0")

        try sheet.get_Range().get_Item("B14").set_Text("0.00")
        try sheet.get_Range().get_Item("C14").set_NumberValue(1234.5678)
        try sheet.get_Range().get_Item("C14").set_NumberFormat("0.00")

        try sheet.get_Range().get_Item("B15").set_Text("#,##0.00")
        try sheet.get_Range().get_Item("C15").set_NumberValue(1234.5678)
        try sheet.get_Range().get_Item("C15").set_NumberFormat("#,##0.00")

        try sheet.get_Range().get_Item("B16").set_Text("$#,##0.00")
        try sheet.get_Range().get_Item("C16").set_NumberValue(1234.5678)
        try sheet.get_Range().get_Item("C16").set_NumberFormat("$#,##0.00")

        try sheet.get_Range().get_Item("B17").set_Text("0;[Red]-0")
        try sheet.get_Range().get_Item("C17").set_NumberValue(-1234.5678)
        try sheet.get_Range().get_Item("C17").set_NumberFormat("0;[Red]-0")

        try sheet.get_Range().get_Item("B18").set_Text("0.00;[Red]-0.00")
        try sheet.get_Range().get_Item("C18").set_NumberValue(-1234.5678)
        try sheet.get_Range().get_Item("C18").set_NumberFormat("0.00;[Red]-0.00")

        try sheet.get_Range().get_Item("B19").set_Text("#,##0;[Red]-#,##0")
        try sheet.get_Range().get_Item("C19").set_NumberValue(-1234.5678)
        try sheet.get_Range().get_Item("C19").set_NumberFormat("#,##0;[Red]-#,##0")

        try sheet.get_Range().get_Item("B20").set_Text("#,##0.00;[Red]-#,##0.000")
        try sheet.get_Range().get_Item("C20").set_NumberValue(-1234.5678)
        try sheet.get_Range().get_Item("C20").set_NumberFormat("#,##0.00;[Red]-#,##0.00")

        try sheet.get_Range().get_Item("B21").set_Text("0.00E+00")
        try sheet.get_Range().get_Item("C21").set_NumberValue(1234.5678)
        try sheet.get_Range().get_Item("C21").set_NumberFormat("0.00E+00")

        try sheet.get_Range().get_Item("B22").set_Text("0.00%")
        try sheet.get_Range().get_Item("C22").set_NumberValue(1234.5678)
        try sheet.get_Range().get_Item("C22").set_NumberFormat("0.00%")

        try sheet.get_Range().get_Item("B13:B22").get_Style().set_KnownColor(ExcelColors.Gray25Percent)

        // AutoFit Column
        try sheet.AutoFitColumn(2)
        try sheet.AutoFitColumn(3)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/NumberStyles.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
