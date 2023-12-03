extension DateTimeExtension on DateTime {
  DateTime toToday() => DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );
}
