
class Article {
  String subject;
  String content;
  DateTime createAt;

  Article(this.subject, this.content, this.createAt);

  @override
  String toString() {
    return 'Article{subject: $subject, content: $content, createAt: $createAt}';
  }

}