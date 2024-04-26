import XCTest
@testable import Spire_Xls

class RetrieveAndExtractData: TestCaseBase {
    func testRetrieveAndExtractData() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_3.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RetrieveAndExtractData.xlsx"

        let book = try Workbook()
        let sheet1 = try book.get_Worksheets().get_Item(0) as! Worksheet
		
		let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let columnCount = try sheet.get_Columns().get_Count() 
		let cells = try sheet.get_Columns().get_Item(0).get_Cells()
        var i: Int32 = 1
		for range1 in cells {
		    if try range1.get_Text() == "teacher"{
                let Ori = try sheet.get_Range().get_Item(range1.get_Row(),1,range1.get_Row(),columnCount) as! CellRange
                let Dest = try sheet1.get_Range().get_Item(i,1,i,columnCount) as! CellRange
                // Copy the range to other position
                try sheet.Copy(Ori, Dest, true)
                i += 1
            }
		}    
        try book.SaveToFile(outputFile, ExcelVersion.Version2013)
        try book.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DataValidation.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
