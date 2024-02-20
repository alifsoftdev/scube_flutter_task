import 'package:meta/meta.dart';
import 'dart:convert';

class AssignedEngineer {
  int? id;
  DateTime startDate;
  DateTime endDate;
  int startDayOfYear;
  int endDayOfYear;
  String projectName;
  String projectUpdate;
  String assignedEngineer;
  String assignedTechnician;
  int duration;

  AssignedEngineer({
    this.id,
    required this.startDate,
    required this.endDate,
    required this.startDayOfYear,
    required this.endDayOfYear,
    required this.projectName,
    required this.projectUpdate,
    required this.assignedEngineer,
    required this.assignedTechnician,
    required this.duration,
  });

  factory AssignedEngineer.fromRawJson(String str) => AssignedEngineer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssignedEngineer.fromJson(Map<String, dynamic> json) => AssignedEngineer(
    id: json["id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    startDayOfYear: json["start_day_of_year"],
    endDayOfYear: json["end_day_of_year"],
    projectName: json["project_name"],
    projectUpdate: json["project_update"],
    assignedEngineer: json["assigned_engineer"],
    assignedTechnician: json["assigned_technician"],
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "start_day_of_year": startDayOfYear,
    "end_day_of_year": endDayOfYear,
    "project_name": projectName,
    "project_update": projectUpdate,
    "assigned_engineer": assignedEngineer,
    "assigned_technician": assignedTechnician,
    "duration": duration,
  };
}
