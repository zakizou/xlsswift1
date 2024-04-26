import XCTest
@testable import Spire_Xls

class SetDataValidationOnSeparateSheetTests: TestCaseBase {
    func testSetDataValidationOnSeparateSheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SetDataValidationOnSeparateSheet.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetDataValidationOnSeparateSheet.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // This is the first sheet
        let sheet1 = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet1.get_Range().get_Item("B10").set_Text("Here is a dataValidation example.")

        // This is the second sheet
        let sheet2 = try workbook.get_Worksheets().get_Item(1) as! Worksheet

        // The property is to enable the data can be from different sheet
        try workbook.set_Allow3DRangesInDataValidation(true)
        try sheet1.get_Range().get_Item("B11").get_DataValidation().set_DataRange(sheet2.get_Range().get_Item("A1:A7"))

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetDataValidationOnSeparateSheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
