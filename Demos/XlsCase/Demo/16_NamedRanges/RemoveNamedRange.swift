import XCTest
@testable import Spire_Xls

class RemoveNamedRangeTests: TestCaseBase {
    func testRemoveNamedRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AllNamedRanges.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemoveNamedRange.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        try workbook.get_NameRanges().RemoveAt(0)
        try workbook.get_NameRanges().Remove("NameRange2")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/RemoveNamedRange.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
