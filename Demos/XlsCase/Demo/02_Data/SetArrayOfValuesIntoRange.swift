// import XCTest
// @testable import Spire_Xls

// class SetArrayOfValuesIntoRangeTests: TestCaseBase {
//     func testSetArrayOfValuesIntoRange() throws {
//         try TestUtil.licenseKey()
//         let outputFile = TestUtil.OutputPath + "Demo/SetArrayOfValuesIntoRange.xlsx"

//         // Create a workbook.
//         let workbook = try Workbook()

//         // Create an empty worksheet.
//         try workbook.CreateEmptySheets(1)

//         // Get the worksheet.
//         let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

//         // Set the value of max row and column.
//         let maxRow = 10000
//         let maxCol = 200

//         // Create data arrays.
//         var myarray: [[String]] = Array(repeating: Array(repeating: "", count: maxCol + 1), count: maxRow + 1)
//         var isred: [[Bool]] = Array(repeating: Array(repeating: false, count: maxCol + 1), count: maxRow + 1)
//         for i in 0...maxRow {
//             for j in 0...maxCol {
//                 myarray[i][j] = String(i + j)
//                 isred[i][j] = Int(myarray[i][j])! > 8
//             }
//         }

//         // Set values in the worksheet.
//         try sheet.get_Range().get_Item("A1").set_Text(data: myarray)

//         // Apply conditional formatting based on `isred` array (using conditional formatting API)
//         // ... (Add necessary conditional formatting logic here)

//         // Save the file.
//         try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
//         try workbook.Dispose()

//         // Check data in xlsx
//         // let baseLineFile = TestUtil.baseLinePath + "Demo/SetArrayOfValuesIntoRange.xlsx"
//         // Compare.compareFile(baseLineFile, outputFile)
//     }
// }
