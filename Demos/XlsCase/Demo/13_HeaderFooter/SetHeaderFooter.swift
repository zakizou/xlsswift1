import XCTest
@testable import Spire_Xls

class SetHeaderFooterTests: TestCaseBase {
    func testSetHeaderFooter() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SetHeaderFooter.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetHeaderFooter.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try worksheet.get_PageSetup().set_LeftHeader("&\"Arial Unicode MS\"&14 Spire.XLS for .NET ")
        try worksheet.get_PageSetup().set_CenterFooter("Footer Text")

        try worksheet.set_ViewMode(ViewMode.Layout)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetHeaderFooter.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}