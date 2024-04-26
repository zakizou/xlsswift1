@testable import Spire_Xls
import XCTest

class AddImageHyperlinkTests: TestCaseBase {
    func testAddImageHyperlink() throws {
        try TestUtil.licenseKey()
        let picPath = TestUtil.DataPath + "Demo/SpireXls.png"
        let outputFile = TestUtil.OutputPath + "Demo/AddImageHyperlink.xlsx"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Columns().get_Item(0).set_ColumnWidth(22)
        try sheet.get_Range().get_Item("A1").set_Text("Image Hyperlink")
        try sheet.get_Range().get_Item("A1").get_Style().set_VerticalAlignment(VerticalAlignType.Top)

        let picture = try sheet.get_Pictures().Add(2, 1, picPath) as! XlsBitmapShape
        try picture.SetHyperLink("https://www.e-iceblue.com/Introduce/excel-for-net-introduce.html", true)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/AddImageHyperlink.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
