import XCTest
@testable import Spire_Xls

class DifferentHeaderFooterOnFirstPageTests: TestCaseBase {
    func testDifferentHeaderFooterOnFirstPage() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/DifferentHeaderFooterOnFirstPage.xlsx"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("A1").set_Text("Hello World")
        try sheet.get_Range().get_Item("F30").set_Text("Hello World")
        try sheet.get_Range().get_Item("G150").set_Text("Hello World")

        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_DifferentFirst(1)

        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_FirstHeaderString("Different First page")
        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_FirstFooterString("Different First footer")

        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_LeftHeader("Demo of Spire.XLS")
        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_CenterFooter("Footer by Spire.XLS")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/DifferentHeaderFooterOnFirstPage.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
