import XCTest
@testable import Spire_Xls

class ExtractTextFromATextboxTests: TestCaseBase {
   func testExtractTextFromATextbox() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/Template_Xls_5.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/ExtractTextFromATextbox.txt"
       try File.delete(outputFile)

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)

       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       // Get the first textbox.
       let shape = try sheet.get_TextBoxes().get_Item(0) as! XlsTextBoxShape

       // Extract text from the text box.
       var content = ["The text extracted from the TextBox is: "]
       try content.append(shape.get_Text())

       // Save to file.
       try File.appendAllText(outputFile, content)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/ExtractTextFromATextbox.txt"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

