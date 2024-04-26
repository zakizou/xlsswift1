import spirexls

/*

*/
public class Font: SpireObject{
    public override class var typeName: String { get {
        "Font"
    }}
    public override class var fullTypeName: String { get {
        "spirexls.Font"
    }}

    required init(_ handle: UnsafeMutableRawPointer) {
        super.init(handle)
    }
    required init(_ object: SpireObject) {
        super.init(object.getHandle())
    }


    /*

    */

    public func get_Size() throws -> Float{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_Size(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
//    /*
//
//    */
//
//    public func set_Size(_ value:Float) throws {
//        var __exceptionC: spirexls_Exception_t?
//        Font_set_Size(self.getHandle(), value, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//    }
    
    /*

    */

    public func get_Name() throws -> String{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_Name(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return UnsafePointerToString(__returnValueC!)
    }
    
//    /*
//
//    */
//
//    public func set_Name(_ value:String) throws {
//        var __exceptionC: spirexls_Exception_t?
//        let ptrValue = StringToUnsafePointer(value)
//        defer {
//            ptrValue.deallocate()
//        }
//        Font_set_Name(self.getHandle(), ptrValue, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//    }
    
//    /*
//
//    */
//
//    public func get_FontFamilyName() throws -> String{
//        var __exceptionC: spirexls_Exception_t?
//        let __returnValueC = Font_get_FontFamilyName(self.getHandle(), &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//        return UnsafePointerToString(__returnValueC!)
//    }
//
//    /*
//
//    */
//
//    public func set_FontFamilyName(_ value:String) throws {
//        var __exceptionC: spirexls_Exception_t?
//        let ptrValue = StringToUnsafePointer(value)
//        defer {
//            ptrValue.deallocate()
//        }
//        Font_set_FontFamilyName(self.getHandle(), ptrValue, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//    }
    
    /*

    */

    public func get_OriginalFontName() throws -> String{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_OriginalFontName(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return UnsafePointerToString(__returnValueC!)
    }
    
    /*

    */

    public func get_SizeInPoints() throws -> Float{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_SizeInPoints(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
    /*

    */

    public func get_Bold() throws -> Bool{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_Bold(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
//    /*
//
//    */
//
//    public func set_Bold(_ value:Bool) throws {
//        var __exceptionC: spirexls_Exception_t?
//        Font_set_Bold(self.getHandle(), value, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//    }
    
    /*

    */

    public func get_Italic() throws -> Bool{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_Italic(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
//    /*
//
//    */
//
//    public func set_Italic(_ value:Bool) throws {
//        var __exceptionC: spirexls_Exception_t?
//        Font_set_Italic(self.getHandle(), value, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//    }
    
    /*

    */

    public func get_Strikeout() throws -> Bool{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_Strikeout(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
//    /*
//
//    */
//
//    public func set_Strikeout(_ value:Bool) throws {
//        var __exceptionC: spirexls_Exception_t?
//        Font_set_Strikeout(self.getHandle(), value, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//    }
    
    /*

    */

    public func get_Underline() throws -> Bool{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_Underline(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
    /*

    */

    public func Dispose() throws {
        var __exceptionC: spirexls_Exception_t?
        Font_Dispose(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
    }
    
    /*

    */

    public func GetHashCode() throws -> Int32{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_GetHashCode(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
    /*

    */

    public func get_Style() throws ->FontStyle{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_Style(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return FontStyle(rawValue:__returnValueC.rawValue)!
    }
    
    /*

    */

    public func get_Height() throws -> Int32{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_Height(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
    /*

    */

    public func get_GdiCharSet() throws -> UInt8{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Font_get_GdiCharSet(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
//    /*
//
//    */
//
//    public func m_charSet() throws -> UInt8{
//        var __exceptionC: spirexls_Exception_t?
//        let __returnValueC = Font_m_charSet(self.getHandle(), &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//        return __returnValueC
//    }
}

