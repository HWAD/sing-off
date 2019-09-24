class ModelSong {
  String id;
  String title;
  String artist;
  String downloadURL;
  String imageURL;
  String length;
  String lyrics;
  String category;
  int score;
  bool isFavorite;
  ModelSong({
    this.id,
    this.title,
    this.artist,
    this.downloadURL,
    this.imageURL,
    this.length,
    this.lyrics,
    this.score,
    this.category,
    this.isFavorite,
    
  });
  Map<String, dynamic> toJson() => {
        'title': title,
        'artist': artist,
        'downloadURL': downloadURL,
        'imageURL': imageURL,
        'category': category,
        'score': score,
        'isFavorite': isFavorite,
      };
}
