import XCTest
@testable import Spire_Xls

class FormatNamedRangeCellsTests: TestCaseBase {
    func testFormatNamedRangeCells() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AllNamedRanges.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FormatNamedRangeCells.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let NamedRange = try workbook.get_NameRanges().get_Item(0) as! XlsName
        let range = try NamedRange.get_RefersToRange() as! XlsRange
        try range.get_Style().set_Color(Color.get_Yellow())
        try range.get_Style().get_Font().set_IsBold(true)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/FormatNamedRangeCells.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
