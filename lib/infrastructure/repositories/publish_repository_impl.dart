import 'package:event_fit/domain/datasources/publish_datasource.dart';
import 'package:event_fit/domain/repositories/publish_repository.dart';
import 'package:event_fit/infrastructure/models/publish.dart';

class PublishRepositoryImpl extends PublishRepository {
  final PublishDatasource datasource;

  PublishRepositoryImpl({required this.datasource});

  @override
  Publish createPublish({required Publish publish}) {
    return datasource.createPublish(publish: publish);
  }

  @override
  Publish readPublish({required Publish publish}) {
    return datasource.readPublish(publish: publish);
  }

  @override
  Publish readPublishById({required Publish publish}) {
    return datasource.readPublishById(publish: publish);
  }

  @override
  Publish readPublishByUserId({required Publish publish}) {
    return datasource.readPublishByUserId(publish: publish);
  }

  @override
  Publish removePublish({required Publish publish}) {
    return datasource.removePublish(publish: publish);
  }

  @override
  Publish updatePublish({required Publish publish}) {
    return datasource.updatePublish(publish: publish);
  }
}
