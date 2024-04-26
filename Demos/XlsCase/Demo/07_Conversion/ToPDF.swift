import XCTest
@testable import Spire_Xls

class ToPDFTests: TestCaseBase {

    func testToPDF() throws {
        try TestUtil.licenseKey()
        let workbook = try Workbook()
        let inputFile = TestUtil.DataPath + "Demo/ToPDF.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToPDF.pdf"
        try workbook.LoadFromFile(inputFile)
        try workbook.get_ConverterSetting().set_SheetFitToPage(true)
        try workbook.SaveToFile(outputFile, .PDF)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ToPDF.pdf"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
