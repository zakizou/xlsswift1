import XCTest
@testable import Spire_Xls

class XlsxFreeTests: TestCaseBase {
    
    func testaddData() throws {

        let outputFile = TestUtil.OutputPath + "Free/AddData.xlsx"
        let output = TestUtil.OutputPath + "Free"
        if !FileManager.default.fileExists(atPath: output) {
            try FileManager.default.createDirectory(atPath: output, withIntermediateDirectories: true, attributes: nil)
        }		

        let workbook = try Workbook()
        try workbook.get_Worksheets().Clear()
        let sheet = try workbook.get_Worksheets().Add("RowLimitation")
        let a1 = try sheet.get_Range().get_Item("A1").set_Text("添加350行数据")
        var i = 0
        for range in try sheet.get_Range().get_Item("A2:A350").get_Cells() {
            try sheet.get_Range().get_Item(range.get_Row(), range.get_Column()).set_Text("\(i)")
            i += 1           
        }
        try workbook.SaveToFile(outputFile, ExcelVersion.Version97to2003)
        try workbook.Dispose()       
    }

    func testaddSheetXlsx() throws {

        let outputFile = TestUtil.OutputPath + "Free/AddSheet.xlsx"
        
        let workbook = try Workbook()
        try workbook.get_Worksheets().Clear()
        try workbook.get_Worksheets().Add("RowLimitation")
        for i:Int32 in 0..<7 {
            let content = "Add" + "\(i)" 
            try workbook.CreateEmptySheet(content)
        }
        try workbook.SaveToFile(outputFile, ExcelVersion.Version97to2003)
        try workbook.Dispose()       
    }

