import XCTest
@testable import Spire_Xls

class HideRowsAndColumnsTests: TestCaseBase {

    func testHideRowsAndColumns() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/HideRowsAndColumns.xls"
        let outputFile = TestUtil.OutputPath + "Demo/HideRowsAndColumns.xlsx"
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Hiding the column of the worksheet
        try worksheet.HideColumn(2)
        // Hiding the row of the worksheet
        try worksheet.HideRow(4)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/HideRowsAndColumns.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
