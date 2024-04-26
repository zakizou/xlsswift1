import XCTest
@testable import Spire_Xls

class ToPDFA1BTests: TestCaseBase {

    func testToPDFA1B() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ToPDF_A1BExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToPDFA1B.pdf"

        // Create a workbook
        let workbook = try Workbook()

        // Load an excel file
        try workbook.LoadFromFile(inputFile)

        // Convert excel to PDFA/1-B
        try workbook.get_ConverterSetting().set_PdfConformanceLevel(PdfConformanceLevel.Pdf_A1B)
        try workbook.SaveToFile(outputFile, .PDF)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ToPDFA1B.pdf"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
