import XCTest
@testable import Spire_Xls

class RichTextForDataLabelTests: TestCaseBase {
    func testRichTextForDataLabel() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartToImage.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RichTextForDataLabel.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get first worksheet of the workbook
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the first chart inside this worksheet
        let chart = try (worksheet.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Get the first datalabel of the first series
        let datalabel = try chart.get_Series().get_Item(0).get_DataPoints().get_Item(0).get_DataLabels()

        // Set the text
        try datalabel.set_Text("Rich Text Label")

        // Show the value
        try chart.get_Series().get_Item(0).get_DataPoints().get_Item(0).get_DataLabels().set_HasValue(true)

        // Set styles for the text
        try chart.get_Series().get_Item(0).get_DataPoints().get_Item(0).get_DataLabels().set_Color(Color.get_Red())
        try chart.get_Series().get_Item(0).get_DataPoints().get_Item(0).get_DataLabels().set_IsBold(true)

        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/RichTextForDataLabel.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
