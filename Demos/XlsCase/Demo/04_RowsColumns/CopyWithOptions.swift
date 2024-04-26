import XCTest
@testable import Spire_Xls

class CopyWithOptionsTests: TestCaseBase {

    func testCopyWithOptions() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Sample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CopyWithOptions.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the Excel document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet1 = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add a new worksheet as destination sheet
        let destinationSheet = try workbook.get_Worksheets().Add("DestSheet")

        // Specify a copy range of original sheet
        let cellRange = try sheet1.get_Range().get_Item("B2:D4") as! CellRange

        // Copy the specified range to added worksheet and keep original styles and update reference
        try (workbook.get_Worksheets().get_Item(0) as! Worksheet).Copy(cellRange, workbook.get_Worksheets().get_Item(1) as! Worksheet, 2, 1, true, true)

        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/CopyWithOptions.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
