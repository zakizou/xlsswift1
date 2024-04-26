import XCTest
@testable import Spire_Xls

class LocateImagesTests: XCTestCase {
    func testLocateImages() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/LocateImages.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/LocateImages.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the first picture
        let pic = try (sheet.get_Pictures()as! XlsPicturesCollection).get_Item(0)

        // Set left column offset and top row offset
        try pic.set_LeftColumnOffset(300)
        try pic.set_TopRowOffset(300)

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/LocateImages.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
