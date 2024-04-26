import XCTest
@testable import Spire_Xls

class HideZeroValuesTests: TestCaseBase {
    func testHideZeroValues() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampleB_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideZeroValues.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set false to hide the zero values in sheet
        try sheet.set_IsDisplayZeros(false)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/HideZeroValues.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

