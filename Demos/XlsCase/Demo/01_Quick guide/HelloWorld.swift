import XCTest
@testable import Spire_Xls

class HelloWorldTests: TestCaseBase {
    
    func testHelloWorld() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/HelloWorld.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets()[0]!
        try sheet.set_Name("MySheet")
        let a1 = try sheet.get_Range()["A1"]!
        try a1.set_Text("Hello World")
        let text = try a1.get_Text()
        try a1.AutoFitColumns()
        
        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Uncomment the region below for comparison if needed
        /*
        let baseLineFile = TestUtil.baseLinePath + "Demo/HelloWorld.xlsx"
        try Compare.compareFile(baseLineFile, outputFile)
        */
    }
    
    static var allTests = [
        ("testHelloWorld", testHelloWorld),
    ]
}
