class PersonDetails {
  int pageId;
  String title;
  String thumbnailImage;
  String pageExtract;

  PersonDetails({
    this.pageId,
    this.title,
    this.thumbnailImage,
    this.pageExtract,
  });

  factory PersonDetails.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> pageList = json['query']['pages'];
    Map<String, dynamic> page = pageList.values.first;
    return PersonDetails(
      pageId: page['pageid'],
      title: page['title'],
      thumbnailImage: page['thumbnail']['source'],
      pageExtract: page['extract'],
    );
  }
}
