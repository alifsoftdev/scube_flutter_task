import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_flutter_task/view/project_update_view.dart';

import '../model/model.dart';
import '../service/services.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({super.key});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController engineerController = TextEditingController();
  TextEditingController technicianController = TextEditingController();
  TextEditingController projectUpdateController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project's"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<AssignedEngineer>>(
        future: getAllAssignedEngineers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<AssignedEngineer> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project Name : ${data[index].projectName}",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w600),
                          ),
                          Text("Project Id : ${data[index].id}"),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Details",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                          ),
                          const Divider(),
                          Text(
                            "Assigned Engineer : ${data[index].assignedEngineer}",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "Assigned Technician : ${data[index].assignedTechnician}",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "Project Update : ${data[index].projectUpdate}",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "Start Date : ${data[index].startDate}",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "End Date : ${data[index].endDate}",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                              child: IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectUpdateView(assignedEngineer: data[index]),));
                              }, icon: Icon(Icons.edit_outlined))),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: SizedBox(
        width:111.w,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0)),
              ),
              context: context, builder: (context) =>
             Padding(
               padding: EdgeInsets.only(
                   top: 20.h,
                   left: 15.w,
                   right: 15.w,
                   bottom: MediaQuery.of(context).viewInsets.bottom),
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
                           controller: nameController,
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
                           controller: engineerController,
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
                           controller: technicianController,
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
                           controller: startTimeController,
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
                           controller: endTimeController,
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
                           controller: durationController,
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
                         SizedBox(height: 20.h)
                       ],
                     ),

                     ElevatedButton(
                       style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.greenAccent)),
                       onPressed: () {
                         final newAssignedEngineer = AssignedEngineer(
                           startDate: DateTime.now(),
                           endDate: DateTime.now().add(const Duration(days: 20)),
                           startDayOfYear: int.parse(startTimeController.text),
                           endDayOfYear: int.parse(endTimeController.text),
                           projectName: nameController.text,
                           projectUpdate: projectUpdateController.text,
                           assignedEngineer: engineerController.text,
                           assignedTechnician: technicianController.text,
                           duration: int.parse(durationController.text),
                         );
                         addAssignedEngineer(newAssignedEngineer);
                         Navigator.of(context).pop();
                         print("Project Added Successfull");
                       },
                       child: const Text("Submit",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                       ),
                     ),
                     SizedBox(height: 20),
                   ],
                 ),
               ),
             ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("Add Project",style: TextStyle(color: Colors.black)),
                Icon(Icons.add),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
