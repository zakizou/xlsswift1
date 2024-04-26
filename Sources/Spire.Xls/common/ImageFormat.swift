import spirexls

/*

*/
public class ImageFormat: SpireObject{
    public override class var typeName: String { get {
        "ImageFormat"
    }}
    public override class var fullTypeName: String { get {
        "spirexls.ImageFormat"
    }}

    required init(_ handle: UnsafeMutableRawPointer) {
        super.init(handle)
    }
    required init(_ object: SpireObject) {
        super.init(object.getHandle())
    }


    /*

    */

    public func GetHashCode() throws -> Int32{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = ImageFormat_GetHashCode(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
    /*

    */

    public func ToString() throws -> String{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = ImageFormat_ToString(self.getHandle(), &__exceptionC)
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
//    public static func FromString(_ imageType:String) throws ->ImageFormat{
//        var __exceptionC: spirexls_Exception_t?
//        let ptrimageType = StringToUnsafePointer(imageType)
//        defer {
//            ptrimageType.deallocate()
//        }
//
//        let ptr = ImageFormat_FromString(ptrimageType, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//        return ImageFormat(ptr!)
//    }
    
    /*

    */

    public static func get_Bmp() throws ->ImageFormat{
        var __exceptionC: spirexls_Exception_t?
        let ptr = ImageFormat_get_Bmp( &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return ImageFormat(ptr!)
    }
    
    /*

    */

    public static func get_Emf() throws ->ImageFormat{
        var __exceptionC: spirexls_Exception_t?
        let ptr = ImageFormat_get_Emf( &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return ImageFormat(ptr!)
    }
    
    /*

    */

    public static func get_Exif() throws ->ImageFormat{
        var __exceptionC: spirexls_Exception_t?
        let ptr = ImageFormat_get_Exif( &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return ImageFormat(ptr!)
    }
    
    /*

    */

    public static func get_Gif() throws ->ImageFormat{
        var __exceptionC: spirexls_Exception_t?
        let ptr = ImageFormat_get_Gif( &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return ImageFormat(ptr!)
    }
    
    /*

    */

    public static func get_Icon() throws ->ImageFormat{
        var __exceptionC: spirexls_Exception_t?
        let ptr = ImageFormat_get_Icon( &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return ImageFormat(ptr!)
    }
    
    /*

    */

    public static func get_Jpeg() throws ->ImageFormat{
        var __exceptionC: spirexls_Exception_t?
        let ptr = ImageFormat_get_Jpeg( &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return ImageFormat(ptr!)
    }
    
    /*

    */

    public static func get_MemoryBmp() throws ->ImageFormat{
        var __exceptionC: spirexls_Exception_t?
        let ptr = ImageFormat_get_MemoryBmp( &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return ImageFormat(ptr!)
    }
    
    /*

    */

    public static func get_Png() throws ->ImageFormat{
        var __exceptionC: spirexls_Exception_t?
        let ptr = ImageFormat_get_Png( &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return ImageFormat(ptr!)
    }
    
    /*

    */

    public static func get_Tiff() throws ->ImageFormat{
        var __exceptionC: spirexls_Exception_t?
        let ptr = ImageFormat_get_Tiff( &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return ImageFormat(ptr!)
    }
    
    /*

    */

    public static func get_Wmf() throws ->ImageFormat{
        var __exceptionC: spirexls_Exception_t?
        let ptr = ImageFormat_get_Wmf( &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return ImageFormat(ptr!)
    }
}

