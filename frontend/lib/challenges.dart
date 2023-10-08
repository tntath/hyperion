import 'package:flutter/material.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ChallengeTile(
          title: "Challenge N.$index",
          subtitle: "subs sss",
          icon: Icons.star,
        );
      },
    );
  }
}

class ChallengeTile extends StatelessWidget {
  const ChallengeTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Card(
        color: Color.lerp(Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.secondary, 0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Color.lerp(
                        Theme.of(context).colorScheme.background,
                        Theme.of(context).colorScheme.surface,
                        0.7,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
