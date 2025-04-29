import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:padding_app/third_page.dart';
import 'fd.dart';
import 'md.dart';
import 'cd.dart';

class SecondPage extends StatefulWidget {
  final String result;
  final List<String> sizeItems;

  const SecondPage({super.key, required this.result, required this.sizeItems});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final StreamController<int> selected = StreamController<int>();
  final Random _random = Random.secure();
  final Set<int> extractedIndices = {};
  bool _isSpinning = false;
  String? selectedValue;
  late List<String> adjustedSizeItems;

  @override
  void initState() {
    super.initState();

    adjustedSizeItems = List.from(widget.sizeItems);
    if (adjustedSizeItems.length % 2 != 0) {
      final int multiplier = ((8 / adjustedSizeItems.length).ceil() | 1);
      final int totalItems = multiplier * adjustedSizeItems.length;

      while (adjustedSizeItems.length < totalItems) {
        adjustedSizeItems.addAll(widget.sizeItems);
      }
      adjustedSizeItems.length = totalItems;
    } else {
      while (adjustedSizeItems.length < 8) {
        adjustedSizeItems.addAll(widget.sizeItems);
      }
      adjustedSizeItems = adjustedSizeItems.sublist(0, 8);
    }
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void _spinWheel() {
    setState(() {
      _isSpinning = true;
    });

    int randomIndex;
    do {
      randomIndex = _random.nextInt(adjustedSizeItems.length);
    } while (extractedIndices.contains(randomIndex) && extractedIndices.length < adjustedSizeItems.length);

    extractedIndices.add(randomIndex);
    selected.add(randomIndex);

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isSpinning = false;
        selectedValue = adjustedSizeItems[randomIndex];
      });
    });
  }

  void _goToNextWheel() {
    if (selectedValue != null) {
      if (selectedValue == 'Dettaglio Specifico') {
        switch (widget.result) {
          case 'Grasso':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FDPage(wheel1Result: widget.result, wheel2Result: selectedValue!)),
            );
            break;
          case 'Muscoli':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MDPage(wheel1Result: widget.result, wheel2Result: selectedValue!)),
            );
            break;
          case 'Cazzo':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CDPage(wheel1Result: widget.result, wheel2Result: selectedValue!)),
            );
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Pagina non trovata per il risultato selezionato!')),
            );
        }
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThirdPage(
              wheel1Result: widget.result,
              wheel2Result: selectedValue!,
              wheel3Result: null,
              wheel4Result: null,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estrazione Dimensione'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Text(
                  'Ruota della Dimensione',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Gira la ruota per scoprire la dimensione del padding selezionata casualmente.',
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
                for (var item in adjustedSizeItems)
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
              style: Theme.of(context).elevatedButtonTheme.style,
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
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.arrow_forward),
            )
          : null,
    );
  }

  IconData getIconForType(String type) {
    switch (type) {
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
}