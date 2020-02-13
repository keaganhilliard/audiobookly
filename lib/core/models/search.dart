class Search {
  final List<SearchResult> results = [];

  Future<List<SearchResult>> query(String query) async {
    print(query);
    if (query.toUpperCase() == 'STEVEN') {
      results.clear();
      results.add(SearchResult(
          title: 'Gardens of the Moon', subTitle: 'Steven Eriksen'));
      results.add(
          SearchResult(title: 'Wolves of the Calla', subTitle: 'Steven King'));
    } else {
      results.clear();
    }
    await Future.delayed(Duration(seconds: 2));
    return results;
  }
}

class SearchResult {
  String title;
  String subTitle;

  SearchResult({this.title, this.subTitle});
}
