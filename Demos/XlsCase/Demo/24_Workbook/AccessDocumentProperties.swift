import XCTest
@testable import Spire_Xls

class AccessDocumentPropertiesTests: TestCaseBase {
    func testAccessDocumentProperties() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AccessDocumentProperties.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AccessDocumentProperties.txt"
        try File.delete(outputFile)

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        var builder = [String]()

        let properties = try workbook.get_CustomDocumentProperties()

        let property1 = try properties.get_Item("Editor")
        let obj = try property1.get_Value()
        try builder.append("\(property1.get_Name()) \(SpireString(obj).Value())")

        let property2 = try properties.get_Item(0)
        let obj2 = try property2.get_Value()
        try builder.append("\(property2.get_Name()) \(SpireString(obj2).Value())")

        try File.appendAllText(outputFile, [builder.joined(separator: "\n")])
        try workbook.Dispose()
    }
}

