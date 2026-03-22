enum SearchCategory { dart, flutter, interview, guide }

class SearchResult {
  final String title;
  final String preview;
  final String route;
  final SearchCategory category;
  final String matchedKeyword;

  const SearchResult({
    required this.title,
    required this.preview,
    required this.route,
    required this.category,
    required this.matchedKeyword,
  });
}
