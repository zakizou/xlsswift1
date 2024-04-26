import XCTest
@testable import Spire_Xls

class ListDataValidation: TestCaseBase {

    func testListDataValidation() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/DataValidation.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ListDataValidation.xlsx"
		
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
		
        try worksheet.get_Range().get_Item("A7").set_Text("Beijing")
        try worksheet.get_Range().get_Item("A8").set_Text("New York")
        try worksheet.get_Range().get_Item("A9").set_Text("Denver")
        try worksheet.get_Range().get_Item("A10").set_Text("Paris")
        let range = try worksheet.get_Range().get_Item("D10")
        try range.get_DataValidation().set_ShowError(true)
        try range.get_DataValidation().set_AlertStyle(AlertStyleType.Stop)
        try range.get_DataValidation().set_ErrorTitle("Error")
        try range.get_DataValidation().set_ErrorMessage("Please select a city from the list")
        try range.get_DataValidation().set_DataRange(worksheet.get_Range().get_Item("A7:A10"))

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
		
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DataSorting.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
