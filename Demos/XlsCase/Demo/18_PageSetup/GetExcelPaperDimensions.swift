import XCTest
@testable import Spire_Xls

class GetExcelPaperDimensionsTests: XCTestCase {

    func testGetExcelPaperDimensions() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/GetExcelPaperDimensions.txt"
        try File.delete(outputFile)

        // Create a workbook.
        let workbook = try Workbook()

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        var content = [String]()

        // Get the dimensions of A2 paper.
        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_PaperSize(PaperSizeType.A2Paper)
        try content.append("A2Paper: \((sheet.get_PageSetup() as! XlsPageSetupBase).get_PageWidth()) x \((sheet.get_PageSetup() as! XlsPageSetupBase).get_PageHeight())")

        // Get the dimensions of A3 paper.
        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_PaperSize(PaperSizeType.PaperA3)
        try content.append("PaperA3: \((sheet.get_PageSetup() as! XlsPageSetupBase).get_PageWidth()) x \((sheet.get_PageSetup() as! XlsPageSetupBase).get_PageHeight())")

        // Get the dimensions of A4 paper.
        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_PaperSize(PaperSizeType.PaperA4)
        try content.append("PaperA4: \((sheet.get_PageSetup() as! XlsPageSetupBase).get_PageWidth()) x \((sheet.get_PageSetup() as! XlsPageSetupBase).get_PageHeight())")

        // Get the dimensions of paper letter.
        try (sheet.get_PageSetup() as! XlsPageSetupBase).set_PaperSize(PaperSizeType.PaperLetter)
        try content.append("PaperLetter: \((sheet.get_PageSetup() as! XlsPageSetupBase).get_PageWidth()) x \((sheet.get_PageSetup() as! XlsPageSetupBase).get_PageHeight())")

        // Save to file
        try File.appendAllText(outputFile, content)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetExcelPaperDimensions.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
