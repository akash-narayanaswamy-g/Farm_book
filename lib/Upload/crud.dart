import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CrudMethods {
  Future<void> addData(postData) async {
    FirebaseFirestore.instance
        .collection("posts")
        .add(postData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addProject(postData) async {
    FirebaseFirestore.instance
        .collection("projects")
        .add(postData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance
        .collection("posts")
        .orderBy('index', descending: true)
        .snapshots();
  }

  deletepost(String index) async {
    return await FirebaseFirestore.instance
        .collection("posts")
        .where("index", isEqualTo: index)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("posts")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Success!");
        });
      });
    });
  }

  deleteimage(String imageUrl) async {
    String filePath = imageUrl.replaceAll(
        new RegExp(
            r'https://firebasestorage.googleapis.com/v0/b/farm-book-d1ac5.appspot.com/o/'),
        '');
    filePath = filePath.replaceAll(new RegExp(r'%2F'), '/');
    filePath = filePath.replaceAll(new RegExp(r'(\?alt).*'), '');
    Reference storageReferance = FirebaseStorage.instance.ref();
    storageReferance
        .child(filePath)
        .delete()
        .then((_) => print('Successfully deleted $filePath storage item'));
  }

  Future<void> addTeam(teamData) async {
    FirebaseFirestore.instance.collection("team").add(teamData).catchError((e) {
      print(e);
    });
  }

  Future<void> updateTeam(String teamIndex, var teamData) async {
    return await FirebaseFirestore.instance
        .collection("team")
        .where("index", isEqualTo: teamIndex)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("team")
            .doc(element.id)
            .update(teamData)
            .then((value) {
          print("Success!");
        });
      });
    });
  }

  getTeam() async {
    return await FirebaseFirestore.instance
        .collection("team")
        .orderBy('index', descending: true)
        .snapshots();
  }

  deleteTeam(String index) async {
    return await FirebaseFirestore.instance
        .collection("team")
        .where("index", isEqualTo: index)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("team")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Success!");
        });
      });
    });
  }

  getProjects() async {
    return await FirebaseFirestore.instance
        .collection("projects")
        .orderBy('index', descending: true)
        .snapshots();
  }

  deleteProject(String index) async {
    return await FirebaseFirestore.instance
        .collection("projects")
        .where("index", isEqualTo: index)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("projects")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Success!");
        });
      });
    });
  }

  Future<void> updateEventResult(String postIndex, String report) async {
    return await FirebaseFirestore.instance
        .collection("posts")
        .where("index", isEqualTo: postIndex)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("posts")
            .doc(element.id)
            .update({'eventresult': report}).then((value) {
          print("Success!");
        });
      });
    });
  }

  Future<void> updateEventGallery(String postIndex, var gallery) async {
    return await FirebaseFirestore.instance
        .collection("posts")
        .where("index", isEqualTo: postIndex)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("posts")
            .doc(element.id)
            .update({'gallery': gallery}).then((value) {
          print("Success!");
        });
      });
    });
  }
}
