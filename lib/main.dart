import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:padding_app/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padding Bro +',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green[700],
        hintColor: Colors.lightGreenAccent,
        scaffoldBackgroundColor: Colors.green[50],
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green, //ruota + pulsanti
          accentColor: Colors.lightGreenAccent,
          backgroundColor: Colors.green[50],
        ).copyWith(
          secondary: Colors.green[600], //punta ruota
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black87,
          error: Colors.red,
          onError: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[600],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.green;
            }
            return Colors.white;
          }),
          checkColor: WidgetStateProperty.all(Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[900],
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
          bodySmall: TextStyle(fontSize: 12, color: Colors.white60),
        ),
        cardTheme: CardTheme(
          color: Colors.grey[800],
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.green;
            }
            return Colors.grey;
          }),
          checkColor: WidgetStateProperty.all(Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.grey[800],
          titleTextStyle: const TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const SelectionPage(),
    );
  }
}


class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  final List<String> typeOptions = ['Grasso', 'Muscoli', 'Cazzo'];
  final List<String> sizeOptions = ['XL Naturale', 'XL Innaturale', 'Estremo Innaturale', 'Dettaglio Specifico'];
  final List<bool> selectedTypeOptions = [false, false, false];
  final List<bool> selectedSizeOptions = [false, false, false, false];

  final Map<String, String> typeDescriptions = {
    'Grasso': 'Se estratto bisogna creare un padding a tema grasso.\n(Es. Sovrappeso, obeso, ecc...).',
    'Muscoli': 'Se estratto bisogna creare un padding a tema muscoli.\n(Es. Bodybuilder, palestrato, ecc...).',
    'Cazzo': 'Se estratto bisogna creare un padding a tema cazzo.\n(Es. Super dotato, monstercock, ecc...).',
  };

  final Map<String, String> sizeDescriptions = {
    'XL Naturale': 'Padding di dimensione XL con proporzioni, forme e dimensioni realistiche e naturali.',
    'XL Innaturale': 'Padding di dimensione XL con proporzioni, forme e dimensioni realistiche ma con dettagli innaturali.',
    'Estremo Innaturale': 'Padding di dimensione estreme con proporzioni, forme e dimensioni realistiche e innaturali.',
    'Dettaglio Specifico': 'Padding di una specifica parte del corpo.',
  };

  IconData _getIconForType(String type) {
    switch (type) {
      case 'Grasso':
        return Icons.fastfood;
      case 'Muscoli':
        return Icons.fitness_center;
      case 'Cazzo':
        return Icons.rocket;
      default:
        return Icons.help_outline;
    }
  }

  IconData _getIconForSize(String size) {
    switch (size) {
      case 'XL Naturale':
        return Icons.compress;
      case 'XL Innaturale':
        return Icons.expand;
      case 'Estremo Innaturale':
        return Icons.zoom_out_map;
      case 'Dettaglio Specifico':
        return Icons.zoom_in;
      default:
        return Icons.help_outline;
    }
  }

  void _navigateToWheel() {
    final selectedTypes = <String>[];
    final selectedSizes = <String>[];

    for (int i = 0; i < typeOptions.length; i++) {
      if (selectedTypeOptions[i]) {
        selectedTypes.add(typeOptions[i]);
      }
    }

    for (int i = 0; i < sizeOptions.length; i++) {
      if (selectedSizeOptions[i]) {
        selectedSizes.add(sizeOptions[i]);
      }
    }

    if (selectedTypes.isNotEmpty && selectedSizes.isNotEmpty) {
      final int multiplier = (8 / selectedTypes.length).ceil();
      final int totalItems = multiplier * selectedTypes.length;

      while (selectedTypes.length < totalItems) {
        selectedTypes.addAll(List.from(selectedTypes));
      }
      selectedTypes.length = totalItems;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(
            typeItems: selectedTypes,
            sizeItems: selectedSizes,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seleziona almeno un\'opzione per entrambe le categorie')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Padding Bro +'),
        backgroundColor: Colors.green,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Crea il tuo Padding',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Scegli le opzioni che preferisci per creare il tuo padding casualmente.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Tipo',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Seleziona i tipi di padding che preferisci.',
                      style: TextStyle(fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...List.generate(typeOptions.length, (index) {
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CheckboxListTile(
                          title: Row(
                            children: [
                              Icon(
                                _getIconForType(typeOptions[index]),
                                color: Colors.green,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  typeOptions[index],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.info_outline, color: Colors.grey),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Dettagli'),
                                        content: Text(typeDescriptions[typeOptions[index]] ?? 'Nessuna descrizione disponibile.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors.green,
                                            ),
                                            child: const Text('Chiudi'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          value: selectedTypeOptions[index],
                          onChanged: (value) {
                            setState(() {
                              selectedTypeOptions[index] = value ?? false;
                            });
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    const Text(
                      'Dimensioni',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Seleziona le dimensioni di padding che preferisci.',
                      style: TextStyle(fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...List.generate(sizeOptions.length, (index) {
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CheckboxListTile(
                          title: Row(
                            children: [
                              Icon(
                                _getIconForSize(sizeOptions[index]),
                                color: Colors.green,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  sizeOptions[index],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.info_outline, color: Colors.grey),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Dettagli'),
                                        content: Text(sizeDescriptions[sizeOptions[index]] ?? 'Nessuna descrizione disponibile.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors.green,
                                            ),
                                            child: const Text('Chiudi'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          value: selectedSizeOptions[index],
                          onChanged: (value) {
                            setState(() {
                              selectedSizeOptions[index] = value ?? false;
                            });
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _navigateToWheel,
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
                            'Continua',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<String> typeItems;
  final List<String> sizeItems;

  const MyHomePage({super.key, required this.typeItems, required this.sizeItems});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController<int> selected = StreamController<int>();
  bool _isSpinning = false;
  String? selectedValue;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void _spinWheel() {
    setState(() {
      _isSpinning = true;
    });

    int randomIndex = Fortune.randomInt(0, widget.typeItems.length);
    selected.add(randomIndex);

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isSpinning = false;
        selectedValue = widget.typeItems[randomIndex];
      });
    });
  }

  void _goToNextWheel() {
    if (selectedValue != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(
            result: selectedValue!,
            sizeItems: widget.sizeItems,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estrazione Tipo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Text(
                  'Ruota del Tipo',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Gira la ruota per scoprire il tipo di padding selezionato casualmente.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: FortuneWheel(
              styleStrategy: const AlternatingStyleStrategy(),
              selected: selected.stream,
              items: [
                for (var item in widget.typeItems)
                  FortuneItem(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          getIconForType(item), // Usa la funzione per ottenere l'icona
                          color: Colors.lightGreenAccent,
                        ),
                        const SizedBox(width: 8),
                        Text(item),
                      ],
                    ),
                  ),
              ],
              indicators: const [
                FortuneIndicator(
                  alignment: Alignment.topCenter,
                  child: TriangleIndicator(),
                ),
              ],
              onAnimationEnd: () {
                setState(() {
                  _isSpinning = false;
                });
              },
            ),
          ),
          if (selectedValue != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Risultato:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    getIconForType(selectedValue!), // Usa la funzione per ottenere l'icona
                    color: Colors.green,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    selectedValue!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          if (selectedValue == null)
            ElevatedButton(
              onPressed: _isSpinning ? null : _spinWheel,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh),
                  SizedBox(width: 8),
                  Text('Gira la ruota'),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: selectedValue != null
          ? FloatingActionButton(
              onPressed: _goToNextWheel,
              child: const Icon(Icons.arrow_forward),
            )
          : null,
    );
  }

  IconData getIconForType(String type) {
    switch (type) {
      case 'Grasso':
        return Icons.fastfood;
      case 'Muscoli':
        return Icons.fitness_center;
      case 'Cazzo':
        return Icons.rocket;
      default:
        return Icons.help_outline;
    }
  }
}