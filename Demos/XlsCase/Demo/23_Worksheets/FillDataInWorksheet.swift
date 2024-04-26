import XCTest
@testable import Spire_Xls

class FillDataInWorksheetTests: TestCaseBase {
    func testFillDataInWorksheet() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/FillDataInWorksheet.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Get the first worksheet of the workbook
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Fill data
        try worksheet.get_Range().get_Item("A1").get_Style().get_Font().set_IsBold(true)
        try worksheet.get_Range().get_Item("B1").get_Style().get_Font().set_IsBold(true)
        try worksheet.get_Range().get_Item("C1").get_Style().get_Font().set_IsBold(true)
        try worksheet.get_Range().get_Item("A1").set_Text("Month")
        try worksheet.get_Range().get_Item("A2").set_Text("January")
        try worksheet.get_Range().get_Item("A3").set_Text("February")
        try worksheet.get_Range().get_Item("A4").set_Text("March")
        try worksheet.get_Range().get_Item("A5").set_Text("April")
        try worksheet.get_Range().get_Item("B1").set_Text("Payments")
        try worksheet.get_Range().get_Item("B2").set_NumberValue(251)
        try worksheet.get_Range().get_Item("B3").set_NumberValue(515)
        try worksheet.get_Range().get_Item("B4").set_NumberValue(454)
        try worksheet.get_Range().get_Item("B5").set_NumberValue(874)
        try worksheet.get_Range().get_Item("C1").set_Text("Sample")
        try worksheet.get_Range().get_Item("C2").set_Text("Sample1")
        try worksheet.get_Range().get_Item("C3").set_Text("Sample2")
        try worksheet.get_Range().get_Item("C4").set_Text("Sample3")
        try worksheet.get_Range().get_Item("C5").set_Text("Sample4")

        // Set width for the second column
        try worksheet.SetColumnWidth(2, 10)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/FillDataInWorksheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

