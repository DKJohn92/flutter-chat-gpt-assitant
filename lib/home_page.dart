import 'package:ask_42/custom_loader.dart';
import 'package:ask_42/feature_box.dart';
import 'package:ask_42/open_ai_service.dart';
import 'package:ask_42/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String spokenWords = '';
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  String? generatedImageUrl;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      spokenWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ask Daniel!',
          style: TextStyle(color: Palette.whiteColor),
        ),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //loader animation
            const SizedBox(
              width: 350,
              height: 350,
              child: CustomLoader(),
            ),
            // chat bubble
            Visibility(
              visible: generatedImageUrl == null,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                  top: 30,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Palette.whiteColor,
                  ),
                  borderRadius: BorderRadius.circular(20).copyWith(
                    topLeft: Radius.zero,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    generatedContent == null
                        ? 'Hi there what is bugging you? Anything i can assist you with?'
                        : generatedContent!,
                    style: TextStyle(
                      color: Palette.whiteColor,
                      fontSize: generatedContent == null ? 25 : 18,
                      fontFamily: 'Cera Pro',
                    ),
                  ),
                ),
              ),
            ),
            //Image should be shown if imageURL not null
            if (generatedImageUrl != null)
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(generatedImageUrl!),
                ),
              ),
            Visibility(
              visible: generatedContent == null && generatedImageUrl == null,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, left: 22),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Here are a few suggestions: ',
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Palette.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //feature list
            Visibility(
              visible: generatedContent == null && generatedImageUrl == null,
              child: const Column(
                children: [
                  FeatureBox(
                    color: Palette.firstBubble,
                    headerText: 'ChatGPT',
                    featureText: 'A smarter way to stay informed with ChatGPT.',
                  ),
                  FeatureBox(
                    color: Palette.firstBubble,
                    headerText: 'Dall-E',
                    featureText:
                        'Get inspired by the latest AI image creation powered by Dall-E',
                  ),
                  FeatureBox(
                    color: Palette.firstBubble,
                    headerText: 'Voice Assistant',
                    featureText:
                        'Get some things done in a quick way without the necessity to type by Voice Assistant',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            final speech = await openAIService.isArtPromptAPI(spokenWords);
            if (speech.contains('https')) {
              generatedImageUrl = speech;
              generatedContent = null;
              setState(() {});
            } else {
              generatedImageUrl = null;
              generatedContent = speech;
              await systemSpeak(speech);
              setState(() {});
            }
            await stopListening();
          } else {
            initSpeechToText();
          }
        },
        backgroundColor: Palette.whiteColor,
        // child: Icon(speechToText.isListening ? Icons.stop : Icons.mic),
        child: const Icon(Icons.mic),
      ),
    );
  }
}
