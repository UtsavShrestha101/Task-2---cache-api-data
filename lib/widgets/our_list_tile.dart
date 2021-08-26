import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OurListTile extends StatelessWidget {
  final String imageUrl;
  final String firstName;
  final String lastName;
  final String email;
  const OurListTile(
      {Key? key,
      required this.imageUrl,
      required this.firstName,
      required this.lastName,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setSp(40),
              ),
              child: CachedNetworkImage(
                height: ScreenUtil().setSp(100),
                width: ScreenUtil().setSp(100),
                imageUrl: imageUrl,
                placeholder: (context, url) => Image.asset(
                  "images/placeholder.png",
                  height: ScreenUtil().setSp(100),
                  width: ScreenUtil().setSp(100),
                ),
              )),
          SizedBox(
            width: ScreenUtil().setSp(40),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$firstName $lastName",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
