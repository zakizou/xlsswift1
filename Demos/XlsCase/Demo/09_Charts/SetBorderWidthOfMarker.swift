import XCTest
@testable import Spire_Xls

class SetBorderWidthOfMarkerTests: TestCaseBase {
    func testSetBorderWidthOfMarker() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SetBorderWidthOfMarker.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetBorderWidthOfMarker.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the chart from the first worksheet
        let chart = try (workbook.get_Worksheets().get_Item(0) as! Worksheet).get_Charts().get_Item(0) as! Chart

        try chart.get_Series().get_Item(0).get_DataFormat().set_MarkerBorderWidth(1.5) // unit is pt
        try chart.get_Series().get_Item(1).get_DataFormat().set_MarkerBorderWidth(2.5) // unit is pt

        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetBorderWidthOfMarker.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
