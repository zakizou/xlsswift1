// import XCTest
// @testable import Spire_Xls

// class ToImageWithHighResolutionTests: TestCaseBase {
//     func testToImageWithHighResolution() throws {
//         try TestUtil.licenseKey()
//         let inputFile = TestUtil.DataPath + "Demo/ConversionSample1.xlsx"
//         let outputFile = TestUtil.OutputPath + "Demo/Image/ToImageWithHighResolution.jpg"

//         // Ensure output path exists
//         try FileManager.default.createDirectory(
//             atPath: TestUtil.OutputPath + "Demo/Image/",
//             withIntermediateDirectories: true,
//             attributes: nil
//         )

//         // Create a workbook and load the spreadsheet
//         let workbook = try Workbook()
//         try workbook.LoadFromFile(inputFile)

//         // Get the worksheet to convert
//         let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

//         // Export as image (assuming potential workarounds for high resolution)
//         let imageData = /* Assume high-resolution image generation or potential workaround here */
//         try imageData.write(to: URL(fileURLWithPath: outputFile))

//         // Check data in image (uncomment if needed)
//         // let baseLineFile = TestUtil.baseLinePath + "Demo/Image/ToImageWithHighResolution.jpg"
//         // Compare.compareFile(baseLineFile, outputFile)
//     }
// }
