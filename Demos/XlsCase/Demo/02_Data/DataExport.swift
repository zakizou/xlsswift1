/*
import XCTest
@testable import Spire_Xls

class DataExportTests: TestCaseBase {

    func testDataExport() throws {
        // TestUtil.LicenseKey()
        let inputFile = TestUtil.DataPath + "Demo/DataExport.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DataExport.xlsx"
        let workbook = try Workbook()
        
        try workbook.LoadFromFile(inputFile)
        
        // Initialize worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        
        // Example code snippet seems to be incomplete or commented out
        // Assuming the dataGrid1.DataSource is to be set to the exported DataTable
        // let dt = try sheet.ExportDataTable()
        // Assuming dataGrid1.DataSource is a property of the view controller where this code is used.
        // dataGrid1.DataSource = dt
        
        // Save to file.
        try workbook.SaveToFile(outputFile, format: FileFormat.Version2010)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DataExport.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
*/
