import 'package:flutter/material.dart';
import 'package:padding_app/photo_page.dart';

class ThirdPage extends StatelessWidget {
  final String wheel1Result;
  final String wheel2Result;
  final String? wheel3Result;
  final String? wheel4Result;

  ThirdPage({
    super.key,
    required this.wheel1Result,
    required this.wheel2Result,
    required this.wheel3Result,
    required this.wheel4Result,
  });

  final Map<String, String> wheel1Descriptions = {
    'Grasso': 'È stato estratto per la realizzazione un padding a tema grasso.',
    'Muscoli': 'È stato estratto per la realizzazione un padding a tema muscoli.',
    'Cazzo': 'È stato estratto per la realizzazione un padding a tema cazzo.',
  };

  final Map<String, String> wheel2Descriptions = {
    'XL Naturale': 'È stata estratta per la realizzazione una dimensione XL Naturale. \n(Il padding dovrà avere dimensioni realistiche e naturali).',
    'XL Innaturale': 'È stata estratta per la realizzazione una dimensione XL Innaturale. \n(Il padding dovrà avere dimensioni realistiche con dettagli innaturali).',
    'Estremo Innaturale': 'È stata estratta per la realizzazione una dimensione Estrema Innaturale. \n(Il padding dovrà avere dimensioni estreme e innaturali).',
    'Dettaglio Specifico': 'È stata estratta la realizzazione di un dettaglio specifico. \n(Il padding dovrà essere basato sulle informazioni presenti sul dettaglio estratto).',
  };

  final Map<String, String> wheel3Descriptions = {
    'Pancia': 'È stato estratto come dettaglio la pancia, dovrai effetturare un padding alla pancia in base al tipo estratto.',
    'Fatpad': 'È stato estratto come dettaglio il fatpad, dovrai effetturare un padding al fatpad in base al tipo estratto.',
    'Petto': 'È stato estratto come dettaglio il petto, dovrai effetturare un padding al petto in base al tipo estratto.',
    'Gambe': 'È stato estratto come dettaglio le gambe, dovrai effetturare un padding alle gambe in base al tipo estratto.',
    'Braccia': 'È stato estratto come dettaglio le braccia, dovrai effetturare un padding alle braccia in base al tipo estratto.',
    'Schiena': 'È stato estratto come dettaglio la schiena, dovrai effetturare un padding alla schiena in base al tipo estratto.',
    'Fianchi': 'È stato estratto come dettaglio i fianchi, dovrai effetturare un padding ai fianchi in base al tipo estratto.',
    'Torso Superiore': 'È stato estratto come dettaglio il torso superiore, dovrai effetturare un padding al torso superiore in base al tipo estratto.',
    'Addome': 'È stato estratto come dettaglio l\'addome, dovrai effetturare un padding all\'addome in base al tipo estratto.',
    'Quadricipiti': 'È stato estratto come dettaglio i quadricipiti, dovrai effetturare un padding ai quadricipiti in base al tipo estratto.',
    'Polpacci': 'È stato estratto come dettaglio i polpacci, dovrai effetturare un padding ai polpacci in base al tipo estratto.',
    'V-Shape': 'È stato estratto come dettaglio il V-Shape, dovrai effetturare un padding al V-Shape in base al tipo estratto.',
    'Spalle': 'È stato estratto come dettaglio le spalle, dovrai effetturare un padding alle spalle in base al tipo estratto.',
    'Palle': 'È stato estratto come dettaglio le palle, dovrai effetturare un padding alle palle.',
    'Lunghezza': 'È stato estratto come dettaglio la lunghezza, dovrai effetturare un padding alla lunghezza del cazzo.',
    'Cazzo': 'È stato estratto come dettaglio il cazzo, dovrai effetturare un padding al cazzo (Fusto + Cappella).',
    'Fusto': 'È stato estratto come dettaglio il fusto, dovrai effetturare un padding al fusto del cazzo.',
    'Cappella': 'È stato estratto come dettaglio la cappella, dovrai effetturare un padding alla cappella del cazzo',
    'Larghezza': 'È stato estratto come dettaglio la larghezza, dovrai effetturare un padding alla larghezza del cazzo.',
    'Pene Curvo': 'È stato estratto come dettaglio il pene ricurvo, dovrai effetturare un padding facendo un pene curvo molto evidente.',
    'Sporgente': 'È stato estratto come dettaglio sporgente, dovrai effetturare un padding al cazzo in modo che sia molto sporgente e vistoso dalle mutande.',

  };

