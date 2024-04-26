@testable import Spire_Xls
import XCTest

class ModifyHyperlinkTests: XCTestCase {
    func testModifyHyperlink() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ModifyHyperlink.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ModifyHyperlink.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let links = try sheet.get_HyperLinks()
        try links.get_Item(0).set_TextToDisplay("Spire.XLS for .NET")
        try links.get_Item(0).set_Address("http://www.e-iceblue.com/Introduce/excel-for-net-introduce.html")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ModifyHyperlink.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
