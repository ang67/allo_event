// const SERVICEDATA = [
//   {
//     "id": 1,
//     "category": "Sonorisation"
//     "serviceName": "Mariage",
//     "rating": 50,
//     "imagePath": "assets/images/events/mariage.jpg",
//   },
//   {
//     "id": 2,
//     "category": "Sonorisation"
//     "serviceName": "Anniversaire",
//     "rating": 45,
//     "imagePath": "assets/images/events/anniversaire.png",
//   },
//   {
//     "id": 3,
//     "category":
//     "serviceName": "Gala",
//     "rating": 35,
//     "imagePath": "assets/images/events/gala.jpg",
//   },
//   {
//     "id": 4,
//     "category":
//     "serviceName": "Concert",
//     "rating": 30,
//     "imagePath": "assets/images/events/concert.jpg",
//   },
//   {
//     "id": 5,
//     "category":
//     "serviceName": "Décès",
//     "rating": 25,
//     "imagePath": "assets/images/events/deces.jpg",
//   },
//   {
//     "id": 6,
//     "category":
//     "serviceName": "Autre",
//     "rating": 20,
//     "imagePath": "assets/images/events/autre.jpg",
//   },
// ];

import 'package:allo_event/widgets/expanded_list/entry_item.dart';
import 'package:flutter/material.dart';

final List<List<Entry>> servicesDtypeDATA = [
  <Entry>[
    Entry(
      Icon(Icons.speaker),
      'Sonorisation',
    ),
    Entry(Icon(Icons.home), 'Réception', <Entry>[
      Entry(null, '              Salle cérémonie'),
      Entry(null, '              Salle cocktail'),
    ]),
    Entry(Icon(Icons.room_service), 'traiteur'),
    Entry(Icon(Icons.cake), "Gâteau mariage"),
    Entry(Icon(Icons.card_membership), "Carte d'invitation"),
    Entry(Icon(Icons.camera_alt), "Photo"),
    Entry(Icon(Icons.video_call), "Vidéo"),
    Entry(Icon(Icons.drive_eta), "Voiture"),
    Entry(Icon(Icons.pregnant_woman), "Mariée et Accessoires", <Entry>[
      Entry(null, '              Robe mariage'),
      Entry(null, '              Accessoires mariée'),
    ]),
    Entry(Icon(Icons.edit), "Soins et Beauté", <Entry>[
      Entry(null, '              Coiffure mariage'),
      Entry(null, '              Maquillage'),
      Entry(null, "              Bijoux"),
    ]),
    Entry(Icon(Icons.person), "Marié et Accessoires", <Entry>[
      Entry(null, '              Costume mariage'),
      Entry(null, '              Accessoires marié'),
    ]),
    Entry(Text('...'), "Autres"),
  ],
  [],
  [],
  [],
  [],
  [],
];
