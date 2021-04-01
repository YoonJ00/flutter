import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:bookhub/screens/start.dart';
import 'package:bookhub/screens/book_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}

class books extends StatefulWidget {
  @override
  _SingleImageUploadState createState() {
    return _SingleImageUploadState();
  }
}

class _SingleImageUploadState extends State<books> {
  List<Object> images = List<Object>();
  Future<File> _imageFile;
  String _imagepath;
  File _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadImage();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => start()),
                    );
                  },
                  child: new Image(
                    width: 50.0,
                    height: 13.77,
                    image: AssetImage(
                      'images/back.png',
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => start()),
                );
              },
              child: Center(
                child: Image(
                  width: 180.0,
                  height: 55.77,
                  image: AssetImage(
                    'images/sub_logo.PNG',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                      width: 380,
                      height: 538,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: const Color(0x14000000))),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35.0, top: 18),
                  child: Text(
                    "Books",
                    style: const TextStyle(
                        color: const Color(0xff373737),
                        fontWeight: FontWeight.w500,
                        fontFamily: "HCRBatang",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Expanded(
                    child: buildGridView(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridView() {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 80) / 2;
    final double itemWidth = (size.width) / 2;
    return GridView.count(
      padding: const EdgeInsets.all(30.0),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel uploadModel = images[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => book_detail()),
                    );
                  },
                  child: Image.file(
                    uploadModel.imageFile,
                    width: 300,
                    height: 300,
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: const Color(0xFF1B311E),
                    ),
                    onTap: () {
                      setState(() {
                        images.replaceRange(index, index + 1, ['Add Image']);
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 138.0, top: 30.0),
                  child: Positioned(
                    right: 5,
                    top: 5,
                    child: InkWell(
                      child: Icon(
                        Icons.check_circle,
                        size: 20,
                        color: const Color(0xFF1B311E),
                      ),
                      onTap: () {
                        Saveimage(_imageFile.hashCode);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _onAddImageClick(index);
              },
            ),
          );
        }
      }),
    );
  }

  void getFileImage(int index) async {
    //    var dir = await path_provider.getTemporaryDirectory();

    _imageFile.then((file) async {
      setState(() {
        ImageUploadModel imageUpload = new ImageUploadModel();
        imageUpload.isUploaded = false;
        imageUpload.uploading = false;
        imageUpload.imageFile = file;
        imageUpload.imageUrl = '';
        images.replaceRange(index, index + 1, [imageUpload]);
      });
    });
  }

  Future _onAddImageClick(int index) async {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
      getFileImage(index);
    });
  }

  void Saveimage(path) async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagepath", path);
  }

  void LoadImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      _imagepath = saveimage.getString("imagepath");
    });
  }
}
