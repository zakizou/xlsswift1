import XCTest
@testable import Spire_Xls

class RemovePictureBorderTests: XCTestCase {
    func testRemovePictureBorder() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PictureBorder.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemovePictureBorder.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        // Load the Excel document from disk
        try workbook.LoadFromFile(inputFile)
        // Get the first worksheet
        let sheet1 = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the first picture from the first worksheet
        let picture = try (sheet1.get_Pictures()as! XlsPicturesCollection).get_Item(0)

        // Remove the picture border
        // Method-1:
        try picture.get_Line().set_Visible(false)

        // Method-2:
        // picture.Line.Weight = 0

        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/RemovePictureBorder.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
