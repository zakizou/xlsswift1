import XCTest
@testable import Spire_Xls

class MergeNamedRangeCellsTests: TestCaseBase {
    func testMergeNamedRangeCells() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AllNamedRanges.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/MergeNamedRangeCells.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let NamedRange = try workbook.get_NameRanges().get_Item(0)
        let range = try NamedRange.get_RefersToRange()
        try range.Merge()

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/MergeNamedRangeCells.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}