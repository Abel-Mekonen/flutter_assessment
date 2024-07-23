String formatDate(DateTime dateTime) {
  const List<String> monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  String month = monthNames[dateTime.month - 1];
  String day = dateTime.day.toString();
  String year = dateTime.year.toString();

  return '$month $day, $year';
}