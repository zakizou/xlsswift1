import XCTest
@testable import Spire_Xls

class ScopedNamedRangeTests: TestCaseBase {
    func testScopedNamedRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CreateTable.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ScopedNamedRange.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let namedRange = try sheet.get_Names().Add("Range1")
        try namedRange.set_RefersToRange(sheet.get_Range().get_Item("A1:D19"))

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ScopedNamedRange.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
