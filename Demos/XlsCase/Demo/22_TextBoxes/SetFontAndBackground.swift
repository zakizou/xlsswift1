import XCTest
@testable import Spire_Xls

class SetFontAndBackgroundTests: TestCaseBase {
   func testSetFontAndBackground() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/Template_Xls_5.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/SetFontAndBackground.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Get the first worksheet.
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       // Get the textbox which will be edited.
       let shape = try sheet.get_TextBoxes().get_Item(0) as! XlsTextBoxShape

       // Set the font and background color for the textbox.
       // Set font.
       let font = try workbook.CreateFont()
       // font.IsStrikethrough = true
       try font.set_FontName("Century Gothic")
       try font.set_Size(10)
       try font.set_IsBold(true)
       try font.set_Color(Color.get_Blue())
       print("1")
       let rto = try shape.get_RichText()
       print("11")
       let rt = try RichText(rto)
       print("111")
       try rt.SetFont(0, Int32(shape.get_Text().count - 1), font)

       // Set background color
       try shape.get_Fill().set_FillType(ShapeFillType.SolidColor)
       try shape.get_Fill().set_ForeKnownColor(ExcelColors.BlueGray)
       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetFontAndBackground.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

