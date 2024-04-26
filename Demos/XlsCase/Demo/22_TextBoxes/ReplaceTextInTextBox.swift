import XCTest
@testable import Spire_Xls

class ReplaceTextInTextBoxTests: TestCaseBase {
   func testReplaceTextInTextBox() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ReplaceTextInTextBox.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/ReplaceTextInTextBox.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       let tag = "TAG_1$TAG_2"
       let replace = "Spire.XLS for .NET$Spire.XLS for JAVA"

       var i = 0
       let strs = tag.split(separator: "$")
       let reps = replace.split(separator: "$")
       while i < strs.count {
           // Replace text in textbox
           try _ReplaceTextInTextBox(sheet, "<" + strs[i] + ">", "" + reps[i])
           i += 1
       }

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/ReplaceTextInTextBox.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }

   private func _ReplaceTextInTextBox(_ sheet: Worksheet, _ sFind: String, _ sReplace: String) throws {
       let textBoxes = try sheet.get_TextBoxes() as! TextBoxCollection
       for tb in textBoxes {
           let textBox = tb as! XlsTextBoxShape
           if try textBox.get_Text() != "" {
               if try textBox.get_Text().contains(sFind) {
                   try textBox.set_Text(textBox.get_Text().replacingOccurrences(of: sFind, with: sReplace))
               }
           }
       }
   }
}

