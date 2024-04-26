//Not Support:sheet.InsertArrayList
// import XCTest
// @testable import Spire_Xls

// class ImportDataFromArrayListTests: TestCaseBase {
//     func testImportDataFromArrayList() throws {
//         try TestUtil.licenseKey()
//         let outputFile = TestUtil.OutputPath + "Demo/ImportDataFromArrayList.xlsx"

//         // Create a workbook
//         let workbook = try Workbook()

//         // Create an empty worksheet
//         try workbook.CreateEmptySheets(1)

//         // Get the first worksheet
//         let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet

//         // Create an array of strings
//         var list = [String]()
//         list.append("Spire.Doc for .NET")
//         list.append("Spire.XLS for .NET")
//         list.append("Spire.PDF for .NET")
//         list.append("Spire.Presentation for .NET")

//         // Insert the array list into the worksheet (assuming `InsertArrayList` is available)
//         // try sheet.InsertArrayList(list, 1, 1, true)

//         // Replace with alternative data insertion using Range and CellValue:
//         let range = sheet.get_Range().get_Item("A1:A4")
//         for (i, value) in list.enumerated() {
//             try range.get_Item(i + 1, 1).set_Value(CellValue(value: value))
//         }

//         // Save the workbook
//         try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
//         try workbook.Dispose()

//         // Check data in xlsx (assuming `Compare.CompareFile` is available)
//         // let baseLineFile = TestUtil.BaseLinePath + "Demo/ImportDataFromArrayList.xlsx"
//         // try Compare.CompareFile(baseLineFile, outputFile)
//     }
// }
