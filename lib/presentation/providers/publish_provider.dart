import 'package:event_fit/domain/repositories/publish_repository.dart';
import 'package:event_fit/infrastructure/models/publish.dart';
import 'package:flutter/foundation.dart';

class PublishProvider extends ChangeNotifier {
  final PublishRepository repository;

  PublishProvider({required this.repository});

  Future<List<Publish>> getAllPublishes() async {
    return await repository.readPublishes();
  }

  Future<Publish?> getPublishById(String id) async {
    return await repository.readPublishById(id: id);
  }

  Future<List<Publish>> getPublishByUser(String id) async {
    return await repository.readPublishByUserId(userId: id);
  }

  Future<Publish> createPublish(Publish publish) async {
    return repository.createPublish(publish: publish);
  }

  Future<Publish?> removePublishById(String id) async {
    return repository.removePublish(id: id);
  }

  Future<Publish?> updatePublish(Publish publish) async {
    return repository.updatePublish(publish: publish);
  }
}
