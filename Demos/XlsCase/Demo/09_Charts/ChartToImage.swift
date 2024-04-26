import XCTest
@testable import Spire_Xls

class ChartToImage_Tests: XCTestCase {
    func testChartToImage() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartToImage.xlsx"
        let output = TestUtil.OutputPath + "Demo/Image/"
        if !Directory.exists(output) {
            try Directory.createDirectory(output)
        }

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Save chart as image
        let image = try workbook.SaveChartAsImage(workbook.get_Worksheets().get_Item(0) as! Worksheet, 0)
        try image.Save(output + "ChartToImage.png", ImageFormat.get_Png())
        try workbook.Dispose()
        try image.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/Image/ChartToImage.png"
        // let outputFile = TestUtil.OutputPath + "Demo/Image/ChartToImage.png"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
