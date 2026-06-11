library firebase_stubs;

import 'dart:async';

class FirebaseAuth {
  FirebaseAuthUser? get currentUser => null;
  Stream<FirebaseAuthUser?> authStateChanges() =>
      const Stream.empty();
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      UserCredential(user: FirebaseAuthUser(uid: ''));
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {}
  Future<void> signOut() async {}
}

class UserCredential {
  final FirebaseAuthUser? user;
  UserCredential({this.user});
}

class FirebaseAuthUser {
  final String uid;
  FirebaseAuthUser({required this.uid});
}

class FirebaseStorage {
  Reference ref() => Reference();
}

class Reference {
  Reference child(String path) => this;
  UploadTask putFile(dynamic file) => UploadTask();
  Future<String> getDownloadURL() async => '';
}

class UploadTask {
  Future<TaskSnapshot> get whenComplete =>
      Future.value(TaskSnapshot());
}

class TaskSnapshot {
  Reference get ref => Reference();
}

class FirebaseFirestore {
  CollectionReference collection(String path) =>
      CollectionReference();
}

class Query {
  Future<QuerySnapshot> get() async => QuerySnapshot();
  Stream<QuerySnapshot> snapshots() => const Stream.empty();
}

class CollectionReference {
  DocumentReference doc([String? id]) => DocumentReference();
  Query where(String field,
          {dynamic isEqualTo, dynamic isGreaterThanOrEqualTo}) =>
      Query();
  Future<QuerySnapshot> get() async => QuerySnapshot();
  Stream<QuerySnapshot> snapshots() => const Stream.empty();
}

class DocumentReference {
  Future<DocumentSnapshot> get() async => DocumentSnapshot();
  Future<void> set(Map<String, dynamic> data) async {}
  Future<void> update(Map<String, dynamic> data) async {}
  Future<void> delete() async {}
  CollectionReference collection(String path) =>
      CollectionReference();
}

class DocumentSnapshot {
  bool get exists => false;
  Map<String, dynamic>? data() => null;
}

class QuerySnapshot {
  List<QueryDocumentSnapshot> get docs => [];
}

class QueryDocumentSnapshot extends DocumentSnapshot {
  @override
  Map<String, dynamic> data() => <String, dynamic>{};
}

class FieldValue {
  static FieldValue arrayUnion(List<dynamic> elements) =>
      FieldValue();
  static FieldValue arrayRemove(List<dynamic> elements) =>
      FieldValue();
}

class VideoCompress {
  static Future<dynamic> compressVideo(String path,
          {dynamic quality}) async =>
      null;
  static Future<dynamic> getFileThumbnail(String path) async =>
      null;
}

class VideoQuality {
  // ignore: non_constant_identifier_names
  static final MediumQuality = VideoQuality();
}

final FirebaseAuth firebaseAuth = FirebaseAuth();
final FirebaseFirestore firestore = FirebaseFirestore();
final FirebaseStorage firebaseStorage = FirebaseStorage();
