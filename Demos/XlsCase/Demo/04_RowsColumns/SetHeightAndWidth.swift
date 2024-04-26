import XCTest
@testable import Spire_Xls

class SetHeightAndWidthTests: TestCaseBase {

    func testSetHeightAndWidth() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SetHeightAndWidth.xls"
        let outputFile = TestUtil.OutputPath + "Demo/SetHeightAndWidth.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Setting the width to 30
        try worksheet.SetColumnWidth(4, 30)
        // Setting the height to 30
        try worksheet.SetRowHeight(4, 30)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/SetHeightAndWidth.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
