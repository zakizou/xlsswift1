// import XCTest
// @testable import Spire_Xls

// class ImportDataFromDataViewTests: TestCaseBase {
//     func testImportDataFromDataView() throws {
//         try TestUtil.licenseKey()
//         let outputFile = TestUtil.OutputPath + "Demo/ImportDataFromDataView.xlsx"

//         // Create a workbook
//         let workbook = try Workbook()

//         // Create an empty worksheet
//         try workbook.CreateEmptySheets(1)

//         // Get the first worksheet
//         let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet

//         // Create a DataTable object
//         let dataTable = DataTable("Customer")
//         dataTable.Columns.Add("No", typeof: Int32.self)
//         dataTable.Columns.Add("Name", typeof: String.self)
//         dataTable.Columns.Add("City", typeof: String.self)

//         // Create rows and add data
//         let row1 = dataTable.NewRow()
//         row1[0] = 1
//         row1[1] = "Tom"
//         row1[2] = "New York"
//         dataTable.Rows.Add(row1)

//         let row2 = dataTable.NewRow()
//         row2[0] = 2
//         row2[1] = "Jerry"
//         row2[2] = "China"
//         dataTable.Rows.Add(row2)

//         let row3 = dataTable.NewRow()
//         row3[0] = 3
//         row3[1] = "Dive Time"
//         row3[2] = "Berkely"
//         dataTable.Rows.Add(row3)

//         let row4 = dataTable.NewRow()
//         row4[0] = 4
//         row4[1] = "Amor Aqua"
//         row4[2] = "Florida"
//         dataTable.Rows.Add(row4)

//         // Assuming `DataView` exists within `DataTable`:
//         guard let dataView = dataTable.DefaultView else { return }

//         // Import the data view of the data table to the worksheet
//         try sheet.InsertDataView(dataView, true, 1, 1)

//         // Save the workbook
//         try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
//         try workbook.Dispose()

//         // Check data in xlsx (assuming `Compare.CompareFile` is available)
//         // let baseLineFile = TestUtil.BaseLinePath + "Demo/ImportDataFromDataView.xlsx"
//         // try Compare.CompareFile(baseLineFile, outputFile)
//     }
// }
