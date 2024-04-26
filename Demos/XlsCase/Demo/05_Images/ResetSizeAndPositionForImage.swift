import XCTest
@testable import Spire_Xls

class ResetSizeAndPositionForImageTests: XCTestCase {
    func testResetSizeAndPositionForImage() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SpireXls.png"
        let outputFile = TestUtil.OutputPath + "Demo/ResetSizeAndPositionForImage.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add a picture to the first worksheet
        let picture = try sheet.get_Pictures().Add(1, 1, inputFile)

        // Set the size for the picture
        try picture.set_Width(200)
        try picture.set_Height(200)

        // Set the position for the picture
        try picture.set_Left(200)
        try picture.set_Top(100)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ResetSizeAndPositionForImage.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
