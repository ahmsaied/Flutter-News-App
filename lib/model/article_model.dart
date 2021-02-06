class Article {
  String author, title, description, url, urlToImage, content;
  DateTime publishedAt;

  Article(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Article.fromJson(Map<String, dynamic> parsedJson) {
    return Article(
        author: parsedJson['author'],
        title: parsedJson['title'],
        description: parsedJson['description'],
        url: parsedJson['url'],
        urlToImage: parsedJson['urlToImage'],
        publishedAt: DateTime.parse(parsedJson['publishedAt']),
        content: parsedJson['content']);
  }
}
