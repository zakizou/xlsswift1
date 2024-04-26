import XCTest
@testable import Spire_Xls

class PictureRefRangeTests: XCTestCase {
    func testPictureRefRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PictureRefRange.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/PictureRefRange.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set cell values
        try sheet.get_Range().get_Item("A1").set_Value("Spire.XLS")
        try sheet.get_Range().get_Item("B3").set_Value("E-iceblue")

        // Get the first picture in worksheet
        let picture = try (sheet.get_Pictures()as! XlsPicturesCollection).get_Item(0)

        // Set the reference range of the picture to A1:B3
        try picture.set_RefRange("A1:B3")

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/PictureRefRange.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
