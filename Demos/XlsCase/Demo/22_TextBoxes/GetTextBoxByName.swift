import XCTest
@testable import Spire_Xls

class GetTextBoxByNameTests: TestCaseBase {
   func testGetTextBoxByName() throws {
       try TestUtil.licenseKey()
       let outputFile = TestUtil.OutputPath + "Demo/GetTextBoxByName.txt"
       try File.delete(outputFile)

       // Create a workbook
       let workbook = try Workbook()

       // Get the default first worksheet
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       // Insert a TextBox
       try sheet.get_Range().get_Item("A2").set_Text("Name：")
       let textBox = try sheet.get_TextBoxes().AddTextBox(2, 2, 18, 65)

       // Set the name
       try textBox.set_Name("FirstTextBox")

       // Set string text for TextBox
       try textBox.set_Text("Spire.XLS for .NET is a professional Excel .NET component that can be used to any type of .NET 2.0, 3.5, 4.0 or 4.5 framework application, both ASP.NET web sites and Windows Forms application.")

       // Get the TextBox by the name
       let FindTextBox = try sheet.get_TextBoxes().get_Item("FirstTextBox") as! XlsTextBoxShape

       // Get the TextBox text
       let text = try FindTextBox.get_Text()

       // Create StringBuilder to save
       var content = [String]()

       // Set string format for displaying
       let result = try "The text of \"\(textBox.get_Name())\" is :\(text)"

       // Add result string to StringBuilder
       content.append(result)
       try File.appendAllText(outputFile, content)

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetTextBoxByName.txt"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

