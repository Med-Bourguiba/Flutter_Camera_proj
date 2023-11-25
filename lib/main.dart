import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caméra Flutter'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Appel de la fonction pour ouvrir la caméra
            openCamera(context);
          },
          child: const Text('Ouvrir la caméra'),
        ),
      ),
    );
  }

  // Fonction pour ouvrir la caméra
  void openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final PickedFile? pickedFile =
        await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Enregistrer l'image dans la galerie
      await GallerySaver.saveImage(pickedFile.path);

      // Utilisation de ScaffoldMessenger pour afficher le SnackBar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Photo enregistrée dans la galerie'),
      ));
    }
  }
}