    func testToXls() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToXls.xlsx"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version97to2003)
        try workbook.Dispose()       
    }

    func testToXlsx() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToXlsx.xlsx"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()       
    }
    
    func testToPdf() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToPdf.pdf"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile, FileFormat.PDF)
        try workbook.Dispose()       
    }
        
    func testToCsv() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToCsv.csv"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile, FileFormat.CSV)
        try workbook.Dispose()       
    }
           
    func testToHtml() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let output = TestUtil.OutputPath + "Free/XlsxToHtml/"
		if !FileManager.default.fileExists(atPath: output) {
            try FileManager.default.createDirectory(atPath: output, withIntermediateDirectories: true, attributes: nil)
        }	
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        var i = 0
        for case let sheet as Worksheet in try workbook.get_Worksheets() {
            let fileName = try sheet.get_Name()  
            let outputFile =  "//XlsxToHtml_" + fileName + ".html"  
            try sheet.SaveToHtml(outputFile)
            i += 1
        }              
        try workbook.Dispose()       
    } 
     
    func testToTxt() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToTxt/"
		if !FileManager.default.fileExists(atPath: outputFile) {
            try FileManager.default.createDirectory(atPath: outputFile, withIntermediateDirectories: true, attributes: nil)
        }	

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        for i:Int32 in 0..<11 {
            let sheet = try workbook.get_Worksheets().get_Item(i) as! Worksheet
            let sheetName = try sheet.get_Name()  
            let fileName =  outputFile + sheetName + ".txt"  
            try sheet.SaveToFile(fileName, ",", Encoding.get_UTF8())
        }  
        try workbook.Dispose()       
    }
            
    func testToXml() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToXml.xml"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveAsXml(outputFile)
        try workbook.Dispose()       
    }
            
    func testToOds() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToOds.ods"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,FileFormat.ODS)
        try workbook.Dispose()       
    }
            
    func testToPcl() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToPcl.pcl"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,FileFormat.PCL)
        try workbook.Dispose()       
    }
                
    func testToPs() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToPs.ps"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,FileFormat.PostScript)
        try workbook.Dispose()       
    }
                    
    func testToXlsb() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToXlsb.xlsb"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,FileFormat.Xlsb2010)
        try workbook.Dispose()       
    }
                    
    func testToXlsm() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToXlsm.xlsm"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,FileFormat.Xlsm)
        try workbook.Dispose()       
    }
                        
    func testToXltm() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToXltm.xltm"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,ExcelVersion.Version2013)
        try workbook.Dispose()       
    }

                            
    func testToXltx() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToXltx.xltx"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,ExcelVersion.Version2013)
        try workbook.Dispose()       
    }

    func testToXps() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToXps.xps"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,FileFormat.XPS)
        try workbook.Dispose()       
    }

    func testLess10XlsxToOfd() throws {

        let inputFile = TestUtil.DataPath + "Free/Bug_264.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/Less10XlsxToOfd.ofd"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,FileFormat.OFD)
        try workbook.Dispose()       
    }

    func testToOfd() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToOfd.ofd"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,FileFormat.OFD)
        try workbook.Dispose()       
    } 
    
    func testToET() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToET.et"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,FileFormat.ET)
        try workbook.Dispose()       
    }

    func testToETT() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToETT.ett"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile,FileFormat.ETT)
        try workbook.Dispose()       
    } 
    
    func testToUOS() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToUOS_Error.txt"
		try File.delete(outputFile)
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        var builder: [String] = []
        do{
            try workbook.SaveToFile(outputFile,FileFormat.UOS)           
        } catch {
            let error = error as NSError 
            let errorMessage = "XlsxToUOS_ErrorMessage = \(error.localizedDescription)" 
            builder.append(errorMessage)
        } 
        try workbook.Dispose()       
    } 
           
    func testToSvg() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToSvg/"
		if !FileManager.default.fileExists(atPath: outputFile) {
            try FileManager.default.createDirectory(atPath: outputFile, withIntermediateDirectories: true, attributes: nil)
        }
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        var count = try workbook.get_Worksheets().get_Count()
        for i:Int32 in 0..<count {
            let sheet = try workbook.get_Worksheets().get_Item(i) as! Worksheet
            let fs = try Stream(outputFile + "ToSvg-\(i).svg")
            try sheet.ToSVGStream(fs, 0, 0, 0, 0)
            try fs.Flush()
            try fs.Close()
        }           
        try workbook.Dispose()       
    } 
               
    func testToImage() throws {

        let inputFile = TestUtil.DataPath + "Free/11Sheet200+.xlsx"
        let outputFile = TestUtil.OutputPath + "Free/XlsxToImage/"
		if !FileManager.default.fileExists(atPath: outputFile) {
            try FileManager.default.createDirectory(atPath: outputFile, withIntermediateDirectories: true, attributes: nil)
        }
		
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        for i in try 0..<workbook.get_Worksheets().get_Count() {
            let sheet = try workbook.get_Worksheets().get_Item(i) as! Worksheet
            let image = try sheet.ToImage(sheet.get_FirstRow(), sheet.get_FirstColumn(), sheet.get_LastRow(), sheet.get_LastColumn())
            try image.Save(outputFile + "img-\(i).jpg")
        }         
        try workbook.Dispose()       
    } 


    static var allTests = [
        ("testaddData", testaddData),
        ("testaddSheetXlsx", testaddSheetXlsx),
        ("testToXlsx", testToXlsx),
        ("testToXlsx", testToXlsx),
        ("testToCsv", testToCsv),
        ("testToHtml", testToHtml),
        ("testToTxt", testToTxt),
        ("testToXml", testToXml),
        ("testToOds", testToOds),
        ("testToPcl", testToPcl),
        ("testToPs", testToPs),
        ("testToXlsb", testToXlsb),
        ("testToXlsm", testToXlsm),
        ("testToXltm", testToXltm),
        ("testToXps", testToXps),
        ("testLess10XlsxToOfd", testLess10XlsxToOfd),
        ("testToOfd", testToOfd),
        ("testToET", testToET),
        ("testToETT", testToETT),
        ("testToET", testToET),
        ("testToUOS", testToUOS),
        ("testToSvg", testToSvg),
        ("testToImage", testToImage),
    ]
}
