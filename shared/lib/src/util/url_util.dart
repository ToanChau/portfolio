import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlUtil {
  String get baseUrl => dotenv.env['BASE_URL']!;
  final List<String> _paths = [];
  final Map<String, String> _queryParams = {};

  UrlUtil();

  UrlUtil addPath(String path) {
    _paths.add(path);
    return this;
  }

  UrlUtil addQueryParam(String key, String value) {
    _queryParams[key] = value;
    return this;
  }

  UrlUtil addQueryParams(Map<String, String> params) {
    _queryParams.addAll(params);
    return this;
  }

  String build() {
    final pathSegment = _paths.isNotEmpty ? _paths.join('/') : '';
    final url = baseUrl.endsWith('/')
        ? '$baseUrl$pathSegment'
        : '$baseUrl/${pathSegment.isEmpty ? '' : pathSegment}';

    if (_queryParams.isEmpty) {
      return url;
    }

    final queryString = _queryParams.entries
        .map((entry) =>
            '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
        .join('&');

    return '$url?$queryString';
  }

  String combineHostWithResource(String? resourceUrl) {
    return baseUrl.replaceAll('/api', '') + (resourceUrl ?? "");
  }
}
