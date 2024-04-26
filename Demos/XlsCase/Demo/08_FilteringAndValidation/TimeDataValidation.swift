import XCTest
@testable import Spire_Xls

class TimeDataValidationTests: TestCaseBase {
    func testTimeDataValidation() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/TimeDataValidation.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(TestUtil.DataPath + "Demo/DataValidation.xlsx")

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("C12").set_Text("Please enter time between 09:00 and 18:00:")
        try sheet.get_Range().get_Item("C12").AutoFitColumns()

        // Set Time data validation for cell "D12"
        let range = try sheet.get_Range().get_Item("D12")
        try range.get_DataValidation().set_AllowType(CellDataType.Time)
        try range.get_DataValidation().set_CompareOperator(ValidationComparisonOperator.Between)
        try range.get_DataValidation().set_Formula1("09:00")
        try range.get_DataValidation().set_Formula2("18:00")
        try range.get_DataValidation().set_AlertStyle(AlertStyleType.Info)
        try range.get_DataValidation().set_ShowError(true)
        try range.get_DataValidation().set_ErrorTitle("Time Error")
        try range.get_DataValidation().set_ErrorMessage("Please enter a valid time")
        try range.get_DataValidation().set_InputMessage("Time Validation Type")
        try range.get_DataValidation().set_IgnoreBlank(true)
        try range.get_DataValidation().set_ShowInput(true)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
    }
}
