import 'package:allo_event/widgets/expanded_list/entry_item.dart';

const EVENTDATA = [
  {
    "id": 1,
    "eventName": "Mariage",
    "numberOfItems": 50,
    "imagePath": "assets/images/events/mariage.jpg",
  },
  {
    "id": 2,
    "eventName": "Anniversaire",
    "numberOfItems": 45,
    "imagePath": "assets/images/events/anniversaire.png",
  },
  {
    "id": 3,
    "eventName": "Gala",
    "numberOfItems": 35,
    "imagePath": "assets/images/events/gala.jpg",
  },
  {
    "id": 4,
    "eventName": "Concert",
    "numberOfItems": 30,
    "imagePath": "assets/images/events/concert.jpg",
  },
  {
    "id": 5,
    "eventName": "Décès",
    "numberOfItems": 25,
    "imagePath": "assets/images/events/deces.jpg",
  },
  {
    "id": 6,
    "eventName": "Autre",
    "numberOfItems": 20,
    "imagePath": "assets/images/events/autre.jpg",
  },
];
final data = [
  'Sonorisation',
  {
    'Reception': ['Salle de reception', 'traiteur']
  },
  {
    'Vêtements': [
      'Costume de mariage',
      "Filles et garçon d'honneur",
      'Robe de mariage'
    ],
  }
];

final List<Entry> servicesDtypeDATA = <Entry>[
  Entry('Sonorisation'),
  Entry('Réception', <Entry>[
    Entry('Salle cérémonie'),
    Entry('Salle cocktail'),
  ]),
  Entry('traiteur'),
  Entry("Gâteau mariage"),
  Entry("Carte d'invitation"),
  Entry("Photo"),
  Entry("Vidéo"),
  Entry("Voiture"),
  Entry("Mariée et Accessoires", <Entry>[
    Entry('Costumes mariage'),
    Entry('Accessoires mariée'),
  ]),
  Entry("Soins et Beauté", <Entry>[
    Entry('Coiffure mariage'),
    Entry('Maquillage'),
    Entry("Bijoux"),
  ]),
  Entry("Marié et Accessoires", <Entry>[
    Entry('Costumes mariage'),
    Entry('Accessoires marié'),
  ]),
  Entry("Autres"),
];
