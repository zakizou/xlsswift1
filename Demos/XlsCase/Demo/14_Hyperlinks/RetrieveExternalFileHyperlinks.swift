@testable import Spire_Xls
import XCTest

class RetrieveExternalFileHyperlinksTests: XCTestCase {
    func testRetrieveExternalFileHyperlinks() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/RetrieveExternalFileHyperlinks.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RetrieveExternalFileHyperlinks.xlsx"
        let outputFile_T = TestUtil.OutputPath + "Demo/RetrieveExternalFileHyperlinks.txt"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        var content = [String]()

        for item in try (sheet.get_HyperLinks() as! HyperLinksCollection) {
            let address = try item.get_Address()
            let range = try item.get_Range() as! XlsRange
            let sheetName = try range.get_WorksheetName()
            try content.append("Cell[\(range.get_Row()),\(range.get_Column())] in sheet \"\(sheetName)\" contains File URL: \(address)")
        }
        try File.appendAllText(outputFile_T, [content.joined(separator: "\n")])

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/RetrieveExternalFileHyperlinks.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

