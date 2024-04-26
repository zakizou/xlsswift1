// import XCTest
// @testable import Spire_Xls
// import Foundation

// class InsertWebImageTests: XCTestCase {
//     func testInsertWebImage() throws {
//         try TestUtil.licenseKey()
//         let outputFile = TestUtil.OutputPath + "Demo/Demo/InsertWebImage.xlsx"
//         let URLString = "https://www.baidu.com/img/PCfb_5bf082d29588c07f842ccde3f97243ea.png"

//         // Create a workbook
//         let workbook = try Workbook()

//         // Get the first sheet
//         let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

//         // Instantiate the URL object
//         guard let url = URL(string: URLString) else {
//             print("Invalid URL")
//             return
//         }

//         // Download image data
//         let imageData = try Data(contentsOf: url)

//         // Convert image data to UIImage
//         guard let image = UIImage(data: imageData) else {
//             print("Failed to create image from data")
//             return
//         }

//         // Convert UIImage to byte array
//         guard let imageDataBytes = image.jpegData(compressionQuality: 1.0) else {
//             print("Failed to convert image to data")
//             return
//         }

//         // Create a memory stream
//         let objImage = try MemoryStream(data: imageDataBytes)

//         // Add the image to the sheet
//         try sheet.get_Pictures().Add(3, 2, objImage)

//         // Save to file
//         try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
//         try workbook.Dispose()

//         // Check Data
//         // let baseLineFile = TestUtil.baseLinePath + "Demo/InsertWebImage.xlsx"
//         // Compare.compareFile(baseLineFile, outputFile)
//     }
// }
