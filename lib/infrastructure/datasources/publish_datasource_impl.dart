import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_fit/domain/datasources/publish_datasource.dart';
import 'package:event_fit/infrastructure/models/publish.dart';

class PublishDatasourceImpl extends PublishDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Publish> createPublish({required Publish publish}) async {
    await _firestore.collection("publishes").doc().set(publish.getMapper());
    return publish;
  }

  @override
  Future<Publish> readPublish({required Publish publish}) async {
    // TODO: implement readPublish
    throw UnimplementedError();
  }

  @override
  Future<Publish> readPublishById({required Publish publish}) async {
    // TODO: implement readPublishById
    throw UnimplementedError();
  }

  @override
  Future<Publish> readPublishByUserId({required Publish publish}) async {
    // TODO: implement readPublishByUserId
    throw UnimplementedError();
  }

  @override
  Future<Publish> removePublish({required Publish publish}) async {
    // TODO: implement removePublish
    throw UnimplementedError();
  }

  @override
  Future<Publish> updatePublish({required Publish publish}) async {
    // TODO: implement updatePublish
    throw UnimplementedError();
  }
}
