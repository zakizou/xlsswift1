// import XCTest
// @testable import Spire_Xls

// class ToEncryptedPDFTests: TestCaseBase {
//     func testToEncryptedPDF() throws {
//         try TestUtil.licenseKey()
//         let inputFile = TestUtil.DataPath + "Demo/ToPDF.xlsx"
//         let outputFile = TestUtil.OutputPath + "Demo/ToEncryptedPDF.pdf"

//         let workbook = try Workbook()
//         defer { workbook.Dispose() }

//         // Load the spreadsheet
//         try workbook.LoadFromFile(inputFile)

//         // Set password and permissions for encrypted PDF
//         try workbook.converterSetting.pdfSecurity.set_Encrypt("123", password: "456", permissions: .print, keySize: .key128Bit)

//         // Convert to PDF and save
//         try workbook.SaveToFile(outputFile, FileFormat.PDF)

//         // Check data in PDF (uncomment if needed)
//         // let baseLineFile = "Demo/ToEncryptedPDF.pdf"
//         // Compare.compareFile(baseLineFile, outputFile)
//     }
// }
