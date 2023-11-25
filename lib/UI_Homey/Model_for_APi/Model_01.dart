class TvShow {
  final int id;
  final String name;
  final String summary;
  final String imageUrl;

  TvShow({
    required this.id,
    required this.name,
    required this.summary,
    required this.imageUrl,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) {
    // Check if the 'image' field is not null
    final image = json['show']['image'];
    return TvShow(
      id: json['show']['id'],
      name: json['show']['name'],
      summary: json['show']['summary'],
      // Use a default image URL if 'image' is null
      imageUrl: image != null ? image['medium'] : 'https://example.com/default_image.jpg',
    );
  }
}
