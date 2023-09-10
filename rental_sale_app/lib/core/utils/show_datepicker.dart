class CustomDatePicker {
  /* void showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  } */

  /* Future<DateTime?> show(BuildContext context) async {
    DateTime? year = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(9999),
      initialDate: DateTime.now(),
    );
    print(year);
    if (year == null) return null;
    return year;
  } */
}
