import XCTest
@testable import Spire_Xls

class AddListBoxControlTests: TestCaseBase {

    func testAddListBoxControl() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddListBoxControl.xlsx"

        // Load the document and perform necessary operations.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        // Set text for cells.
        try sheet.get_Range().get_Item("A7").set_Text("Beijing")
        try sheet.get_Range().get_Item("A8").set_Text("New York")
        try sheet.get_Range().get_Item("A9").set_Text("ChengDu")
        try sheet.get_Range().get_Item("A10").set_Text("Paris")
        try sheet.get_Range().get_Item("A11").set_Text("Boston")
        try sheet.get_Range().get_Item("A12").set_Text("London")
        try sheet.get_Range().get_Item("C13").set_Text("City:")
        try sheet.get_Range().get_Item("C13").get_Style().get_Font().set_IsBold(true)
        // Add listbox control.
        let listBox = try sheet.get_ListBoxes().AddListBox(13, 4, 100, 80)
        try listBox.set_SelectionType(SelectionType.Single)
        try listBox.set_SelectedIndex(2)
        try listBox.set_Display3DShading(true)
        try listBox.set_ListFillRange(sheet.get_Range().get_Item("A7:A12"))
        // Save the changes and validate the result.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddListBoxControl.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}