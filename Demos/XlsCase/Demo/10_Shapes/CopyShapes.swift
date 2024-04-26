import XCTest
@testable import Spire_Xls

class CopyShapesTests: TestCaseBase {
    func testCopyShapes() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CopyShapes.xlsx"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Create line shape
        let line = try sheet.get_TypedLines().AddLine()
        try line.set_Top(50)
        try line.set_Left(30)
        try line.set_Width(30)
        try line.set_Height(50)
        try line.set_BeginArrowHeadStyle(ShapeArrowStyleType.LineArrowDiamond)
        try line.set_EndArrowHeadStyle(ShapeArrowStyleType.LineArrow)

        let copyShapes = try workbook.get_Worksheets().get_Item(1) as! Worksheet
        // Copy the line into other sheet
        try copyShapes.get_TypedLines().AddCopy(line)

        // Create a button and then copy into other sheet
        let button = try sheet.get_TypedRadioButtons().Add(5, 5, 20, 20)
        try copyShapes.get_TypedRadioButtons().AddCopy(button)

        // Create a textbox and then copy into other sheet
        let textbox = try sheet.get_TypedTextBoxes().AddTextBox(5, 7, 50, 100)
        try copyShapes.get_TypedTextBoxes().AddCopy(textbox)

        // Create a checkbox and then copy into other sheet
        let checkbox = try sheet.get_TypedCheckBoxes().AddCheckBox(10, 1, 20, 20)
        try copyShapes.get_TypedCheckBoxes().AddCopy(checkbox)

        // Create a comboboxes and then copy into other sheet
        try sheet.get_Range().get_Item("A14").set_Value("1")
        try sheet.get_Range().get_Item("A15").set_Value("2")
        let comboBoxes = try sheet.get_TypedComboBoxes().AddComboBox(10, 5, 30, 30)
        try comboBoxes.set_ListFillRange(sheet.get_Range().get_Item("A14:A15"))
        try copyShapes.get_TypedComboBoxes().AddCopy(comboBoxes)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CopyShapes.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
