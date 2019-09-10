class ModelSong {
  String title;
  String artist;
  String downloadURL;
  String image;
  String lyrics;
  int score;
  bool isFavorite;
  ModelSong({
    this.title,
    this.artist,
    this.downloadURL,
    this.image,
    this.score,
    this.lyrics,
    this.isFavorite,
  });
<<<<<<< HEAD
=======
  Map<String, dynamic> toJson() =>
    {
      'title': title,
      'artist': artist,
      'downloadURL': downloadURL,
      'image': image,
      'score': score,
      'isFavorite': isFavorite,
      
    };
>>>>>>> b6039b5d81536b5bdd4c5d8dcbd890940f1bd6fe
}
