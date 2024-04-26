import XCTest
@testable import Spire_Xls

class HideOrUnhideShapeTests: TestCaseBase {
    func testHideOrUnhideShape() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_5.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideOrUnhideShape.xlsx"

        // Create a workbook.
        let workbook = try Workbook()

        // Load the file from disk.
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Hide the second shape in the worksheet.
        try sheet.get_PrstGeomShapes().get_Item(1).set_Visible(false)

        // Show the second shape in the worksheet.
        // try sheet.get_PrstGeomShapes().get_Item(1).set_Visible(true)

        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/HideOrUnhideShape.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
