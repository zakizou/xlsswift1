// import XCTest
// @testable import Spire_Xls

// class ImportDataFromDataColumnTests: TestCaseBase {
//     func testImportDataFromDataColumn() throws {
//         try TestUtil.licenseKey()
//         let outputFile = TestUtil.OutputPath + "Demo/ImportDataFromDataColumn.xlsx"

//         // Create a workbook
//         let workbook = try Workbook()

//         // Create an empty worksheet
//         try workbook.CreateEmptySheets(1)

//         // Get the first worksheet
//         let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet

//         // Create a DataTable object (assuming `DataTable` is available)
//         // let dataTable = DataTable("Customer")
//         // dataTable.Columns.Add("No", typeof(Int32))
//         // dataTable.Columns.Add("Name", typeof(string))
//         // dataTable.Columns.Add("City", typeof(string))

//         // Provide your data in an alternative format (e.g., an array of dictionaries)
//         let data: [[String: Any]] = [
//             ["No": 1, "Name": "Tom", "City": "New York"],
//             ["No": 2, "Name": "Jerry", "City": "China"],
//             ["No": 3, "Name": "Dive Time", "City": "Berkely"],
//             ["No": 4, "Name": "Amor Aqua", "City": "Florida"],
//         ]

//         // Create headers from the first row of data
//         guard let firstRow = data.first else { return }
//         let headers = Array(firstRow.keys)

//         // Create a range to insert data into
//         let range = sheet.get_Range().get_Item("A1:C4")

//         // Insert headers and data into the worksheet
//         for (rowIndex, rowData) in data.enumerated() {
//             for (colIndex, header) in headers.enumerated() {
//                 if rowIndex == 0 {
//                     try sheet.get_Range().get_Item(rowIndex + 1, colIndex + 1).set_Value(CellValue(value: header))
//                 } else {
//                     if let value = rowData[header] {
//                         try sheet.get_Range().get_Item(rowIndex + 1, colIndex + 1).set_Value(CellValue(value: value))
//                     }
//                 }
//             }
//         }

//         // Save the workbook
//         try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
//         try workbook.Dispose()

//         // Check data in xlsx (assuming `Compare.CompareFile` is available)
//         // let baseLineFile = TestUtil.BaseLinePath + "Demo/ImportDataFromDataColumn.xlsx"
//         // try Compare.CompareFile(baseLineFile, outputFile)
//     }
// }
