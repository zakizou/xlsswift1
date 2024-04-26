import XCTest

class AddDirectory {
    
    static func testAAddDirectory() throws {
        let OutputPath = [
            TestUtil.OutputPath + "DocDocx/",
            TestUtil.OutputPath + "Pdf/",
            TestUtil.OutputPath + "TXT/",
            TestUtil.OutputPath + "TXT/RunTime/",
            TestUtil.OutputPath + "Docm/",
            TestUtil.OutputPath + "Dot/",
            TestUtil.OutputPath + "Epub/",
            TestUtil.OutputPath + "Html/",
            TestUtil.OutputPath + "Image/",
            TestUtil.OutputPath + "Odt/",
            TestUtil.OutputPath + "OtherFiles/",
            TestUtil.OutputPath + "PCL/",
            TestUtil.OutputPath + "PostScript/",
            TestUtil.OutputPath + "Print/",
            TestUtil.OutputPath + "Rtf/",
            TestUtil.OutputPath + "XML/",
            TestUtil.OutputPath + "XPS/",
            TestUtil.OutputPath + "Demo/",
            // TestUtil.OutputPath + "DocDocx/Table_Auto/Bug_986_Content/",
            // TestUtil.OutputPath + "DocDocx/Table_Auto/Precent/",
            // TestUtil.OutputPath + "DocDocx/Table_Auto/Point/",
            // TestUtil.OutputPath + "DocDocx/Table_Auto/Mix/",
            // TestUtil.OutputPath + "DocDocx/Table_Auto/Width_0/",
            // TestUtil.OutputPath + "DocDocx/Table_Auto/Bug_986_Column/",
            // TestUtil.OutputPath + "DocDocx/Table_Auto/Bug_986_Window/",
            // TestUtil.OutputPath + "DocDocx/Endnote/",
            // TestUtil.OutputPath + "DocDocx/Footnote/",
            // TestUtil.OutputPath + "DocDocx/Gutter/",
            // TestUtil.OutputPath + "DocDocx/EQField_Case/ToPdf/",
            // TestUtil.OutputPath + "DocDocx/Bug_1837/",
            // TestUtil.OutputPath + "DocDocx/Math_Case/ToPdf/",
            // TestUtil.OutputPath + "DocDocx/Math_Case/ToDoc/",
            // TestUtil.OutputPath + "DocDocx/Math_Case/ToDocx/"
        ]
        
        for path in OutputPath {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
    }
}
