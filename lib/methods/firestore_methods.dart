import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:true_false/main.dart';
import 'package:true_false/methods/google_signin.dart';

List<String> scores = [];
shuffle(List<String> items, List<bool> items2) {
  var random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    var temp2 = items2[i];
    items[i] = items[n];
    items2[i] = items2[n];
    items[n] = temp;
    items2[n] = temp2;
  }
  questions = items;
  ans = items2;
}

class MyFirebase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addUser(User user) async {
    CollectionReference users = firestore.collection("Users");
    try {
      users.doc(user.uid).set({
        "Name": user.displayName,
        "Uid": user.uid,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<String> getQuestion() async {
    CollectionReference fquestions = firestore.collection('Questions');
    String res = "success";
    questions.clear();
    ans.clear();
    await fquestions.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        questions.add(doc["question"]);
        ans.add(doc["ans"]);
      });
    });
    shuffle(questions, ans);
    int i = 0;
    questions.forEach((question) {
      print("$i $question");
      i = i + 1;
    });
    i = 0;
    ans.forEach((a) {
      print("$i $a");
      i = i + 1;
    });
    return res;
  }

  Future<void> AddScore(String score) async {
    CollectionReference games =
        firestore.collection("Users").doc(user!.uid).collection("Games");
    try {
      games.add({
        "game": score,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getScores() async {
    CollectionReference fgames =
        firestore.collection('Users').doc(user!.uid).collection("Games");
    String res = "success";
    scores.clear();
    await fgames.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        scores.add(doc["game"]);
      });
    });
    print(scores);
  }
}
