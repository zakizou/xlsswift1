// import XCTest
// @testable import Spire_Xls

// class CSVToDataTableTests: TestCaseBase {
//    func testCSVToDataTable() throws {
//        try TestUtil.licenseKey()
//        let inputFile = TestUtil.DataPath + "Demo/CSVSample.csv"
//        let outputFile = TestUtil.OutputPath + "Demo/CSVToDataTable.xlsx"

//        // Create a workbook and load the CSV file
//        let workbook = try Workbook()
//        try workbook.LoadFromFile(inputFile, separator: ",")

//        // Get the first worksheet and export to a data table
//        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
//        let dataTable = try worksheet.ExportDataTable()

//        // Save the workbook and dispose of resources
//        try workbook.SaveToFile(outputFile, FileFormat.Version2010)
//        try workbook.Dispose()

//        // Check data in xlsx (uncomment if needed)
//        // let baseLineFile = TestUtil.baseLinePath + "Demo/CSVToDataTable.xlsx"
//        // Compare.compareFile(baseLineFile, outputFile)
//    }
// }
