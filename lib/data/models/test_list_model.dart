// data/models/test_list_model.dart

class TestListItem {
  final String id;
  final String name;

  TestListItem({required this.id, required this.name});

  factory TestListItem.fromJson(Map<String, dynamic> json) {
    return TestListItem(
      id: json['_id'].toString(), // use _id
      name: json['name'] ?? 'Unnamed List', // fallback if name missing
    );
  }
}
