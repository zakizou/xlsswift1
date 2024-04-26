import XCTest
@testable import Spire_Xls

class RegisterAddInFunctionTests: TestCaseBase {
    func testRegisterAddInFunction() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Test.xlam"
        let outputFile = TestUtil.OutputPath + "Demo/RegisterAddInFunction.xlsx"

        let workbook = try Workbook()
        try workbook.get_AddInFunctions().Add(inputFile, "TEST_UDF")
        try workbook.get_AddInFunctions().Add(inputFile, "TEST_UDF1")

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("A1").set_Formula("=TEST_UDF()")
        try sheet.get_Range().get_Item("A2").set_Formula("=TEST_UDF1()")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/RegisterAddInFunction.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
