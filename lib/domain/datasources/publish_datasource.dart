import 'package:event_fit/infrastructure/models/publish.dart';

abstract class PublishDatasource {
  // C
  Future<Publish> createPublish({required Publish publish});
  // R
  Future<List<Publish>> readPublishes();
  Future<Publish?> readPublishById({required String id});
  Future<List<Publish>> readPublishByUserId({required String userId});
  // U
  Future<Publish> updatePublish({required Publish publish});
  // D
  Future<Publish> removePublish({required Publish publish});
}
