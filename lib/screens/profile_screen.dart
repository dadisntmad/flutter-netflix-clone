import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/custom_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const _ProfileManagingWidget(),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.edit,
                size: 18,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: Colors.grey),
                child: const Text(
                  'Manage Profiles',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _Menu(
            icon: Icons.done,
            text: 'My List',
          ),
          const SizedBox(height: 2),
          const _Menu(
            icon: Icons.settings,
            text: 'App Settings',
          ),
          const SizedBox(height: 2),
          const _Menu(
            icon: Icons.person,
            text: 'Account',
          ),
          const SizedBox(height: 2),
          const _Menu(
            icon: Icons.help_outline,
            text: 'Help',
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            child: const Text(
              'Sign Out',
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileManagingWidget extends StatelessWidget {
  const _ProfileManagingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              'assets/profile_image.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 5),
            const Text(
              'username',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(width: 14),
        Column(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                shape: BoxShape.rectangle,
                color: Colors.transparent,
                border: Border.all(
                  color: accentGrey,
                ),
              ),
              child: const Icon(Icons.add, size: 32, color: accentGrey),
            ),
            const SizedBox(height: 5),
            const Text(
              'Add Profile',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Menu extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Menu({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.grey.shade900,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 24, color: Colors.grey.shade700),
                const SizedBox(width: 4),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }
}
