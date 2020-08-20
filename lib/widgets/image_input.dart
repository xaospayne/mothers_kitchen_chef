import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart'as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _pickedImage;

  Future<void> _takePicture()async {
    // final picker = ImagePicker();
    //final imageFile = await picker.getImage(
    //  source: ImageSource.camera, maxWidth: 600,
    //);

    // ignore: deprecated_member_use
    final imageFile= await ImagePicker.pickImage(source:ImageSource.camera,);
    if (imageFile == null){
      return;
    }
    setState(() {
      _pickedImage =File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: _pickedImage != null ? FileImage(_pickedImage) : null,
            radius: 70,
          ),
          FlatButton.icon(
              onPressed: _takePicture,
              icon: Icon(Icons.camera_alt,size: 25,color: Colors.grey.shade900,),
              label: Text(''),
          ),
        ],
    );
  }
}

/*


Container(
width: 100,
height: 100,
decoration: BoxDecoration(
border: Border.all(width: 1, color: Colors.grey),
shape: BoxShape.circle,
),
child: _pickedImage != null ?
Image.file( _pickedImage,
fit: BoxFit.cover,
width: double.infinity,) :
Text('Select An Image', textAlign: TextAlign.center, ),
alignment: Alignment.center,
),
Icon(Icons.camera_alt,color: Colors.grey,),*/
