import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        // Carica l'immagine
        final File originalFile = File(pickedFile.path);
        final img.Image? originalImage = img.decodeImage(await originalFile.readAsBytes());

        if (originalImage != null) {
          // Ruota l'immagine di 90° verso sinistra
          final img.Image rotatedImage = img.copyRotate(originalImage, 90);

          // Calcola la posizione della filigrana (in basso a sinistra)
          const int x = 20; // Margine sinistro
          final int y = rotatedImage.height - 100; // Margine dal basso

          // Aggiungi la filigrana con un font molto grande
          final img.Image watermarkedImage = img.drawString(
            rotatedImage,
            img.arial_48, // Font molto grande
            x,
            y,
            'Padding Bro +    Tipo: AAA Dimensione: BBB', // Testo della filigrana
            color: img.getColor(255, 255, 255), // Colore bianco
          );

          // Salva l'immagine modificata in un file temporaneo
          final File watermarkedFile = File('${originalFile.parent.path}/watermarked_image.jpg');
          await watermarkedFile.writeAsBytes(img.encodeJpg(watermarkedImage));

          // Salva l'immagine nella galleria
          final bool? success = await GallerySaver.saveImage(
            watermarkedFile.path,
            albumName: 'Padding Bro +', // Nome della cartella
          );

          if (success == true) {
            // Elimina i file temporanei
            await originalFile.delete();
            await watermarkedFile.delete();

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Immagine salvata con filigrana nella galleria!')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Errore nel salvataggio dell\'immagine.')),
            );
          }
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Errore: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleziona o Scatta Foto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: const Text('Seleziona dalla Galleria'),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: const Text('Scatta una Foto'),
            ),
          ],
        ),
      ),
    );
  }
}