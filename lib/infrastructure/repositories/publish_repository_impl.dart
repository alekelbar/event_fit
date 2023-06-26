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
  Future<List<Publish>> readPublishes() {
    return datasource.readPublishes();
  }

  @override
  Future<Publish?> readPublishById({required String id}) {
    return datasource.readPublishById(id: id);
  }

  @override
  Future<List<Publish>> readPublishByUserId({required String userId}) {
    return datasource.readPublishByUserId(userId: userId);
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
