import XCTest
import Spire_Xls
import spirexls

class TestUtil {
    public static let TIMEOUT: Int = 1200000
    public static let DataPath: String = "/Users/mac/Projects/TestTeam/XlsSwift/Tests/TestData/"
    public static let OutputPath: String = "/Users/mac/Projects/TestTeam/XlsSwift/Tests/ResultFile/"
    public static let BaseLinePath: String = "/Users/mac/Projects/TestTeam/XlsSwift/Tests/BaseLineFile/"

    static func logDebug(_ enableLog:Bool)  {
        Spire_LogDebug(enableLog)
    }
    static func licenseKey() throws {
        logDebug(true)
         let inputFile: String = DataPath + "License/license.elic-xls.xml"
         try License.SetLicenseFileFullPath(inputFile)
    }

    static func clearLicense() throws {
        try License.ClearLicense()
    }

    static func setNullLicense() throws {
        try License.SetLicenseKey("")
    }

    // static func psConversion() throws -> ToPdfParameterList {
    //     let ps = ToPdfParameterList()
    //     ps.usePSCoversion = true
    //     return ps
    // }

    static func outFilePathIsExist(path: String) throws {
        // 判断输入文件夹是否存在
        if !FileManager.default.fileExists(atPath: path) {
            // 如果不存在就创建该文件夹
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                XCTFail("Failed to create directory: \(error.localizedDescription)")
            }
        }
    }
}
