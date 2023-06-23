import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../Data/jokes.dart';
import '../data/string_data.dart';
import '../models/joke.dart';
import '../resources/assets.dart';
import '../resources/colors.dart';
import '../widgets/button.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          header(context),
          const Body(),
          const Divider(
            color: Colors.grey,
          ),
          footer(context),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leadingWidth: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 40, width: 40, child: Image.asset(Images.logo)),
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Handicrafted by',
                    style: TextStyle(fontSize: 12, color: colorGray60),
                  ),
                  Text(
                    'Jim HLS',
                    style: TextStyle(fontSize: 12, color: colorBlack),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: ClipOval(
                  child: Image.asset(Images.avatar),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: colorWhite,
    );
  }

  Flexible header(BuildContext context) {
    return Flexible(
      flex: 20,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: colorGreen30,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              StringData.header,
              style: TextStyle(color: colorWhite, fontSize: 18),
            ),
            Text(
              StringData.note,
              style: TextStyle(color: colorWhite, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  Flexible footer(BuildContext context) {
    return Flexible(
      flex: 20,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AutoSizeText(
              StringData.footer,
              minFontSize: 1,
              maxFontSize:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 12
                      : 11,
              style: const TextStyle(
                color: colorGray60,
              ),
              textAlign: TextAlign.center,
            ),
            const FittedBox(
              child: Text(
                StringData.copyright,
                style: TextStyle(color: colorGray40, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Joke> jokes = Jokes.jokes;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 60,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).orientation == Orientation.portrait
                ? 55
                : 20,
            horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Text(
                jokes[index].content,
                style: const TextStyle(color: colorGray40, fontSize: 15),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(
                    onPressed: () {
                      setState(() {
                        jokes[index].isFunny = jokes[index].isRead = true;
                        if (index < jokes.length - 1) {
                          index = index + 1;
                        } else {
                          index = 0;
                        }
                      });
                    },
                    text: 'This is Funny!',
                    backgroundColor: colorBlue10),
                button(
                    onPressed: () {
                      setState(() {
                        jokes[index].isFunny = false;
                        jokes[index].isRead = true;
                        if (index < jokes.length - 1) {
                          index = index + 1;
                        } else {
                          index = 0;
                        }
                      });
                    },
                    text: 'This is not funny.',
                    backgroundColor: colorGreen30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
