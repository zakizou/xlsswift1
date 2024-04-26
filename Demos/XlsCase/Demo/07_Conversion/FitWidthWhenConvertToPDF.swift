import XCTest
@testable import Spire_Xls

class FitWidthWhenConvertToPDFTests: TestCaseBase {
    func testFitWidthWhenConvertToPDF() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampleB_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FitWidthWhenConvertToPDF.pdf"

        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        for i in try 0..<workbook.get_Worksheets().get_Count() {
            let sheet = try workbook.get_Worksheets().get_Item(i) as! Worksheet
            // Auto fit page height
            try sheet.get_PageSetup().set_FitToPagesTall(0)
            // Fit one page width
            try sheet.get_PageSetup().set_FitToPagesWide(1)
        }

        try workbook.SaveToFile(outputFile, FileFormat.PDF)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/FitWidthWhenConvertToPDF.pdf"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
