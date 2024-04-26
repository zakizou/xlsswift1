import XCTest
@testable import Spire_Xls

class ManipulateTextBoxTests: TestCaseBase {
   func testManipulateTextBox() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ManipulateTextBoxControl.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/ManipulateTextBox.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Get the first worksheet
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       // Get the first textbox
       let tb = try sheet.get_TextBoxes().get_Item(0) as! XlsTextBoxShape

       // Change the text of textbox
       try tb.set_Text("Spire.XLS for .NET")

       // Set the alignment of textbox as center
       try tb.set_HAlignment(CommentHAlignType.Center)
       try tb.set_VAlignment(CommentVAlignType.Center)

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/ManipulateTextBox.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

