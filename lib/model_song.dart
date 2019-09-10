class ModelSong {
  String title;
  String artist;
  String downloadURL;
  String image;
  int score;
  bool isFavorite;
  ModelSong({
    this.title,
    this.artist,
    this.downloadURL,
    this.image,
    this.score,
    this.isFavorite,
  });
  Map<String, dynamic> toJson() =>
    {
      'title': title,
      'artist': artist,
      'downloadURL': downloadURL,
      'image': image,
      'score': score,
      'isFavorite': isFavorite,
      
    };
}
