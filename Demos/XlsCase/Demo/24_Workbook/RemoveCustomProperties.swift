import XCTest
@testable import Spire_Xls

class RemoveCustomPropertiesTests: TestCaseBase {
   func testRemoveCustomProperties() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/templateAz.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/RemoveCustomProperties.xlsx"

       // Create a workbook
       let workbook = try Workbook()

       // Load an Excel document
       try workbook.LoadFromFile(inputFile)

       // Retrieve a list of all custom document properties of the Excel file
       let customDocumentProperties = try workbook.get_CustomDocumentProperties()

       // Remove "Editor" custom document property
       try customDocumentProperties.Remove("Editor")

       // Save to file
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/RemoveCustomProperties.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

