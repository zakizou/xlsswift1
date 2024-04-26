import XCTest
@testable import Spire_Xls

class InsertControlsTests: TestCaseBase {

   func testInsertControls() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/InsertControls.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/InsertControls.xlsx"

       // Load the workbook and worksheet
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       // Add a textbox
       try worksheet.get_TextBoxes().AddTextBox(9, 2, 25, 100).set_Text("Hello World")

       // Add a checkbox
       let checkBox = try worksheet.get_CheckBoxes().AddCheckBox(11, 2, 15, 100)
       try checkBox.set_CheckState(CheckState.Checked)
       try checkBox.set_Text("Check Box 1")

       // Add a radio button
       let radioButton = try worksheet.get_RadioButtons().Add(13, 2, 15, 100)
       try radioButton.set_Text("Option 1")

       // Add a combobox
       let comboBox = try worksheet.get_ComboBoxes().AddComboBox(15, 2, 15, 100)
       try comboBox.set_ListFillRange(worksheet.get_Range().get_Item("A41:A47"))

       // Save the workbook and dispose of resources
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
       try workbook.Dispose()
   }
}
