import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';

class OutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final bool busy;

  const OutlinedButton({
    Key key,
    this.onPressed,
    this.label,
    this.busy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: onPressed != null
              ? SchoolToolkitColors.blue
              : SchoolToolkitColors.light_grey,
          width: ScreenUtil().setWidth(1.5),
        ),
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(5.0),
        ),
      ),
      disabledColor: Colors.white,
      color: Colors.white,
      textColor: SchoolToolkitColors.blue,
      disabledTextColor: SchoolToolkitColors.grey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setWidth(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '$label',
              style: TextStyle(
                fontSize: FontSize.fontSize16,
                fontWeight: FontSize.semiBold,
              ),
            ),
            if (busy) ...[
              SizedBox(
                width: ScreenUtil().setWidth(10),
              ),
              Theme(
                data: ThemeData(
                  accentColor: SchoolToolkitColors.blue,
                ),
                child: Container(
                  height: ScreenUtil().setWidth(15),
                  width: ScreenUtil().setWidth(15),
                  child: CircularProgressIndicator(),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
