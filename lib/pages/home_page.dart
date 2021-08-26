import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/retry.dart';
import 'package:myapp/models/url_response_model.dart';
import 'package:myapp/network/network_calls.dart';
import 'package:myapp/widgets/our_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutter json App",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(25),
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: FutureBuilder<UrlApi>(
              future: NetworkClass().callUrlData(),
              builder: (context, snapshot) {
                UrlApi? urlApi = snapshot.data;

                if (snapshot.hasData) {
                  // Testing responses
                  print(urlApi!.page);
                  print(urlApi.data[1].avatar);
                  print(urlApi.perPage);
                  print(urlApi.totalPages);
                  print(urlApi.total);
                  // Done testing
                  return ListView.builder(
                      itemCount: urlApi.data.length,
                      itemBuilder: (context, index) {
                        return OurListTile(
                          imageUrl: urlApi.data[index].avatar!,
                          firstName: urlApi.data[index].firstName!,
                          lastName: urlApi.data[index].lastName!,
                          email: urlApi.data[index].email!,
                        );
                      });
                }
                return Center(child: CircularProgressIndicator());
              }),
        ));
  }
}
