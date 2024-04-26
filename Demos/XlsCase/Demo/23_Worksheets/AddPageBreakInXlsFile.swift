import XCTest
@testable import Spire_Xls

class AddPageBreakInXlsFileTests: TestCaseBase {
    func testAddPageBreakInXlsFile() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddPageBreakInXlsFile.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try (sheet.get_HPageBreaks() as! HPageBreaksCollection).Add(try sheet.get_Range().get_Item("E4") as! CellRange)
        try (sheet.get_VPageBreaks() as! VPageBreaksCollection).Add(try sheet.get_Range().get_Item("C4") as! CellRange)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/AddPageBreakInXlsFile.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

