import XCTest
@testable import Spire_Xls

class GetDefaultRowAndColumnCountTests: TestCaseBase {

    func testGetDefaultRowAndColumnCount() throws {

        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/GetDefaultRowAndColumnCount.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()
        // Clear all worksheets
        try workbook.get_Worksheets().Clear()

        // Create a new worksheet
        let sheet = try workbook.CreateEmptySheet()
        var sb = [String]()
        // Get row and column count
        let rowCount = try sheet.get_Rows().get_Count()
        let columnCount = try sheet.get_Columns().get_Count()

        sb.append("The default row count is: \(rowCount)")
        sb.append("The default column count is: \(columnCount)")
        try File.appendAllText(outputFile, sb)

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/GetDefaultRowAndColumnCount.txt"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
