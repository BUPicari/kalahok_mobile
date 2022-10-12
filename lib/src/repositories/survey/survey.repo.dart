import 'package:kalahok_mobile/src/models/survey.model.dart';
import 'package:sqflite/sqlite_api.dart';

class SurveyRepository {
  Future<List<Survey>> getSurveys({
    required Database database,
  }) async {
    final data = await database.rawQuery('SELECT * FROM survey');
    List<Survey> surveys = [];
    for (var item in data) {
      surveys.add(Survey(item['id'] as int, item['title'] as String));
    }
    return surveys;
  }

  Future<dynamic> addSurvey({
    required Database database,
    required String title,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawInsert("INSERT INTO survey (title) VALUES ('$title')");
    });
  }

  Future<dynamic> removeSurvey({
    required Database database,
    required int id,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM survey where id = $id');
    });
  }
}
