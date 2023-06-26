import 'package:event_fit/domain/datasources/publish_datasource.dart';
import 'package:event_fit/domain/repositories/publish_repository.dart';
import 'package:event_fit/infrastructure/models/publish.dart';

class PublishRepositoryImpl extends PublishRepository {
  final PublishDatasource datasource;

  PublishRepositoryImpl({required this.datasource});

  @override
  Future<Publish> createPublish({required Publish publish}) {
    return datasource.createPublish(publish: publish);
  }

  @override
  Future<Publish> readPublish({required Publish publish}) {
    return datasource.readPublish(publish: publish);
  }

  @override
  Future<Publish> readPublishById({required Publish publish}) {
    return datasource.readPublishById(publish: publish);
  }

  @override
  Future<Publish> readPublishByUserId({required Publish publish}) {
    return datasource.readPublishByUserId(publish: publish);
  }

  @override
  Future<Publish> removePublish({required Publish publish}) {
    return datasource.removePublish(publish: publish);
  }

  @override
  Future<Publish> updatePublish({required Publish publish}) {
    return datasource.updatePublish(publish: publish);
  }
}
