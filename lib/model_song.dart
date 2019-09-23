class ModelSong {
  String title;
  String artist;
  String downloadURL;
  String imageURL;
  String length;
  String image;
  String lyrics;
  String category;
  int score;
  bool isFavorite;
  ModelSong({
    this.title,
    this.artist,
    this.downloadURL,
    this.imageURL,
    this.length,
    this.image,
    this.lyrics,
    this.score,
    this.category,
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
