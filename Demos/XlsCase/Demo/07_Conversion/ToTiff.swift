// import XCTest
// @testable import Spire_Xls

// class ToTiffTests: TestCaseBase {
//     func testToTiff() throws {
//         try TestUtil.licenseKey()
//         let inputFile = TestUtil.DataPath + "Demo/CreateTable.xlsx"
//         let outputFile = TestUtil.OutputPath + "Demo/Image/ToTiff.tiff"

//         // Create a workbook and load the spreadsheet
//         let workbook = try Workbook()
//         try workbook.LoadFromFile(inputFile)

//         // Convert workbook to TIFF (assuming potential workarounds for unsupported features)
//         let images = try /* Assume individual worksheet image generation or potential workaround here */

//         // Combine images into a single TIFF (assuming alternative approach for missing functionality)
//         try joinTiffImages(images: images, outputFile: outputFile, compression: .lzw)

//         // Check data in TIFF (uncomment if needed)
//         // let baseLineFile = TestUtil.BasePath + "Demo/Image/ToTiff.tiff"
//         // Compare.compareFile(baseLineFile, outputFile)
//     }

//     private func joinTiffImages(images: [URL], outputFile: URL, compression: Spire.Xls.ImageCompression) throws {
//         guard let encoder = ImageEncoding.tiff else {
//             throw XMLError(code: .unsupportedEncoding, message: "TIFF encoding is not supported")
//         }

//         var parameters = EncoderParameters(capacity: 2)
//         parameters[0] = EncoderParameter(key: .saveFlag, value: EncoderValue.multiFrame)
//         parameters[1] = EncoderParameter(key: .compression, value: compression.rawValue)

//         var firstImage: Data? = nil
//         for (index, imageUrl) in images.enumerated() {
//             let imageData = try Data(contentsOf: imageUrl)
//             if index == 0 {
//                 firstImage = imageData
//                 try imageData.write(to: outputFile, options: .atomic)
//             } else {
//                 parameters[0] = EncoderParameter(key: .saveFlag, value: EncoderValue.frameDimensionPage)
//                 try imageData.append(to: &firstImage!, using: encoder, parameters: parameters)
//             }

//             if index == images.count - 1 {
//                 parameters[0] = EncoderParameter(key: .saveFlag, value: EncoderValue.flush)
//                 try firstImage!.append(to: &firstImage!, using: encoder, parameters: parameters)
//             }
//         }
//     }
// }
