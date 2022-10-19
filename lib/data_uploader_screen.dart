import 'package:edu_app/controllers/question_paper/data_uploader.dart';
import 'package:edu_app/firebase_ref/loading_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Obx(() => Text(controller.loadingStatus.value==LoadingStatus.completed?"Uploading completed":"Uploading...")),
      ),
    );
  }
}
