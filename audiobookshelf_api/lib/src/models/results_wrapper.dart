class ResultsWrapper<T> {
  ResultsWrapper({this.results = const []});
  List<T> results;

  factory ResultsWrapper.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return ResultsWrapper(
      results: (json['results'] as List<dynamic>)
          .map<T>((e) => fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
