import XCTest
@testable import Spire_Xls

class SheetToImageTests: TestCaseBase {
    func testSheetToImage() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SheetToImage.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/Image/SheetToImage.png"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.ToImage(sheet.get_FirstRow(), sheet.get_FirstColumn(), sheet.get_LastRow(), sheet.get_LastColumn()).Save(outputFile)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/Image/SheetToImage.png"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
