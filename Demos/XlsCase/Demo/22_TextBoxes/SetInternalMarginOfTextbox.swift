import XCTest
@testable import Spire_Xls

class SetInternalMarginOfTextboxTests: TestCaseBase {
   func testSetInternalMarginOfTextbox() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/SetInternalMarginOfTextbox.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Get the first worksheet.
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       // Add a textbox to the sheet and set its position and size.
       let textbox = try sheet.get_TextBoxes().AddTextBox(4, 2, 100, 300) as! TextBoxShapeBase

       // Set the text on the textbox.
       try textbox.set_Text("Insert TextBox in Excel and set the margin for the text")
       try textbox.set_HAlignment(CommentHAlignType.Center)
       try textbox.set_VAlignment(CommentVAlignType.Center)

       // Set the inner margins of the contents.
       try textbox.set_InnerLeftMargin(1)
       try textbox.set_InnerRightMargin(3)
       try textbox.set_InnerTopMargin(1)
       try textbox.set_InnerBottomMargin(1)

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetInternalMarginOfTextbox.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