  final Map<String, String> wheel4Descriptions = {
    'XL Naturale': 'È stata estratta per la realizzazione una dimensione XL Naturale. \n(Il padding dovrà avere dimensioni realistiche e naturali).',
    'XL Innaturale': 'È stata estratta per la realizzaizone una dimensione XL Innaturale. \n(Il padding dovrà avere dimensioni realistiche con dettagli innaturali).',
    'Estremo Innaturale': 'È stata estratta per la realizzazione una dimensione Estrema Innaturale. \n(Il padding dovrà avere dimensioni estreme e innaturali).',
  };

  IconData _getIconForWheel1(String result) {
    switch (result) {
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

  IconData _getIconForWheel2(String result) {
    switch (result) {
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

  IconData _getIconForWheel3(String? result) {
    if (result == null) return Icons.not_interested;
    switch (result) {
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
      //case 'Petto':
        //return Icons.fitness_center;
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
      //case 'Braccia':
        //return Icons.fitness_center;
      //case 'Schiena':
        //return Icons.back_hand;
      case 'Palle':
        return Icons.sports_baseball;
      case 'Lunghezza':
        return Icons.swap_vert;
      case 'Cazzo':
        return Icons.rocket;
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
      default:
        return Icons.help_outline;
    }
  }

  IconData _getIconForWheel4(String result) {
    switch (result) {
      case 'XL Naturle':
        return Icons.compress;
      case 'XL Innaturale':
        return Icons.expand;
      case 'Estremo Innaturale':
        return Icons.zoom_out_map;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Padding Bro +'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Risultati dell\'estrazione',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Ecco i dettagli del padding creato casualmente per te in base alle tue preferenze.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Card per wheel1
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              _getIconForWheel1(wheel1Result),
                              color: Colors.green,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Tipo:',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                wheel1Result,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.info_outline, color: Colors.grey),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Dettagli'),
                                  content: Text(
                                    wheel1Descriptions[wheel1Result] ?? 'Nessuna descrizione disponibile.',
                                  ),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Card per wheel2
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              _getIconForWheel2(wheel2Result),
                              color: Colors.green,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Dimensione:',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                wheel2Result,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.info_outline, color: Colors.grey),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Dettagli'),
                                  content: Text(
                                    wheel2Descriptions[wheel2Result] ?? 'Nessuna descrizione disponibile.',
                                  ),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Card per wheel3 (se esiste)
            if (wheel3Result != null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Icon(
                                _getIconForWheel3(wheel3Result!),
                                color: Colors.green,
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Dettaglio:',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  wheel3Result!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.info_outline, color: Colors.grey),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Dettagli'),
                                    content: Text(
                                      wheel3Descriptions[wheel3Result!] ?? 'Nessuna descrizione disponibile.',
                                    ),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            // Card per wheel4 (se esiste)
            if (wheel4Result != null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Icon(
                                _getIconForWheel4(wheel4Result!),
                                color: Colors.green,
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Forma Dettaglio:',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  wheel4Result!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.info_outline, color: Colors.grey),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Dettagli'),
                                    content: Text(
                                      wheel4Descriptions[wheel4Result!] ?? 'Nessuna descrizione disponibile.',
                                    ),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 10),
            // Frase per invitare a fare foto
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Cattura il Tuo SnapThicc!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Immortala il tuo Padding con SnapThicc.\nSalva il risultato per non dimenticarlo mai!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhotoPage(
                              wheel1Result: wheel1Result,
                              wheel2Result: wheel2Result,
                              wheel3Result: wheel3Result,
                              wheel4Result: wheel4Result,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo),
                          SizedBox(width: 8),
                          Text(
                            'Vai a SnapThicc',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[300], // Colore meno evidente
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0), // Padding ridotto orizzontalmente
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min, // Restringe l'area del contenuto
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restart_alt, color: Colors.black54), // Icona aggiunta
              SizedBox(width: 8),
              Text(
                'Ricomincia l\'estrazione', // Testo invariato
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54, // Testo meno evidente
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}