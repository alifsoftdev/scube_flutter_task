import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_flutter_task/service/services.dart';
import 'package:scube_flutter_task/view/projects.dart';

import '../model/model.dart';

class ProjectUpdateView extends StatefulWidget {
  final AssignedEngineer assignedEngineer;
  const ProjectUpdateView({
    super.key,
    required this.assignedEngineer,
  });

  @override
  State<ProjectUpdateView> createState() => _ProjectUpdateViewState();
}

class _ProjectUpdateViewState extends State<ProjectUpdateView> {
  late TextEditingController projectNameController;
  late TextEditingController assignedEngineerController;
  late TextEditingController assignedTechnicianController;
  late TextEditingController projectUpdateController;
  late TextEditingController projectStartController;
  late TextEditingController projectEndController;
  late TextEditingController projectDurationController;
  late TextEditingController projectStartOfYearController;
  late TextEditingController projectEndOfYearController;

  late Future<List<AssignedEngineer>> assignedEngineer;

  @override
  void initState() {
    super.initState();
    projectNameController =
        TextEditingController(text: widget.assignedEngineer.projectName ?? "");
    assignedEngineerController = TextEditingController(
        text: widget.assignedEngineer.assignedEngineer ?? "");
    assignedTechnicianController = TextEditingController(
        text: widget.assignedEngineer.assignedTechnician ?? "");
    projectUpdateController = TextEditingController(
        text: widget.assignedEngineer.projectUpdate ?? "");
    projectStartController = TextEditingController(
        text: widget.assignedEngineer.startDate.toString() ?? "");
    projectEndController = TextEditingController(
        text: widget.assignedEngineer.endDate.toString() ?? "");
    projectStartOfYearController = TextEditingController(
        text: widget.assignedEngineer.startDayOfYear.toString() ?? "");
    projectEndOfYearController = TextEditingController(
        text: widget.assignedEngineer.endDayOfYear.toString() ?? "");
    projectDurationController = TextEditingController(
        text: widget.assignedEngineer.duration.toString() ?? "");
    _streamController = StreamController<List<AssignedEngineer>>.broadcast();
    _assignedEngineers = [];
    _fetchData();
  }


  /// Get Data
  late StreamController<List<AssignedEngineer>> _streamController;
  late List<AssignedEngineer> _assignedEngineers;


  Future<void> _fetchData() async {
    final data = await getAllAssignedEngineers();
    _streamController.add(data);
    setState(() {
      _assignedEngineers = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Update"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Project Name",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextField(
                    controller: projectNameController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      hintText: "Project name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Assigned Engineer",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextField(
                    controller: assignedEngineerController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      hintText: "Assigned Engineer",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Assigned Technician",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextField(
                    controller: assignedTechnicianController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      hintText: "Assigned Technician",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Project Update",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextField(
                    controller: projectUpdateController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      hintText: "Project Update",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Start Day Of Year",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextField(
                    controller: projectStartOfYearController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      hintText: "Enter Start Day Of Year",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "End Day Of Year",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextField(
                    controller: projectEndOfYearController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      hintText: "Enter End Day Of Year",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Duration",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextField(
                    controller: projectDurationController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      hintText: "Enetr duration",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.greenAccent)),
                onPressed: () {
                  final updatedAssignedEngineer = AssignedEngineer(
                      id: widget.assignedEngineer.id,
                      startDate: DateTime.now(),
                      endDate: DateTime.now().add(const Duration(days: 20)),
                      startDayOfYear: int.parse(projectStartOfYearController.text),
                      endDayOfYear: int.parse(projectEndOfYearController.text),
                      projectName: projectNameController.text,
                      projectUpdate: projectUpdateController.text,
                      assignedEngineer: assignedEngineerController.text,
                      assignedTechnician: assignedTechnicianController.text,
                      duration: int.parse(projectDurationController.text));
                  updateAssignedEngineer(updatedAssignedEngineer);
                  _fetchData();
                  print("Project Updated Successfull");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectView(),));

                },
                child: const Text(
                  "Update",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
