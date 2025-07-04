// core/services/test_list_service.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/models/test_list_model.dart';

class TestListService {
  Future<List<TestListItem>> fetchTestList() async {
    final uri = Uri.https(
      'mock-api.calleyacd.com',
      '/api/list',
      {
        'userId': '68626f9497757cb741f449b0',
        'email': 'ranasahil8176@gmail.com',
      },
    );

    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch test list: ${response.statusCode}');
    }

    final decoded = json.decode(response.body);

    // If API returns a Map (single object), wrap it in a list:
    if (decoded is Map<String, dynamic>) {
      return [TestListItem.fromJson(decoded)];
    }

    // Otherwise if it ever returns a List, map each entry:
    if (decoded is List) {
      return decoded
          .cast<Map<String, dynamic>>()
          .map((e) => TestListItem.fromJson(e))
          .toList();
    }

    // Fallback: empty
    return [];
  }
}
