import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class HomePageImg extends StatefulWidget {
  const HomePageImg({Key? key}) : super(key: key);

  @override
  State<HomePageImg> createState() => _HomePageImgState();
}

class _HomePageImgState extends State<HomePageImg> {
  FirebaseStorage storage = FirebaseStorage.instance;
  late String uploadedPhotoUrl;
  // Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage

  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);

      File imageFile = File(pickedImage.path);

      if (!kIsWeb) {
        try {
          // Uploading the selected image with some custom meta data
          await storage.ref(fileName).putFile(
              imageFile,
              SettableMetadata(customMetadata: {
                'uploaded_by': 'Um produto qualquer',
                'description': 'Produto para vender...'
              }));

          // Refresh the UI
          setState(() {});
        } on FirebaseException catch (error) {
          if (kDebugMode) {
            print(error);
          }
        }
      } else {
        Reference reference =
            storage.ref().child(path.basename(pickedImage.path));
        await reference
            .putData(
          await pickedImage.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'),
        )
            .whenComplete(() async {
          await reference.getDownloadURL().then((value) {
            uploadedPhotoUrl = value;
          });
        });

        // String path = selectPicture(ImageSource.gallery) as String;
        // Uint8List imageData = await XFile(path).readAsBytes();
        // UploadTask uploadTask = storage.ref().putData(imageData);
        // uploadTask.resume();
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<String?> selectPicture(ImageSource source) async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: source,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    return image?.path;
  }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('albertosales.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    onPressed: () => _upload('camera'),
                    icon: const Icon(Icons.camera),
                    label: const Text('camera')),
                ElevatedButton.icon(
                    onPressed: () => _upload('gallery'),
                    icon: const Icon(Icons.library_add),
                    label: const Text('Gallery')),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: _loadImages(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> image =
                            snapshot.data![index];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            dense: false,
                            leading: Image.network(image['url']),
                            title: Text(image['uploaded_by']),
                            subtitle: Text(image['description']),
                            trailing: IconButton(
                              onPressed: () => _delete(image['path']),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
