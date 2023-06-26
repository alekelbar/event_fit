import 'package:event_fit/infrastructure/models/publish.dart';

abstract class PublishDatasource {
  // C
  Publish createPublish({required Publish publish});
  // R
  Publish readPublish({required Publish publish});
  Publish readPublishById({required Publish publish});
  Publish readPublishByUserId({required Publish publish});
  // U
  Publish updatePublish({required Publish publish});
  // D
  Publish removePublish({required Publish publish});
}
