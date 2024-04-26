import XCTest
@testable import Spire_Xls

class AcceptOrRejectTrackedChangesTests: TestCaseBase {
    func testAcceptOrRejectTrackedChanges() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/TrackChanges.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AcceptOrRejectTrackedChanges.xlsx"
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Accept the changes or reject the changes.
        // try workbook.AcceptAllTrackedChanges()
        try workbook.RejectAllTrackedChanges()

        // Save to file.
        try workbook.SaveToFile(outputFile, FileFormat.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AcceptOrRejectTrackedChanges.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}