class ModelSong {
  String title;
  String artist;
  String downloadURL;
  String image;
  String lyrics;
  String category;
  int score;
  bool isFavorite;
  ModelSong({
    this.title,
    this.artist,
    this.downloadURL,
    this.category,
    this.image,
    this.score,
    this.lyrics,
    this.isFavorite,
  });
  Map<String, dynamic> toJson() => {
        'title': title,
        'artist': artist,
        'downloadURL': downloadURL,
        'category': category,
        'image': image,
        'score': score,
        'isFavorite': isFavorite,
      };
}
