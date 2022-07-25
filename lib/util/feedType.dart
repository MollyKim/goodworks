
String getFeedType(int? feedType) {
  switch(feedType) {
    case 1:
      return "커뮤니티";
    case 2:
      return "전체 공지";
    case 3:
      return "교회 소식";
    case 4:
      return "주보";
    default:
      return "교회 소식";
  }
}