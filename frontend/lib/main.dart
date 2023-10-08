//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:nasa/api/api.pbgrpc.dart';
import 'package:nasa/challenges.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chat_page.dart';
import 'info_page.dart';
import 'land_page.dart';

const host = "[2a02:587:5d06:2900:1069:6acd:c4d5:5ae9]";
const port = 50051;
const credentials =
    kDebugMode ? ChannelCredentials.insecure() : ChannelCredentials.secure();

final GrpcOrGrpcWebClientChannel channel =
    GrpcOrGrpcWebClientChannel.toSingleEndpoint(
  host: host,
  port: port,
  transportSecure: !kDebugMode,
);

final stub = NasaServiceClient(channel);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class Page {
  const Page({required this.page, required this.text, required this.icon});
  final Widget page;
  final String text;
  final IconData icon;
}

final colorProvider = NotifierProvider<MainColor, Color>(MainColor.new);

class MainColor extends Notifier<Color> {
  @override
  Color build() => const Color.fromARGB(
        255,
        202,
        158,
        0,
      );

  void changeColor(BuildContext context) async => state = await showDialog(
        context: context,
        builder: (context) => const ColorChooser(),
      );
}

class ColorChooser extends StatefulWidget {
  const ColorChooser({super.key});

  @override
  State<ColorChooser> createState() => _ColorChooserState();
}

class _ColorChooserState extends State<ColorChooser> {
  Color color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Pick a color!',
        style: TextStyle(color: Theme.of(context).colorScheme.surface),
      ),
      content: SingleChildScrollView(
        child: ColorPicker(
          labelTypes: const [],
          pickerColor: color,
          onColorChanged: (c) {
            setState(() {
              color = c;
            });
          },
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Got it'),
          onPressed: () {
            Navigator.of(context).pop(color);
          },
        ),
      ],
    );
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            background: Colors.black,
            error: Colors.red,
            onError: Colors.black,
            onPrimary: Colors.grey,
            onSecondary: Colors.black,
            onSurface: Colors.black,
            primary: Colors.black,
            surface: Colors.white,
            onBackground: Colors.grey,
            secondary:
                ref.watch(colorProvider) // Color.fromARGB(255, 232, 249, 0),
            ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Nav(),
    );
  }
}

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> with SingleTickerProviderStateMixin {
  static const pages = [
    Page(page: InfoPage(), text: "Info", icon: Icons.info),
    Page(page: ChallengesPage(), text: "Challenges", icon: Icons.question_mark),
    Page(page: LandPage(), text: "Land", icon: Icons.landscape),
    Page(page: ChatPage(), text: "Chat", icon: Icons.chat),
  ];

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: pages.length, vsync: this);
    controller.addListener(() {
      setState(() {
        index = controller.index;
      });
    });
    super.initState();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(
          "assets/logo.svg",
          color: Theme.of(context).colorScheme.secondary,
          semanticsLabel: 'Our Logo',
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            onPressed: () =>
                launchUrl(Uri.parse("https://discord.gg/CB5kKbvdpc")),
            icon: Icon(
              Icons.discord,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const ChangeColorButton(),
          IconButton(
            onPressed: () async => showAboutDialog(
              context: context,
              applicationName: "Nasa in your",
            ),
            icon: Icon(
              Icons.info,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => controller.animateTo(value),
        items: pages
            .map(
              (e) => BottomNavigationBarItem(
                activeIcon: Icon(
                  e.icon,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                icon: Icon(
                  e.icon,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                label: e.text,
              ),
            )
            .toList(),
      ),
      body: TabBarView(
        controller: controller,
        children: List.generate(pages.length, (index) => pages[index].page),
      ),
    );
  }
}

class ChangeColorButton extends ConsumerWidget {
  const ChangeColorButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => ref.read(colorProvider.notifier).changeColor(context),
      icon: Icon(
        Icons.color_lens,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
