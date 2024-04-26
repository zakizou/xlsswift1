// import XCTest
// @testable import Spire_Xls

// class EmbedNoninstalledFontsTests: TestCaseBase {
//     func testEmbedNoninstalledFonts() throws {
//         try TestUtil.licenseKey()
//         let inputFile = TestUtil.DataPath + "Demo/EmbedNoninstalledFonts.xlsx"
//         let inputFile_1 = TestUtil.DataPath + "Demo/PT_Serif-Caption-Web-Regular.ttf"
//         let outputFile = TestUtil.OutputPath + "Demo/EmbedNoninstalledFonts.pdf"

//         // Create a workbook and load the spreadsheet
//         let workbook = try Workbook()
//         try workbook.LoadFromFile(inputFile)

//         // Get the first worksheet and chart
//         let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
//         let chart = try sheet.get_Charts().get_Item(0) as! Chart

//         // Load the font file (note: potential functionality limitation for embedding)
//         workbook.CustomFontFilePaths = [inputFile_1]

//         // Apply the font to chart elements (assuming potential workarounds for embedding)
//         let fontName = /* Assume font name extraction or potential workaround here */
//         chart.PrimaryValueAxis.Font.FontName = fontName
//         chart.PrimaryCategoryAxis.Font.FontName = fontName

//         let chartSerie1 = try chart.get_Series().get_Item(0) as! Series
//         chartSerie1.DataPoints.DefaultDataPoint.DataLabels.FontName = fontName

//         // Save as PDF and dispose of resources
//         try workbook.SaveToFile(outputFile, FileFormat.PDF)
//         try workbook.Dispose()

//         // Check data in PDF (uncomment if needed)
//         // let baseLineFile = TestUtil.baseLinePath + "Demo/EmbedNoninstalledFonts.pdf"
//         // Compare.compareFile(baseLineFile, outputFile)
//     }
// }
