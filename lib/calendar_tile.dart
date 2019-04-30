import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';

class CalendarTile extends StatelessWidget {
  final VoidCallback onDateSelected;
  final DateTime date;
  final String dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final TextStyle dayOfWeekStyles;
  final TextStyle dateStyles;
  final Widget child;
  final Color selectedTextColor;

  CalendarTile({
    this.onDateSelected,
    this.date,
    this.child,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyles,
    this.isDayOfWeek: false,
    this.isSelected: false,
    this.selectedTextColor = Colors.white,
  });

  Widget renderDateOrDayOfWeek(BuildContext context) {
    if (isDayOfWeek) {
      return new Container(
        alignment: Alignment.center,
        child: new Text(
          dayOfWeek,
          style: dayOfWeekStyles,
        ),
        padding: EdgeInsets.only(
          top: 15.0,
          left: 15.0,
          right: 15.0,
        ),
      );
    }

    return new InkWell(
      onTap: onDateSelected,
      child: new Container(
        decoration: isSelected
            ? new BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              )
            : new BoxDecoration(),
        alignment: Alignment.center,
        child: new Text(
          Utils.formatDay(date).toString(),
          style: isSelected
              ? Theme.of(context).primaryTextTheme.body1.copyWith(
                    color: selectedTextColor,
                  )
              : dateStyles,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return new InkWell(
        child: child,
        onTap: onDateSelected,
      );
    }
    return new Container(
      child: renderDateOrDayOfWeek(context),
    );
  }
}
