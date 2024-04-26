import XCTest
@testable import Spire_Xls

class FindStringAndNumberTests: TestCaseBase {
   func testFindStringAndNumber() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/FindCellsSample.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/FindStringAndNumber.txt"

       // Delete any existing output file
       try File.delete(outputFile)

       // Load the workbook
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)

       // Get the first worksheet
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       // Find cells with the input string
       let textRanges = try sheet.FindAllString("E-iceblue", false, false)

       // Create a string builder
       var builder = [String]()

       // Append the address of found text cells
       if try textRanges.get_Count() > 0 {
           for range in textRanges {
               let address = try range.get_RangeAddress()
               builder.append("The address of found text cell is: \(address)"+"\r\n")
           }
       } else {
           builder.append("No cells that contain the text")
       }

       // Find cells with the input integer or double
       let numberRanges = try sheet.FindAllNumber(100, true)

       // Append the address of found number cells
       if try numberRanges.get_Count() > 0 {
           for range in numberRanges {
               let address = try range.get_RangeAddress()
               builder.append("The address of found number cell is: \(address)"+"\r\n")
           }
       } else {
           builder.append("No cells that contain the number")
       }

       // Write the builder's content to the output file
       try builder.joined().write(toFile: outputFile, atomically: true, encoding: .utf8)

       // Check data in xlsx
       // let baseLineFile = TestUtil.baseLinePath + "Demo/FindStringAndNumber.txt"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}
