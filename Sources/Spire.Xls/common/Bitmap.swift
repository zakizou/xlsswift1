import spirexls

/*

*/
public class Bitmap: Image{
    public override class var typeName: String { get {
        "Bitmap"
    }}
    public override class var fullTypeName: String { get {
        "spirexls.Bitmap"
    }}
//
////
////    /*
////
////    */
////
////    public func Decode(_ imageData:'Byte[]') throws ->Image{
////        var __exceptionC: spirexls_Exception_t?
////        let cPointerimageData = createCObjectArrayPointer(from:imageData)
////       let countimageData = Int32(imageData.count)
////
////
////        let ptr = Bitmap_Decode(self.getHandle() ,cPointerimageData, &__exceptionC)
////        if let __exceptionC {
////            let __exception = SpireException(__exceptionC)
////            throw __exception
////        }
////        return  Image(ptr!)
////    }
//
//
//    /*
//
//    */
//
//    public func GetPixel(_ x:Int32, _ y:Int32) throws ->Color{
//        var __exceptionC: spirexls_Exception_t?
//
//        let ptr = Bitmap_GetPixel(self.getHandle() ,x,y, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//        return Color(ptr!)
//    }
//
//    /*
//
//    */
//
//    public func SetPixel(_ x:Int32, _ y:Int32, _ color:Color) throws {
//        var __exceptionC: spirexls_Exception_t?
//        let intPtrcolor = color.getHandle()
//
//        Bitmap_SetPixel(self.getHandle() ,x,y,intPtrcolor, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//    }
//
//    /*
//
//    */
//
//    public func Decode(_ fileName:String) throws ->Bitmap{
//        var __exceptionC: spirexls_Exception_t?
//        let ptrfileName = StringToUnsafePointer(fileName)
//        defer {
//            ptrfileName.deallocate()
//        }
//
//        let ptr = Bitmap_DecodeF(self.getHandle() ,ptrfileName, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//        return Bitmap(ptr!)
//    }
//
//    /*
//
//    */
//
//    public func Decode(_ imageData:Stream) throws ->Bitmap{
//        var __exceptionC: spirexls_Exception_t?
//        let intPtrimageData = imageData.getHandle()
//
//        let ptr = Bitmap_DecodeI(self.getHandle() ,intPtrimageData, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//        return Bitmap(ptr!)
//    }
////
////    /*
////
////    */
////
////    public func Decode(_ sKData:'SKData') throws ->Bitmap{
////        var __exceptionC: spirexls_Exception_t?
////        let intPtrsKData = sKData.getHandle()
////
////        let ptr = Bitmap_DecodeS(self.getHandle() ,intPtrsKData, &__exceptionC)
////        if let __exceptionC {
////            let __exception = SpireException(__exceptionC)
////            throw __exception
////        }
////        return Bitmap(ptr!)
////    }
//
//
//    /*
//
//    */
//
//    public func Clone(_ cropRectangle:RectangleF, _ pixelFormat:SpireObject) throws ->Image{
//        var __exceptionC: spirexls_Exception_t?
//        let intPtrcropRectangle = cropRectangle.getHandle()
//        let intPtrpixelFormat = pixelFormat.getHandle()
//
//        let ptr = Bitmap_Clone(self.getHandle() ,intPtrcropRectangle,intPtrpixelFormat, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//        return  Image(ptr!)
//    }
//
//    /*
//
//    */
//
//    public func SetResolution(_ dpiX:Float, _ dpiY:Float) throws {
//        var __exceptionC: spirexls_Exception_t?
//
//        Bitmap_SetResolution(self.getHandle() ,dpiX,dpiY, &__exceptionC)
//        if let __exceptionC {
//            let __exception = SpireException(__exceptionC)
//            throw __exception
//        }
//    }
}

