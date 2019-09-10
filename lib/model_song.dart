class ModelSong {
  int id;
  String title;
  String artist;
  String locatedURL;
  String downloadURL;
  String image;
  int score;
  bool isFavorite;
  ModelSong({
    this.id,
    this.title,
    this.artist,
    this.locatedURL,
    this.downloadURL,
    this.image,
    this.score,
    this.isFavorite,
  });
}