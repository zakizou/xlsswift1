import XCTest
@testable import Spire_Xls

class DeleteAllImagesTests: TestCaseBase {
    func testDeleteAllImages() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_5.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DeleteAllImages.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Delete all images from the worksheet
        for i in (0...(try sheet.get_Pictures().get_Count() - 1)).reversed() {
            try (sheet.get_Pictures() as! XlsPicturesCollection).get_Item(i).Remove()
        }

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DeleteAllImages.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
