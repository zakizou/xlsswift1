import XCTest
@testable import Spire_Xls

class DifferentHeaderFooterTests: TestCaseBase {
    func testDifferentHeaderFooter() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/DifferentHeaderFooter.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DifferentHeaderFooter.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("A1").set_Text("Page 1")
        try sheet.get_Range().get_Item("G1").set_Text("Page 2")

        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_DifferentOddEven(1)

        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_OddHeaderString("&\"Arial\"&12&B&KFFC000 Odd_Header")
        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_OddFooterString("&\"Arial\"&12&B&KFFC000 Odd_Footer")
        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_EvenHeaderString("&\"Arial\"&12&B&KFF0000 Even_Header")
        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_EvenFooterString("&\"Arial\"&12&B&KFF0000 Even_Footer")

        try sheet.set_ViewMode(ViewMode.Layout)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/DifferentHeaderFooter.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
