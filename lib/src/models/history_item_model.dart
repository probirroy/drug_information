class HistoryItem {
  int id;
  String name;

  HistoryItem({
    required this.id,
    required this.name,
  });

  factory HistoryItem.fromMap(Map<String, dynamic> json) => HistoryItem(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}