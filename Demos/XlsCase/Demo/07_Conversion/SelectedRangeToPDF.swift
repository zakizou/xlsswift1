import XCTest
@testable import Spire_Xls

class SelectedRangeToPDFTests: TestCaseBase {
    func testSelectedRangeToPDF() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ConversionSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SelectedRangeToPDF.pdf"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Add a new sheet to workbook
        let newSheet = try workbook.get_Worksheets().Add("newsheet") as! Worksheet

        // Copy your area to new sheet
        try (workbook.get_Worksheets().get_Item(0).get_Range().get_Item("A9:E15") as! CellRange).Copy(newSheet.get_Range().get_Item("A9:E15") as! CellRange, false, true)

        // Auto fit column width
        try newSheet.get_Range().get_Item("A9:E15").AutoFitColumns()

        // Save the new sheet to PDF
        try newSheet.SaveToPdf(outputFile)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SelectedRangeToPDF.pdf"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
