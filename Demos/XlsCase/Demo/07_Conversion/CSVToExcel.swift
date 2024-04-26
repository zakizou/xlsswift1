import XCTest
@testable import Spire_Xls

class CSVToExcelTests: TestCaseBase {
    func testCSVToExcel() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CSVToExcel.csv"
        let outputFile = TestUtil.OutputPath + "Demo/CSVToExcel.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load a csv file
        try workbook.LoadFromFile(inputFile, ",", 1, 1)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.get_Range().get_Item("D2:E19").set_IgnoreErrorOptions(IgnoreErrorType.NumberAsText)
        try sheet.get_AllocatedRange().AutoFitColumns()

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/CSVToExcel.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
