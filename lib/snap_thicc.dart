import 'package:flutter/material.dart';
import 'photo_page.dart';

class SnapThiccPage extends StatefulWidget {
  const SnapThiccPage({super.key});

  @override
  State<SnapThiccPage> createState() => _SnapThiccPageState();
}

class _SnapThiccPageState extends State<SnapThiccPage> {
  final List<String> typeItems = ['Grasso', 'Muscoli', 'Cazzo'];
  final List<String> sizeItems = ['XL Naturale', 'XL Innaturale', 'Estremo Innaturale', 'Dettaglio'];
  final List<String> detailItemsFat = ['Pancia', 'Fatpad', 'Gambe', 'Braccia', 'Schiena', 'Fianchi', 'Torso Superiore'];
  final List<String> detailItemsMuscles = ['Addome', 'Quadricipiti', 'Polpacci', 'V-Shape', 'Spalle', 'Petto', 'Gambe', 'Braccia', 'Schiena', 'Torso Superiore'];
  final List<String> detailItemsCazzo = ['Palle', 'Lunghezza', 'Fusto', 'Cappella', 'Larghezza', 'Pene Curvo', 'Sporgente'];
  final List<String> detailSizeItems = ['XL Naturale', 'XL Innaturale', 'Estremo Innaturale'];

  String? selectedType;
  String? selectedSize;
  String? selectedDetail;
  String? selectedDetailSize;

  IconData _getIconForItem(String item) {
    switch (item) {
    // Tipi
      case 'Grasso':
        return Icons.fastfood;
      case 'Muscoli':
        return Icons.fitness_center;
      case 'Cazzo':
        return Icons.rocket;
    // Dimensioni
      case 'XL Naturale':
        return Icons.compress;
      case 'XL Innaturale':
        return Icons.expand;
      case 'Estremo Innaturale':
        return Icons.zoom_out_map;
      case 'Dettaglio':
        return Icons.zoom_in;
    // Dettagli
      case 'Pancia':
        return Icons.pregnant_woman;
      case 'Fatpad':
        return Icons.arrow_drop_down;
      case 'Gambe':
        return Icons.airline_seat_legroom_extra;
      case 'Braccia':
        return Icons.personal_injury;
      case 'Schiena':
        return Icons.panorama_wide_angle;
      case 'Fianchi':
        return Icons.swap_horiz;
      case 'Torso Superiore':
        return Icons.man;
      case 'Addome':
        return Icons.view_module;
      case 'Quadricipiti':
        return Icons.airline_seat_legroom_extra;
      case 'Polpacci':
        return Icons.airline_seat_legroom_reduced;
      case 'V-Shape':
        return Icons.man_4;
      case 'Spalle':
        return Icons.accessibility_new;
      case 'Palle':
        return Icons.sports_baseball;
      case 'Lunghezza':
        return Icons.swap_vert;
      case 'Fusto':
        return Icons.panorama_vertical;
      case 'Cappella':
        return Icons.beach_access;
      case 'Larghezza':
        return Icons.swap_horiz;
      case 'Pene Curvo':
        return Icons.switch_access_shortcut;
      case 'Sporgente':
        return Icons.upload;
    // Non specificato
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnapThicc'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Titolo e sottotitolo
              const Column(
                children: [
                  Text(
                    'Salva il tuo Padding',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Salva con SnapThicc il tuo padding per non perdere più le tue creazioni.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Primo menu a cascata
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Tipo',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: typeItems.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Row(
                      children: [
                        Icon(_getIconForItem(type), color: Colors.green),
                        const SizedBox(width: 8),
                        Text(type),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedType = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Secondo menu a cascata
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Dimensione',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: sizeItems.map((size) {
                  return DropdownMenuItem(
                    value: size,
                    child: Row(
                      children: [
                        Icon(_getIconForItem(size), color: Colors.green),
                        const SizedBox(width: 8),
                        Text(size),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSize = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Mostra i menu "Dettaglio" e "Dimensione Dettaglio" solo se "Dettaglio" è selezionato
              if (selectedSize == 'Dettaglio') ...[
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Dettaglio',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  items: (selectedType == 'Grasso'
                      ? detailItemsFat
                      : selectedType == 'Muscoli'
                      ? detailItemsMuscles
                      : selectedType == 'Cazzo'
                      ? detailItemsCazzo
                      : <String>[]) // Assicurati che sia una lista di String
                      .map<DropdownMenuItem<String>>((String detail) { // Specifica il tipo esplicitamente
                    return DropdownMenuItem<String>(
                      value: detail,
                      child: Row(
                        children: [
                          Icon(_getIconForItem(detail), color: Colors.green),
                          const SizedBox(width: 8),
                          Text(detail),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDetail = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Dimensione Dettaglio',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  items: detailSizeItems.map((detailSize) {
                    return DropdownMenuItem(
                      value: detailSize,
                      child: Row(
                        children: [
                          Icon(_getIconForItem(detailSize), color: Colors.green),
                          const SizedBox(width: 8),
                          Text(detailSize),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDetailSize = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
              ],
              // Pulsante per navigare a PhotoPage
              // Pulsante per navigare a PhotoPage
              ElevatedButton(
                onPressed: selectedType != null &&
                    selectedSize != null &&
                    (selectedSize != 'Dettaglio' || (selectedDetail != null && selectedDetailSize != null))
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoPage(
                        wheel1Result: selectedType!,
                        wheel2Result: selectedSize!,
                        wheel3Result: selectedDetail,
                        wheel4Result: selectedDetailSize,
                      ),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Crea uno SnapThicc',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.photo),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Divider
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(height: 20),
              // Titolo e descrizione
              const Column(
                children: [
                  Text(
                    'I tuoi SnapThicc',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Visualizza e gestisci i tuoi album già salvati con SnapThicc.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Pulsante per navigare agli album
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SnapThiccPage(), // Sostituisci con la tua pagina degli album
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vai agli Album',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.photo_album),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}