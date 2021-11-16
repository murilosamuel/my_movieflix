import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';

abstract class BaseApi {
  String get baseUrl {
    return 'api_key=${ApiProperties.apiKey}&language=${ApiProperties.language}&include_adult=${ApiProperties.includeAdultContent}';
  }
}