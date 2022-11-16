import 'package:kalahok_mobile/app/data/models/survey_model.dart';
import 'package:kalahok_mobile/app/data/testData/questions.dart';

final unifastSurvey = Future(
  () => Survey(
    id: 1,
    title: 'Active Unifast Survey',
    description: '',
    answeredCount: 0,
    completionEstimatedTime: '',
    status: true,
    multipleSubmission: false,
    startDate: '',
    endDate: '',
    addedAt: '',
    updatedAt: '',
    questionnaires: unifastQuestions,
  ),
);

final drrmoSurvey = Future(
  () => Survey(
    id: 2,
    title: 'Active DRRMO Survey',
    description: '',
    answeredCount: 0,
    completionEstimatedTime: '',
    status: true,
    multipleSubmission: false,
    startDate: '',
    endDate: '',
    addedAt: '',
    updatedAt: '',
    questionnaires: drrmoQuestions,
  ),
);
