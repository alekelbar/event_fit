import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_fit/domain/datasources/publish_datasource.dart';
import 'package:event_fit/infrastructure/models/publish.dart';

class PublishDatasourceImpl extends PublishDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Publish> createPublish({required Publish publish}) async {
    final docRef =
        await _firestore.collection("publishes").add(publish.getMapper());
    // Actualizar el objeto
    final updatedPublish = publish.copyWith(id: docRef.id);
    // actualizar en firebase
    await docRef.set(updatedPublish.getMapper());

    return updatedPublish;
  }

  @override
  Future<List<Publish>> readPublishes() async {
    final querySnap = await _firestore.collection("publishes").get();
    return querySnap.docs.map((doc) {
      final data = doc.data();
      return Publish.fromJson(data);
    }).toList();
  }

  @override
  Future<Publish?> readPublishById({required String id}) async {
    final querySnap = await _firestore.collection("publishes").doc(id).get();
    if (!querySnap.exists) {
      return null;
    }

    final data = querySnap.data();
    return Publish.fromJson(data!);
  }

  @override
  Future<List<Publish>> readPublishByUserId({required String userId}) async {
    final querySnap = await _firestore
        .collection("publishes")
        .where("userId", isEqualTo: userId)
        .get();

    return querySnap.docs.map((doc) {
      final data = doc.data();
      print(data);
      return Publish.fromJson(data);
    }).toList();
  }

  @override
  Future<Publish?> removePublish({required String id}) async {
    final docRef = _firestore.collection("publishes").doc(id);

    final querySnap = await docRef.get();

    // verificar que exista la publicación
    if (!querySnap.exists) {
      return null;
    }

    docRef.delete();
    print(querySnap.data());
    return Publish.fromJson(querySnap.data()!);
  }

  @override
  Future<Publish> updatePublish({required Publish publish}) async {
    // TODO: implement updatePublish
    throw UnimplementedError();
  }
}
