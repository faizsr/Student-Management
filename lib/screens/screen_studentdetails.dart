import 'package:flutter/material.dart';
// import 'package:student_management/db/db_function.dart';
// import 'package:student_management/model/model.dart';

class ScreenDetails extends StatefulWidget {
  final int? studentId;
  final String? studentName;
  final String? studentRollno;
  final String? studentDepartment;
  final String? studentPhonenumber;
  final String? studentProfilephoto;
  final bool? update;

  ScreenDetails({
    this.studentId,
    this.studentName,
    this.studentRollno,
    this.studentDepartment,
    this.studentPhonenumber,
    this.studentProfilephoto,
    this.update,
  });

  @override
  State<ScreenDetails> createState() => _ScreenDetailsState();
}

class _ScreenDetailsState extends State<ScreenDetails> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: widget.studentName);
    // final rollnoController = TextEditingController(text: widget.studentRollno);
    // final departController =
    //     TextEditingController(text: widget.studentDepartment);
    // final phoneController =
    //     TextEditingController(text: widget.studentPhonenumber);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Student Detail'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nameController.text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ],
      )),
    );
  }
}
