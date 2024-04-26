@testable import Spire_Xls
import XCTest

class ReadHyperlinksTests: XCTestCase {
    func testReadHyperlinks() throws {
    try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReadHyperlinks.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ReadHyperlinks.txt"
        try File.delete(outputFile)

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let address1 = try sheet.get_HyperLinks().get_Item(0).get_Address()
        let address2 = try sheet.get_HyperLinks().get_Item(1).get_Address()
        try File.appendText(outputFile, address1 + "\r\n" + address2)

        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ReadHyperlinks.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
