import XCTest
@testable import Spire_Xls

class CopyPictureTests: TestCaseBase {

    func testCopyPicture() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReadImages.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CopyPicture.xlsx"
        let outputFileImage = TestUtil.OutputPath + "Demo/CopyPicture.png"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet1 = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add a new worksheet as destination sheet
        let destinationSheet = try workbook.get_Worksheets().Add("DestSheet")

        // Get the first picture from the first worksheet
        let sourcePicture = try (sheet1.get_Pictures() as! XlsPicturesCollection).get_Item(0)

        // Get the image
        let image = try sourcePicture.get_Picture()
        try image.Save(outputFileImage)

        // Add the image into the added worksheet
        try destinationSheet.get_Pictures().Add(2, 2, outputFileImage)

        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CopyPicture.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)

    }

}
