import XCTest
@testable import Spire_Xls

class TextBoxWithWrapTextTests: TestCaseBase {
   func testTextBoxWithWrapText() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/TextBoxSampleB.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/TextBoxWithWrapText.xlsx"

       // Create a workbook
       let workbook = try Workbook()

       // Load the document from disk
       try workbook.LoadFromFile(inputFile)

       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
       // Get the text box
       let shape = try sheet.get_TextBoxes().get_Item(0) as! XlsTextBoxShape

       // Set wrap text
       try shape.set_IsWrapText(true)

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/TextBoxWithWrapText.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}