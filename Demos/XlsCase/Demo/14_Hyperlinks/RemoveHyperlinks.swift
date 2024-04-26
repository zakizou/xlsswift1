@testable import Spire_Xls
import XCTest

class RemoveHyperlinksTests: XCTestCase {
    func testRemoveHyperlinks() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/HyperlinksSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemoveHyperlinks.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let links = try sheet.get_HyperLinks()

        try (sheet.get_Range().get_Item("B1") as! CellRange).ClearAll()
        try (sheet.get_Range().get_Item("B2") as! CellRange).ClearAll()
        try (sheet.get_Range().get_Item("B3") as! CellRange).ClearAll()

        try links.RemoveAt(0)
        try links.RemoveAt(0)
        try links.RemoveAt(0)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/RemoveHyperlinks.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
