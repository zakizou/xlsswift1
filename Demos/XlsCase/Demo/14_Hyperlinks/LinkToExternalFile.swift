@testable import Spire_Xls
import XCTest

class LinkToExternalFileTests: TestCaseBase {
    func testLinkToExternalFile() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/LinkToExternalFile.xlsx"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let range = try sheet.get_Range().get_Item(1, 1)

        let hyperlink = try sheet.get_HyperLinks().Add(range) as! XlsHyperLink
        try hyperlink.set_Type(HyperLinkType.File)
        try hyperlink.set_TextToDisplay("Link To External File")
        try hyperlink.set_Address(TestUtil.DataPath + "Demo/SampeB_4.xlsx")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/LinkToExternalFile.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
