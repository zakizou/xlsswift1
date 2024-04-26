
import XCTest
@testable import Spire_Xls

class AddScrollBarControlTests: TestCaseBase {
    func testAddScrollBarControl() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddScrollBarControl.xlsx"

        // Create a new workbook.
        let workbook = try Workbook()

        // Load the document from disk.
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet

        // Set a value for range B10.
        try sheet.get_Range().get_Item("B10").set_NumberValue(1)
        try sheet.get_Range().get_Item("B10").get_Style().get_Font().set_IsBold(true)

        // Add a scroll bar control.
        let scrollBar = try sheet.get_ScrollBarShapes().AddScrollBar(10, 3, 150, 20)
        try scrollBar.set_LinkedCell(sheet.get_Range().get_Item("B10"))
        try scrollBar.set_Min(1)
        try scrollBar.set_Max(150)
        try scrollBar.set_IncrementalChange(1)
        try scrollBar.set_Display3DShading(true)

        // Save the changes and close the book.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddScrollBarControl.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
