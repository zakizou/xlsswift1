import XCTest
@testable import Spire_Xls

class VerifyProtectedWorksheetTests: TestCaseBase {
   func testVerifyProtectedWorksheet() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ProtectedWorksheet.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/VerifyProtectedWorksheet.txt"
       try File.delete(outputFile)

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Get the first worksheet
       let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       // Verify the first worksheet
       let detect = try worksheet.get_IsPasswordProtected()

       // Create a string array to save results
       var content = [String]()

       // Set string format for displaying
       let result = "The first worksheet is password protected or not: \(detect)"

       // Add result string to the array
       content.append(result)

       // Save the document
       try File.appendAllText(outputFile, [content.joined(separator: "\n")])
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/VerifyProtectedWorksheet.txt"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

