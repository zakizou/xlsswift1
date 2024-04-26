import XCTest
@testable import Spire_Xls

class ToPdfWithChangePageSizeTests: TestCaseBase {

    func testToPdfWithChangePageSize() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampleB_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToPdfWithChangePageSize.pdf"

        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        for i in try 0..<workbook.get_Worksheets().get_Count() {
            let sheet = try workbook.get_Worksheets().get_Item(i) as! Worksheet
            // Change the page size
            try sheet.get_PageSetup().set_PaperSize(PaperSizeType.PaperA3)
        }

        try workbook.SaveToFile(outputFile, .PDF)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ToPdfWithChangePageSize.pdf"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
