// import XCTest
// @testable import Spire_Xls

// class LineChartDroplinesTests: TestCaseBase {
//   func testLineChartDroplines() throws {
//     License.setLicenseFileFullPath(TestUtil.DataPath + "Demo/license.elic-python.xml")
//     let inputFile = TestUtil.DataPath + "Demo/LineChartDroplines.xlsx"
//     let outputFile = TestUtil.OutputPath + "Demo/LineChartDroplines.xlsx"

//     let workbook = try Workbook()
//     // Load Excel from disk
//     try workbook.LoadFromFile(inputFile)
//     // Get the first sheet
//     let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
//     // Get the first chart
//     let chart = try worksheet.get_Charts().get_Item(0) as! Chart

//     // Add a drop lines to the first series
//     try chart.get_Series().get_Item(0).set_HasDroplines(true)

//     // Save the document
//     try workbook.SaveToFile(outputFile, FileFormat.Version2013)
//     try workbook.Dispose()

//     // Check data in xlsx (not implemented yet)
//     // let baseLineFile = "Demo/LineChartDroplines.xlsx"
//     // Assert.IsTrue(CompareFile.Compare(baseLineFile, outputFile))
//   }
// }
