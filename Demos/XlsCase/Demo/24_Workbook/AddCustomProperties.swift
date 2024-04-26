import XCTest
@testable import Spire_Xls

class AddCustomPropertiesTests: TestCaseBase {
    func testAddCustomProperties() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AddCustomProperties.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddCustomProperties.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        try workbook.get_CustomDocumentProperties().Add("_MarkAsFinal", true)

        try workbook.get_CustomDocumentProperties().Add("The Editor", "E-iceblue")
        try workbook.get_CustomDocumentProperties().Add("Phone number", Int32(81705109))
        try workbook.get_CustomDocumentProperties().Add("Revision number", 7.12)
        try workbook.get_CustomDocumentProperties().Add("Revision date", DateTime.get_Now())

        try workbook.SaveToFile(outputFile, FileFormat.Version2013)
        try workbook.Dispose()
    }
}

