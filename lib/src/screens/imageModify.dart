import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ModifyImage extends StatefulWidget {
  @override
  _ModifyImageState createState() => _ModifyImageState();
}

class _ModifyImageState extends State<ModifyImage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );
    var result = await FlutterImageCompress.compressAndGetFile(
      croppedFile.path,
      croppedFile.path,
      quality: 88,
    );
    setState(() {
      _image = result;
      print("image${_image.lengthSync()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Modify Image',
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
            SizedBox(
              width: 0.03 * width,
            ),
            Image.asset(
              'assets/images/icons/avatar.png',
              width: 0.07 * width,
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  height: width * 0.65,
                  width: width * 0.65,
                  child: _image == null
                      ? GestureDetector(
                          onTap: getImage,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/icons/photo.png',
                                height: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Select an Image',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.blue[700],
                ),
                child: Image.asset(
                  'assets/images/icons/upload.png',
                  color: Colors.blue[700],
                  height: 30,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
