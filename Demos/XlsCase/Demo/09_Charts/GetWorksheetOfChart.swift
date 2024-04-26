import XCTest
@testable import Spire_Xls

class GetWorksheetOfChartTests: TestCaseBase {
    func testGetWorksheetOfChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartToImage.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetWorksheetOfChart.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Access first worksheet of the workbook
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Access the first chart inside this worksheet
        let chart = try (worksheet.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Get its worksheet
        let obj = try chart.get_Worksheet()
        let wSheet = Worksheet(obj)

        // Create StringBuilder to save
        var content = [String]()

        // Set string format for displaying
        let result = try "Sheet Name: " + worksheet.get_Name() + "\r\nCharts' sheet Name: " + wSheet.get_Name()

        // Add result string to StringBuilder
        content.append(result)
        // Save them to a txt file
        try File.appendAllText(outputFile, [content.joined(separator: "\n")])
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetWorksheetOfChart.txt"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
