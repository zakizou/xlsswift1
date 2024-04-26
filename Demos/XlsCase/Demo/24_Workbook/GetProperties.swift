import XCTest
@testable import Spire_Xls

class GetPropertiesTests: TestCaseBase {
    func testGetProperties() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetProperties.txt"
        try File.delete(outputFile)

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        var sb = [String]()
        sb.append("Excel Properties:")

        let properties1 = try workbook.get_DocumentProperties()
        for i in try 0..<properties1.get_Count() {
            let pro = try properties1.get_Item(i) as! DocumentProperty
            let name = try pro.get_Name()
            let obj = try pro.get_Value()
            let t = try pro.get_PropertyType()
            let value: String?
            switch t {
            case PropertyType.Double:
                value = try String(SpireDouble(obj).Value())
            case PropertyType.DateTime:
                value = try DateTime(obj).ToString()
            case PropertyType.Bool:
                value = try String(Boolean(obj).Value())
            case PropertyType.Int, PropertyType.Int32:
                value = try String(SpireInt32(obj).Value())
            default:
                value = try SpireString(obj).Value()
            }
            sb.append("\(name): \(value ?? "")")
        }
        sb.append("")

        sb.append("Custom Properties:")
        let properties2 = try workbook.get_CustomDocumentProperties()
        for i in try 0..<properties2.get_Count() {
            let pro = try properties2.get_Item(i) as! DocumentProperty
            let name = try pro.get_Name()
            let t = try pro.get_PropertyType()
            let obj = try pro.get_Value()
            let value: String?
            switch t {
            case PropertyType.Double:
                value = try String(SpireDouble(obj).Value())
            case PropertyType.DateTime:
                value = try DateTime(obj).ToString()
            case PropertyType.Bool:
                value = try String(Boolean(obj).Value())
            case PropertyType.Int, PropertyType.Int32:
                value = try String(SpireInt32(obj).Value())
            default:
                value = try SpireString(obj).Value()
            }
            sb.append("\(name): \(value ?? "")")
        }

        try File.appendAllText(outputFile, [sb.joined(separator: "\n")])
        try workbook.Dispose()
    }
}

