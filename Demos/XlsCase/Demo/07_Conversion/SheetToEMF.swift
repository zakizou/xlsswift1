// import XCTest
// @testable import Spire_Xls

// class SheetToEMFTests: TestCaseBase {
//     func testSheetToEMF() throws {
//         try TestUtil.licenseKey()
//         let inputFile = TestUtil.DataPath + "Demo/ConversionSample1.xlsx"
//         let outputFile = TestUtil.OutputPath + "Demo/Image/SheetToEMF.emf"

//         // Create a workbook and load the spreadsheet
//         let workbook = try Workbook()
//         try workbook.LoadFromFile(inputFile)

//         // Get the first worksheet (note: potential functionality limitation for EMF export)
//         let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

//         // Save the worksheet to EMF stream (assuming potential workaround for missing functionality)
//         let data = /* Assume EMF generation or potential workaround here */
//         try data.write(to: URL(fileURLWithPath: outputFile), options: .atomic)

//         // Check data in EMF (uncomment if needed)
//         // let baseLineFile = TestUtil.baseLinePath + "Demo/Image/SheetToEMF.emf"
//         // Compare.compareFile(baseLineFile, outputFile)
//     }
// }
