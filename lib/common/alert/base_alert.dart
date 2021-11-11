import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class BaseAlert extends StatefulWidget {
  const BaseAlert({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BaseAlertState();
}

class BaseAlertState extends State<BaseAlert> {
  Widget? alertWidget;
  bool showBlur = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GFColors.DARK,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            color: GFColors.SUCCESS,
          ),
        ),
        title: const Text(
          'Animation',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: GFFloatingWidget(
        verticalPosition: 150,
        showBlurness: showBlur,
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          color: Colors.transparent,
          child: Center(
            child: GFButton(
              text: 'Tap to View',
              onPressed: () {
                setState(() {
                  showBlur = true;
                  alertWidget = GFAlert(
                    alignment: Alignment.center,
                    backgroundColor: Colors.white,
                    title: 'Welcome!',
                    content:
                        'Get Flutter is one of the largest Flutter open-source UI library for mobile or web apps with  1000+ pre-built reusable widgets.',
                    type: GFAlertType.rounded,
                    bottombar: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GFButton(
                          onPressed: () {
                            setState(() {
                              alertWidget = null;
                              showBlur = false;
                            });
                          },
                          color: GFColors.LIGHT,
                          child: const Text(
                            'Close',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
          ),
        ),
        child: alertWidget,
      ),
    );
  }
}
