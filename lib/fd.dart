import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import 'detail_dimension.dart';

class FDPage extends StatefulWidget {
  final String wheel1Result;
  final String wheel2Result;

  const FDPage({
    super.key,
    required this.wheel1Result,
    required this.wheel2Result,
  });

  @override
  State<FDPage> createState() => _FDPageState();
}

class _FDPageState extends State<FDPage> {
  final StreamController<int> selected = StreamController<int>();
  final Random _random = Random.secure();
  bool _isSpinning = false;
  String? selectedValue;

  final List<String> localWheelItems = [
    'Pancia',
    'Petto',
    'Fatpad',
    'Gambe',
    'Braccia',
    'Schiena',
    'Fianchi',
    'Torso Superiore',
  ];

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void _spinWheel() {
    setState(() {
      _isSpinning = true;
    });

    int randomIndex = _random.nextInt(localWheelItems.length);
    selected.add(randomIndex);

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isSpinning = false;
        selectedValue = localWheelItems[randomIndex];
      });
    });
  }

  void _goToThirdPage() {
    if (selectedValue != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailDimensionPage(
            wheel1Result: widget.wheel1Result,
            wheel2Result: widget.wheel2Result,
            wheel3Result: selectedValue!, sizeItems: const ["XL Naturale", "XL Innaturale", "Estremo Innaturale"],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estrazione dettaglio specifico')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
              children: [
                Text(
                  'Ruota dettagli Grasso',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Gira la ruota per scoprire il dettaglio selezionato casualmente.',
                  style: TextStyle(
                    fontSize: 16,
                    color:  Colors.black54,
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
                for (var item in localWheelItems)
                  FortuneItem(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            getIconForType(item),
                            color: Colors.lightGreenAccent,
                          ),
                          const SizedBox(width: 8),
                          Text(item)
                        ],
                      )
                  ),
              ],
              indicators: const [
                FortuneIndicator(
                  alignment: Alignment.topCenter,
                  child: TriangleIndicator(),
                )
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
        onPressed: _goToThirdPage,
        child: const Icon(Icons.arrow_forward),
      )
          : null,
    );
  }

  IconData getIconForType(String type) {
    switch (type) {
      case 'Pancia':
        return Icons.pregnant_woman;
      case 'Fatpad':
        return Icons.arrow_drop_down;
      case 'Petto':
        return Icons.add_circle;
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
      default:
        return Icons.help_outline;
    }
  }
}