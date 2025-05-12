import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:image/image.dart' as img;
import 'dart:io';
import 'package:intl/intl.dart';

class PhotoPage extends StatefulWidget {
  final String wheel1Result;
  final String wheel2Result;
  final String? wheel3Result;
  final String? wheel4Result;

  const PhotoPage({
    super.key,
    required this.wheel1Result,
    required this.wheel2Result,
    this.wheel3Result,
    this.wheel4Result,
  });

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final ImagePicker _picker = ImagePicker();
  final List<File?> _photos = List<File?>.filled(8, null);
  int _currentIndex = 0;

  late final List<String> _captions;

  @override
  void initState() {
    super.initState();
    _captions = [
      'Frontale',
      'Lato sinistro',
      'Lato destro',
      'Posteriore',
      'Seduto',
      'Disteso',
      '',
      '',
    ];
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final File originalFile = File(pickedFile.path);
        final img.Image? originalImage = img.decodeImage(await originalFile.readAsBytes());

        if (originalImage != null) {
          final img.Image rotatedImage = img.copyRotate(originalImage, 90);

          // Dati per la filigrana
          final String timestamp = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
final String watermarkText = 'Padding Bro +\nData: $timestamp\nPosa: ${_captions[_currentIndex]}\nTipo: ${widget.wheel1Result}, Dimensione: ${widget.wheel2Result}${widget.wheel3Result != null ? ', Dettaglio: ${widget.wheel3Result}' : ''}${widget.wheel4Result != null ? ', Forma dettaglio: ${widget.wheel4Result}' : ''}, ';
          const int x = 20;
          final int y = rotatedImage.height - 200;

          final img.Image watermarkedImage = img.drawString(
            rotatedImage,
            img.arial_48,
            x,
            y,
            watermarkText,
            color: img.getColor(255, 255, 255),
          );

          final File watermarkedFile = File('${originalFile.parent.path}/watermarked_image_$_currentIndex.jpg');
          await watermarkedFile.writeAsBytes(img.encodeJpg(watermarkedImage));

          final bool? success = await GallerySaver.saveImage(
            watermarkedFile.path,
            albumName: 'Padding Bro +',
          );

          if (success == true) {
            setState(() {
              _photos[_currentIndex] = watermarkedFile;
            });

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

  void _nextPhoto() {
    if (_currentIndex < _captions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scatta Foto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Titolo e sottotitolo
            const Column(
              children: [
                Text(
                  'SnapThicc',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Pronto a flexare? Segui le dritte sopra il pulsante e cattura il tuo padding con SnapThicc.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Placeholder immagine
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _photos[_currentIndex] != null
                    ? Image.file(_photos[_currentIndex]!, fit: BoxFit.cover)
                    : const Icon(Icons.camera_alt, size: 100, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            // Didascalia della foto
            Text(
              _captions[_currentIndex],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Pulsante di scatto
            Center(
              child: ElevatedButton(
                onPressed: _photos[_currentIndex] == null ? _pickImage : null,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Icon(Icons.camera_alt, size: 30),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _photos[_currentIndex] != null
          ? FloatingActionButton(
              onPressed: _nextPhoto,
              child: const Icon(Icons.arrow_forward),
            )
          : null,
    );
  }
}