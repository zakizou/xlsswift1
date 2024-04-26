import XCTest
@testable import Spire_Xls

class ToOfficeOpenXMLTests: TestCaseBase {

    func testToOfficeOpenXML() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/ToOfficeOpenXML.xml"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("A1").set_Text("Hello World")
        try sheet.get_Range().get_Item("B1").get_Style().set_KnownColor(ExcelColors.Gray25Percent)
        try sheet.get_Range().get_Item("C1").get_Style().set_KnownColor(ExcelColors.Gold)
        
        try workbook.SaveAsXml(outputFile)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ToOfficeOpenXML.xml"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
