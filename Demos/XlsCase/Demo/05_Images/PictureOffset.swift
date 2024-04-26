import XCTest
@testable import Spire_Xls

class PictureOffsetTests: XCTestCase {
    func testPictureOffset() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Logo.png"
        let outputFile = TestUtil.OutputPath + "Demo/PictureOffset.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Insert a picture
        let pic = try sheet.get_Pictures().Add(2, 2, inputFile) as! XlsShape
        // Set left offset and top offset from the current range
        try pic.set_LeftColumnOffset(200)
        try pic.set_TopRowOffset(100)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/PictureOffset.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
