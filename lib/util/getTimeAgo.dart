import 'package:timeago/timeago.dart' as timeago;

getTimeAge(String? feedTime) {
  final now = DateTime.now();
  if (feedTime == null) feedTime = DateTime.now().toString();

  DateTime feedTimeDatetime = DateTime.parse(feedTime);

  final difference = now.difference(feedTimeDatetime);

  print('phil');
  print(feedTimeDatetime);
  print(difference);
  print(difference.inMinutes);

  if (difference.inMinutes < 1) {
    return "${difference.inSeconds}초 전";
  }

  return timeago.format(now.subtract(difference), locale: 'ko');

  // return timeago.format(now.subtract(difference), locale: 'ko');
}
