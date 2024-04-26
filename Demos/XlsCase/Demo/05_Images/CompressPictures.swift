import XCTest
@testable import Spire_Xls

class CompressPicturesTests: TestCaseBase {

    func testCompressPictures() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CompressPictures.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CompressPictures.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Compress pictures in each sheet
        for sheet in try workbook.get_Worksheets() {
            for picture in (try sheet.get_Pictures() as! XlsPicturesCollection) {
                try picture.Compress(50)
            }
        }

        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CompressPictures.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)

    }

}
