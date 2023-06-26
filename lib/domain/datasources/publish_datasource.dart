import 'package:event_fit/infrastructure/models/publish.dart';

abstract class PublishDatasource {
  // C
  Future<Publish> createPublish({required Publish publish});
  // R
  Future<Publish> readPublish({required Publish publish});
  Future<Publish> readPublishById({required Publish publish});
  Future<Publish> readPublishByUserId({required Publish publish});
  // U
  Future<Publish> updatePublish({required Publish publish});
  // D
  Future<Publish> removePublish({required Publish publish});
}
