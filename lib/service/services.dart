// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';


  final String apiUrl="https://scubetech.xyz/projects/dashboard/";

  Future<List<AssignedEngineer>> getAllAssignedEngineers() async {
    final response = await http.get(Uri.parse(apiUrl+"all-project-elements/"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => AssignedEngineer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> addAssignedEngineer(AssignedEngineer assignedEngineer) async {
    final response = await http.post(
      Uri.parse(apiUrl+"add-project-elements/"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(assignedEngineer.toJson()),
    );

    if (response.statusCode == 201) {
      // Successful post, handle response if needed
      print('Element added successfully');
    } else {
      // Handle error
      throw Exception('Failed to add element');
    }
  }

Future<void> updateAssignedEngineer(AssignedEngineer assignedEngineer) async {

  final response = await http.put(
    Uri.parse('${apiUrl}update-project-elements/${assignedEngineer.id}/'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(assignedEngineer.toJson()),
  );
print(response.statusCode);
  if (response.statusCode == 200) {
    // Successful update, handle response if needed
    print('Element updated successfully');
  } else {
    // Handle error
    throw Exception('Failed to update element');
  }
}