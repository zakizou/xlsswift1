import XCTest
@testable import Spire_Xls

class CroppedPositionOfPictureTests: TestCaseBase {

    func testCroppedPositionOfPicture() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReadImages.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CroppedPositionOfPicture.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet1 = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the image from the first sheet
        let picture = try (sheet1.get_Pictures()as! XlsPicturesCollection).get_Item(0)

        // Get the cropped position
        let left = try picture.get_Left()
        let top = try picture.get_Top()
        let width = try picture.get_Width()
        let height = try picture.get_Height()

        // Create StringBuilder to save
        var content = [String]()

        // Set string format for displaying
        let displayString = "Crop position: Left \(left)\nCrop position: Top \(top)\nCrop position: Width \(width)\nCrop position: Height \(height)"

        // Add result string to StringBuilder
        content.append(displayString)
        
        // Save them to a txt file
        try File.appendAllText(outputFile, content)

        // Check data in txt
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CroppedPositionOfPicture.txt"
        // Compare.compareFile(baseLineFile, outputFile)

    }

}
