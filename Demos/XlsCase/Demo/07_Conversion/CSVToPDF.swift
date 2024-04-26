import XCTest
@testable import Spire_Xls

class CSVToPDFTests: TestCaseBase {
    func testCSVToPDF() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CSVSample.csv"
        let outputFile = TestUtil.OutputPath + "Demo/CSVToPDF.pdf"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile, ",", 1, 1)

        // Set the SheetFitToPage property as true
        try workbook.get_ConverterSetting().set_SheetFitToPage(true)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Autofit a column if the characters in the column exceed column width
        for i in try 1..<sheet.get_Columns().get_Count() {
            try sheet.AutoFitColumn(i)
        }

        // Save the document
        try workbook.SaveToFile(outputFile, FileFormat.PDF)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/CSVToPDF.pdf"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
