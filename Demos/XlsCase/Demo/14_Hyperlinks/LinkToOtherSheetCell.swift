@testable import Spire_Xls
import XCTest

class LinkToOtherSheetCellTests: TestCaseBase {
    func testLinkToOtherSheetCell() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/LinkToOtherSheetCell.xlsx"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let range = try sheet.get_Range().get_Item("A1")

        let hyperlink = try sheet.get_HyperLinks().Add(range) as! XlsHyperLink
        try hyperlink.set_Type(HyperLinkType.Workbook)
        try hyperlink.set_TextToDisplay("Link to Sheet2 cell C5")
        try hyperlink.set_Address("Sheet2!C5")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/LinkToOtherSheetCell.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}