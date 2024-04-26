@testable import Spire_Xls
import XCTest

class WriteHyperlinksTests: XCTestCase {
    func testWriteHyperlinks() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WriteHyperlinks.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/WriteHyperlinks.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("B9").set_Text("Home page")
        let hylink1 = try sheet.get_HyperLinks().Add(sheet.get_Range().get_Item("B10")) as! XlsHyperLink
        try hylink1.set_Type(HyperLinkType.Url)
        try hylink1.set_Address("http://www.e-iceblue.com")

        try sheet.get_Range().get_Item("B11").set_Text("Support")
        let hylink2 = try sheet.get_HyperLinks().Add(sheet.get_Range().get_Item("B12")) as! XlsHyperLink
        try hylink2.set_Type(HyperLinkType.Url)
        try hylink2.set_Address("mailto:support@e-iceblue.com")

        try sheet.get_Range().get_Item("B13").set_Text("Forum")
        let hylink3 = try sheet.get_HyperLinks().Add(sheet.get_Range().get_Item("B14")) as! XlsHyperLink
        try hylink3.set_Type(HyperLinkType.Url)
        try hylink3.set_Address("https://www.e-iceblue.com/forum/")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/WriteHyperlinks.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}