// import XCTest
// @testable import Spire_Xls

// class ChartToEMFImage_sTests: XCTestCase {
//     func testChartToEMFImage() throws {
//         try TestUtil.licenseKey()
//         let inputFile = TestUtil.DataPath + "Demo/ChartToEMFImage.xlsx"
//         let output = TestUtil.OutputPath + "Demo/Image/"
//         if !Directory.exists(output) {
//             try Directory.createDirectory(output)
//         }

//         // Create a workbook
//         let workbook = try Workbook()
//         try workbook.LoadFromFile(inputFile)

//         // Save chart as Emf image
//         let stream = try Stream()
//         try workbook.SaveChartAsEmfImage(workbook.get_Worksheets().get_Item(0), 0, stream)
//         try File.writeAllBytes(output + "ChartToEMFImage.emf", try stream.ToArray())
//         try workbook.Dispose()

//         // Check data
//         // let baseLineFile = TestUtil.BaseLinePath + "Demo/Image/ChartToEMFImage.emf"
//         // let outputFile = TestUtil.OutputPath + "Demo/Image/ChartToEMFImage.emf"
//         // Compare.CompareFile(baseLineFile, outputFile)
//     }
// }
