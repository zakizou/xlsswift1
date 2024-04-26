import spirexls

/*

*/
public class Image: SpireObject{
    public override class var typeName: String { get {
        "Image"
    }}
    public override class var fullTypeName: String { get {
        "spirexls.Image"
    }}
 
    required init(_ handle: UnsafeMutableRawPointer) {
        super.init(handle)
    }
    required init(_ object: SpireObject) {
        super.init(object.getHandle())
    }

    
    /*

    */

    public static func FromFile(_ imageFile:String) throws ->Image{
        var __exceptionC: spirexls_Exception_t?
        let ptrimageFile = StringToUnsafePointer(imageFile)
        defer {
            ptrimageFile.deallocate()
        }

        let ptr = Image_FromFile(ptrimageFile, &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return  Image(ptr!)
    }
    
    /*

    */

    public func get_Width() throws -> Int32{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Image_get_Width(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
    /*

    */

    public func get_Height() throws -> Int32{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Image_get_Height(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
    /*

    */

    public func get_Size() throws ->Size{
        var __exceptionC: spirexls_Exception_t?
        let ptr = Image_get_Size(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return Size(ptr!)
    }
    
    /*

    */

    public func get_VerticalResolution() throws -> Float{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Image_get_VerticalResolution(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
    /*

    */

    public func get_HorizontalResolution() throws -> Float{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Image_get_HorizontalResolution(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
    
   /*

   */

   public func Save(_ stream:Stream, _ imageFormat:ImageFormat) throws {
       var __exceptionC: spirexls_Exception_t?
       let intPtrstream = stream.getHandle()
        let intPtrimageFormat = imageFormat.getHandle()

       Image_SaveSF(self.getHandle() ,intPtrstream, intPtrimageFormat, &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
   }
    
    /*

    */

    public func Save(_ file:String) throws {
        var __exceptionC: spirexls_Exception_t?
        let ptrfile = StringToUnsafePointer(file)
        defer {
            ptrfile.deallocate()
        }

        Image_Save(self.getHandle() ,ptrfile, &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
    }
    
    /*

    */

    public func Save(_ file:String, _ imageFormat:ImageFormat) throws {
        var __exceptionC: spirexls_Exception_t?
        let ptrfile = StringToUnsafePointer(file)
        defer {
            ptrfile.deallocate()
        }
        let intPtrimageFormat = imageFormat.getHandle()

        Image_SaveFF(self.getHandle() ,ptrfile,intPtrimageFormat, &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
    }
    
    /*

    */

    public func Dispose() throws {
        var __exceptionC: spirexls_Exception_t?
        Image_Dispose(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
    }
   
    /*

    */

    public func get_Flags() throws -> Int32{
        var __exceptionC: spirexls_Exception_t?
        let __returnValueC = Image_get_Flags(self.getHandle(), &__exceptionC)
        if let exceptionC = __exceptionC {
            let exception = SpireException(exceptionC)
            throw exception
        }
        return __returnValueC
    }
}

