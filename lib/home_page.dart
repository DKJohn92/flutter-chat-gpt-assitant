import 'package:ask_42/feature_box.dart';
import 'package:ask_42/palette.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask 42!'),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              //virtual assistant picture
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: const BoxDecoration(
                      color: Palette.assistantCircleColor,
                      shape: BoxShape.circle),
                ),
              ),
              Container(
                height: 123,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/virtualAssistant.png'),
                  ),
                ),
              ),
            ],
          ),
          // chat bubble
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
              top: 30,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Palette.borderColor,
              ),
              borderRadius: BorderRadius.circular(20).copyWith(
                topLeft: Radius.zero,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                'Good Morning, How can i assist you?',
                style: TextStyle(
                  color: Palette.mainFontColor,
                  fontSize: 25,
                  fontFamily: 'Cera Pro',
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10, left: 22),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Here are a few suggestions: ',
              style: TextStyle(
                fontFamily: 'Cera Pro',
                color: Palette.mainFontColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //feature list
          const Column(
            children: [
              FeatureBox(
                color: Palette.firstSuggestionBoxColor,
                headerText: 'ChatGPT',
                featureText: 'A smarter way to stay informed with ChatGPT.',
              ),
              FeatureBox(
                color: Palette.secondSuggestionBoxColor,
                headerText: 'Dall-E',
                featureText:
                    'Get inspired by the latest AI image creation powered by Dall-E',
              ),
              FeatureBox(
                color: Palette.thirdSuggestionBoxColor,
                headerText: 'Voice Assistant',
                featureText:
                    'Get some things done in a quick way without the necessity to type by Voice Assistant',
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Palette.firstSuggestionBoxColor,
        child: const Icon(Icons.mic),
      ),
    );
  }
}
