import XCTest
@testable import Spire_Xls

class AddSpinnerControlTests: TestCaseBase {
    func testAddSpinnerControl() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddSpinnerControl.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set text for range C11
        try sheet.get_Range().get_Item("C11").set_Text("Value:")
        try sheet.get_Range().get_Item("C11").get_Style().get_Font().set_IsBold(true)

        // Set value for range B10
        try sheet.get_Range().get_Item("C12").set_Value2(SpireInt32(0))

        // Add spinner control
        let spinner = try sheet.get_SpinnerShapes().AddSpinner(12, 4, 20, 20)
        try spinner.set_LinkedCell(sheet.get_Range().get_Item("C12"))
        try spinner.set_Min(0)
        try spinner.set_Max(100)
        try spinner.set_IncrementalChange(5)
        try spinner.set_Display3DShading(true)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddSpinnerControl.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
