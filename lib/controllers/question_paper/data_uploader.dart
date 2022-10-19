import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_app/firebase_ref/loading_status.dart';
import 'package:edu_app/firebase_ref/references.dart';
import 'package:edu_app/models/question_paper_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
  final loadingStatus = LoadingStatus.loading.obs;
  void uploadData() async {
    loadingStatus.value = LoadingStatus.loading;
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") && path.contains(".json"))
        .toList();
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInAssets) {
      var stringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    var batch = fireStore.batch();
    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "question_count": paper.questions == null ? 0 : paper.questions!.length
      });
      for(var questions in  paper.questions!){
        var questionPath = questionRF(paperID: paper.id, questionID: questions.id!);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });
        for(var answer in questions.answers!){
          batch.set(questionPath.collection('answers').doc(answer.identifier),
          {
            "identifier":answer.identifier,
            "answer": answer.answer
          });
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
