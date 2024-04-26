@testable import Spire_Xls
import XCTest

class AddHyperlinkToTextTests: TestCaseBase {
    func testAddHyperlinkToText() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CommonTemplate1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddHyperlinkToText.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let urlLink = try sheet.get_HyperLinks().Add(try sheet.get_Range().get_Item("D10")) as! XlsHyperLink
        try urlLink.set_TextToDisplay(try (sheet.get_Range().get_Item("D10")).get_Text())
        try urlLink.set_Type(HyperLinkType.Url)
        try urlLink.set_Address("http://en.wikipedia.org/wiki/Chicago")

        let mailLink = try sheet.get_HyperLinks().Add(try sheet.get_Range().get_Item("E10")) as! XlsHyperLink
        try mailLink.set_TextToDisplay(try (sheet.get_Range().get_Item("E10")).get_Text())
        try mailLink.set_Type(HyperLinkType.Url)
        try mailLink.set_Address("mailto:Amor.Aqua@gmail.com")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/AddHyperlinkToText.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
