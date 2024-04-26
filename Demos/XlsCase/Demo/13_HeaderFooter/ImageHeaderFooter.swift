import XCTest
@testable import Spire_Xls

class ImageHeaderFooterTests: TestCaseBase {
    func testImageHeaderFooter() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ImageHeaderFooter.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ImageHeaderFooter.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let image = try Image.FromFile(TestUtil.DataPath + "Demo/Logo.png")
        try sheet.get_PageSetup().set_LeftHeaderImage(image)
        try sheet.get_PageSetup().set_LeftHeader("&G")

        try sheet.get_PageSetup().set_CenterFooterImage(image)
        try sheet.get_PageSetup().set_CenterFooter("&G")

        try sheet.set_ViewMode(ViewMode.Layout)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ImageHeaderFooter.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
