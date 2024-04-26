import XCTest
@testable import Spire_Xls

class ExtractOLEObjectsTests: XCTestCase {

    func testExtractOLEObjects() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExtractOle2.xlsx"
        let outputFile_doc = TestUtil.OutputPath + "Demo/ExtractOLEObjects.docx"
        let outputFile_pdf = TestUtil.OutputPath + "Demo/ExtractOLEObjects.pdf"
        let outputFile_pptx = TestUtil.OutputPath + "Demo/ExtractOLEObjects.pptx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Extract ole objects
        if try sheet.get_HasOleObjects() {
            let oleObjects = try sheet.get_OleObjects()
            for obj in oleObjects {
                let type = try obj.get_ObjectType()
                // Word document
                if type == OleObjectType.WordDocument {
                    try File.writeAllBytes(outputFile_doc, obj.get_OleData())
                }
                if type == OleObjectType.AdobeAcrobatDocument {
                    try File.writeAllBytes(outputFile_pdf, obj.get_OleData())
                }
                if type == OleObjectType.PowerPointSlide {
                    try File.writeAllBytes(outputFile_pptx, obj.get_OleData())
                }
            }
        }
        try workbook.Dispose()
    }    
}
