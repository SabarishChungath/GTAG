import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:facebook_app_events/facebook_app_events.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Gtag flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final facebookAppEvents = FacebookAppEvents();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HOME_SCREEN',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  fillColor: Colors.green,
                  onPressed: () {
                    // FirebaseAnalytics _analytics = FirebaseAnalytics();
                    // _analytics.logAddToCart(
                    //     itemId: "121",
                    //     itemName: "SHAMBU",
                    //     itemCategory: "RIAFY_HQ",
                    //     quantity: 1,
                    //     currency: "AED");
                  },
                  child: Text('ADD_TO_CART',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  width: 20,
                ),
                RawMaterialButton(
                  fillColor: Colors.green,
                  onPressed: () {
                    facebookAppEvents.logEvent(
                      name: 'button_clicked',
                      parameters: {
                        'button_id': 'the_clickme_button',
                      },
                    );
                  },
                  child: Text('FACEBOOK',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
