import XCTest
@testable import Spire_Xls

class DataSortingTests: TestCaseBase {

    func testDataSorting() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/DataSorting.xls"
        let outputFile = TestUtil.OutputPath + "Demo/DataSorting.xlsx"
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        try workbook.get_DataSorter().get_SortColumns().Add(2, OrderBy.Ascending)
        try workbook.get_DataSorter().get_SortColumns().Add(3, OrderBy.Ascending)
        try workbook.get_DataSorter().Sort(worksheet.get_Range().get_Item("A1:E19") as! CellRange)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DataSorting.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
