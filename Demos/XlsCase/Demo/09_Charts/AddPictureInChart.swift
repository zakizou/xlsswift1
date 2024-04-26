import XCTest
@testable import Spire_Xls

class AddPictureInChartTests: TestCaseBase {
    func testAddPictureInChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartToImage.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddPictureInChart.xlsx"
        let inputFile_Img = TestUtil.DataPath + "Demo/SpireXls.png"

        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the chart
        let chart = try sheet.get_Charts().get_Item(0) as! Chart

        // Add the picture in chart
        try chart.get_Shapes().AddPicture(inputFile_Img)

        // Save and launch result file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/AddPictureInChart.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
