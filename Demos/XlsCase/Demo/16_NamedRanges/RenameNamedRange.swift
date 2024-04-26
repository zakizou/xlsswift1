import XCTest
@testable import Spire_Xls

class RenameNamedRangeTests: TestCaseBase {
    func testRenameNamedRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AllNamedRanges.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RenameNamedRange.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        try workbook.get_NameRanges().get_Item(0).set_Name("RenameRange")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/RenameNamedRange.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
