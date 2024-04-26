import XCTest
@testable import Spire_Xls

class ApplySoftEdgesEffectTests: TestCaseBase {
    func testApplySoftEdgesEffect() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ApplySoftEdgesEffect.xlsx"

        // Create a workbook and load from file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0)

        // Specify the size of the soft edge. Value can be set from 0 to 100
        try chart.get_ChartArea().get_Shadow().set_SoftEdge(25)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ApplySoftEdgesEffect.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
