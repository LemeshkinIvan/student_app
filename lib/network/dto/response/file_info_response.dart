class FileResponse{
  final int id;
  final String name;
  final String extension;
  final bool? isFavourite;
  final String author;
  final String createdAt;

  const FileResponse(
    this.id,
    this.name,
    this.createdAt,
    this.isFavourite,
    this.author,
    this.extension);
}