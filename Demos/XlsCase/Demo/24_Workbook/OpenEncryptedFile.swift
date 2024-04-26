import XCTest
@testable import Spire_Xls

class OpenEncryptedFileTests: TestCaseBase {
   func testOpenEncryptedFile() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/EncryptedFile.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/OpenEncryptedFile.txt"

       try File.delete(outputFile)

       // Create string builder
       var builder = [String]()

       let passwords = ["password1", "password2", "password3", "1234"]
       for i in 0..<passwords.count {
           do {
               // Create a workbook
               let workbook = try Workbook()

               // Set the password
               try workbook.set_OpenPassword(passwords[i])

               // Load the document
               try workbook.LoadFromFile(inputFile)

               builder.append("Password = \(passwords[i]) is correct. The encrypted Excel file opened successfully!")
           } catch let e as SpireException {
               builder.append("Password = \(passwords[i]) is not correct")
               builder.append("ErrorMessage = \(e.reason)") // Test capturing exception message consistency with .NET
           }
       }

       // Save to txt file
       try File.appendAllText(outputFile, [builder.joined(separator: "\n")])

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/OpenEncryptedFile.txt"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

