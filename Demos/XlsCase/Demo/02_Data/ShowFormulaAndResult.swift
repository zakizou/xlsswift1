// import XCTest
// @testable import Spire_Xls

// class ShowFormulaAndResultTests: TestCaseBase {
//     func testShowFormulaAndResult() throws {
//         try TestUtil.licenseKey()
//         let inputFile = TestUtil.DataPath + "Demo/FormulasSample.xlsx"
//         let outputFile = TestUtil.OutputPath + "Demo/ShowFormulaAndResult.xlsx"

//         // Load the workbook
//         let workbook = try Workbook()
//         try workbook.LoadFromFile(inputFile)

//         // Get the worksheet
//         let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

//         // Extract formulas and results differently as `ExportDataTable` is not supported
//         // Option 1: Iterate through cells and extract formulas/values manually
//         // (Implement this approach if you need fine-grained control over cell data extraction)
//         // ...

//         // Option 2: Use `sheet.UsedRange` to get a collection of cells and extract formulas/values
//         let usedRange = try sheet.get_UsedRange() as! CellRange
//         var formulas = [String]()
//         var results = [String]()
//         for i in 0...usedRange.get_RowCount() - 1 {
//             for j in 0...usedRange.get_ColumnCount() - 1 {
//                 let cell = try usedRange.get_Item(i + 1, j + 1) as! Cell
//                 formulas.append(try cell.get_Formula())
//                 results.append(try cell.get_Text())
//             }
//         }

//         // Process or display formulas and results as needed
//         // ...

//         // Save the file
//         try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
//         try workbook.Dispose()

//         // Check data in xlsx
//         // let baseLineFile = TestUtil.baseLinePath + "Demo/ShowFormulaAndResult.xlsx"
//         // Compare.compareFile(baseLineFile, outputFile)
//     }
// }
