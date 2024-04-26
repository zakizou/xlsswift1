import XCTest
@testable import Spire_Xls

class ChangeFontAndSizeTests: TestCaseBase {
    func testChangeFontAndSize() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChangeFontAndSizeForHeaderAndFooter.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ChangeFontAndSize.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        var text = try sheet.get_PageSetup().get_LeftHeader()
        text = "&\"Arial Unicode MS\"&18 Header Footer Sample by Spire.XLS "
        try sheet.get_PageSetup().set_LeftHeader(text)
        try sheet.get_PageSetup().set_RightFooter(text)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ChangeFontAndSize.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
