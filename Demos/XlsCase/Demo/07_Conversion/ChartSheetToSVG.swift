import XCTest
@testable import Spire_Xls

class ChartSheetToSVGTests: TestCaseBase {
    func testChartSheetToSVG() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSheet.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ChartSheetToSVG.svg"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the second chartsheet by name
        let cs = try workbook.GetChartSheetByName("Chart1")
        let fs = try Stream(outputFile)
        try cs.ToSVGStream(fs)
        try fs.Flush()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ChartSheetToSVG.svg"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
