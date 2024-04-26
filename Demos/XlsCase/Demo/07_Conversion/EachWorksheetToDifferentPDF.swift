import XCTest
@testable import Spire_Xls

class EachWorksheetToDifferentPDFTests: TestCaseBase {
    func testEachWorksheetToDifferentPDF() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/EachWorksheetToDifferentPDFSample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/EachWorksheetToDifferentPDF/"

        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        for i in try 0..<workbook.get_Worksheets().get_Count() {
            let sheet = try workbook.get_Worksheets().get_Item(i) as! Worksheet
            let fileName = try outputFile + sheet.get_Name() + ".pdf"
            // Save the sheet to PDF
            try sheet.SaveToPdf(fileName)
        }
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/EachWorksheetToDifferentPDF/"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
