import XCTest
@testable import Spire_Xls

class LinkToContentPropertyTests: TestCaseBase {
    func testLinkToContentProperty() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AccessDocumentProperties.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/LinkToContentProperty.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Add a custom document property
        try (workbook.get_CustomDocumentProperties()).Add("Test", "MyNamedRange")

        // Get the added document property
        let properties = try workbook.get_CustomDocumentProperties()
        let property = try properties.get_Item("Test")

        // Link to content
        try property.set_LinkToContent(true)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/LinkToContentProperty.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

