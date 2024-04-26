import XCTest
@testable import Spire_Xls

class RemoveBorderlineOfTextboxTests: TestCaseBase {
   func testRemoveBorderlineOfTextbox() throws {
       try TestUtil.licenseKey()
       let outputFile = TestUtil.OutputPath + "Demo/RemoveBorderlineOfTextbox.xlsx"

       // Create a workbook.
       let workbook = try Workbook()
       try workbook.set_Version(ExcelVersion.Version2013)

       // Create a new worksheet named "Remove Borderline" and add a chart to the worksheet.
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
       try sheet.set_Name("Remove Borderline")
       let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()

       // Create textbox1 in the chart and input text information.
       let textbox1 = try chart.get_TextBoxes().AddTextBox(50, 50, 100, 600)
       try textbox1.set_Text("The solution with borderline")

       // Create textbox2 in the chart, input text information and remove borderline.
       let textbox2 = try chart.get_TextBoxes().AddTextBox(1000, 50, 100, 600)
       try textbox2.set_Text("The solution without borderline")
       try textbox2.get_Line().set_Weight(0)

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/RemoveBorderlineOfTextbox.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

