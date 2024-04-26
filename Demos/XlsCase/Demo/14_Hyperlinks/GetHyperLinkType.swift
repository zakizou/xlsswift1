@testable import Spire_Xls
import XCTest

class GetHyperLinkTypeTests: TestCaseBase {
    func testGetHyperLinkType() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/HyperlinksSample2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetHyperLinkType.txt"
        try File.delete(outputFile)

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        var sb = [String]()
        for item in try (sheet.get_HyperLinks() as! HyperLinksCollection)  {
            let address = try item.get_Address()
            let type = try item.get_Type()
            sb.append("Link address: \(address)")
            sb.append("Link type: \(type)")
            sb.append("")
        }
        try File.appendAllText(outputFile, [sb.joined(separator: "\n")])
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetHyperLinkType.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
