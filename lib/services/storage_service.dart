import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

//Get Imageurl and VideoUrl from storage
class Storage {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future <String> downloadURL(String imageName) async{
    String downloadURL = await storage.ref('$imageName').getDownloadURL();
    return downloadURL;
  }
  Future <String> downloadvideoURL(String videoName) async{
    String downloadvideoURL = await storage.ref('$videoName').getDownloadURL();
    return downloadvideoURL;
  }
}