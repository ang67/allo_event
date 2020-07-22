class Event {
  final int id;
  final String eventName;
  final int numberOfItems;
  final String imagePath;

  Event({this.id, this.eventName, this.numberOfItems, this.imagePath});

  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        eventName = json['eventName'],
        numberOfItems = json['numberOfItems'],
        imagePath = json['imagePath'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'eventName': eventName,
        'numberOfItems': numberOfItems,
        'imagePath': imagePath,
      };
}
