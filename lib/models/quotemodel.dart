class Quotemodel {
  String? id;
  String? author;
  String? quote;

  static List star = [];

  Quotemodel({required this.author, required this.quote, this.id});

  factory Quotemodel.fromjson(Map<String, dynamic> data) {
    return Quotemodel(
        author: data['author'],
        quote: data['quote'],
        id: data['id'].toString());
  }
}
