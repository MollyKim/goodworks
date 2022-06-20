import 'package:timeago/timeago.dart' as timeago;

getTimeAge(String? feedTime) {
  final now = DateTime.now();
  if (feedTime == null) feedTime = DateTime.now().toString();

  DateTime feedTimeDatetime = DateTime.parse(feedTime);
  final difference = now.difference(feedTimeDatetime);
  return timeago.format(now.subtract(difference), locale: 'ko');
}