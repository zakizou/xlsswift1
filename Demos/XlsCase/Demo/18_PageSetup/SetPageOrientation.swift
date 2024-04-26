import XCTest
@testable import Spire_Xls

class SetPageOrientationTests: TestCaseBase {

    func testSetPageOrientation()throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetPageOrientation.xlsx"

        // Create a workbook.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set the page orientation to Landscape.
        try sheet.get_PageSetup().set_Orientation(PageOrientationType.Landscape)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetPageOrientation.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
