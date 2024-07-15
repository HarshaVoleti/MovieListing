import 'package:intl/intl.dart';

class Movie {
  final String id;
  final String title;
  final List<String> director;
  final List<String> writers;
  final List<String> stars;
  final String releasedDate;
  final List<String> productionCompany;
  final String language;
  final List<String> genre;
  final String poster;
  final int pageViews;
  final String description;
  final List<String> upVoted;
  final List<String> downVoted;
  final int totalVoted;
  final int voting;

  Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.writers,
    required this.stars,
    required this.releasedDate,
    required this.productionCompany,
    required this.language,
    required this.genre,
    required this.poster,
    required this.pageViews,
    required this.description,
    required this.upVoted,
    required this.downVoted,
    required this.totalVoted,
    required this.voting,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['_id'],
      title: json['title'],
      director: List<String>.from(json['director']),
      writers: List<String>.from(json['writers']),
      stars: List<String>.from(json['stars']),
      releasedDate: formattedReleasedDate(json['releasedDate']),
      productionCompany: List<String>.from(json['productionCompany']),
      language: json['language'],
      genre: List<String>.from(json['genre'].toString().split(',')),
      poster: json['poster'],
      pageViews: json['pageViews'],
      description: json['description'],
      upVoted:
          json['upVoted'] != null ? List<String>.from(json['upVoted']) : [],
      downVoted:
          json['downVoted'] != null ? List<String>.from(json['downVoted']) : [],
      totalVoted: json['totalVoted'],
      voting: json['voting'],
    );
  }
}

String formattedReleasedDate(int releasedDate) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(releasedDate * 1000);
  return DateFormat("d MMMM yyyy").format(dateTime);
}
