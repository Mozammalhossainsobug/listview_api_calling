class Item {
  final int id;
  final int uId;
  final String title;
  final String body;

  Item({required this.id, required this.uId,required this.title, required this.body});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      uId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}