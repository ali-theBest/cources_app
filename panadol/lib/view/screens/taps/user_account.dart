import 'package:flutter/material.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'my account',
            style: TextStyle(
              fontFamily: "Tajawal",
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: 13,
              height: 3 / 2,
            ),
          ),
          Center(
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQgklhgD0zVQoATeorXmrSJ1JBDH9YmkG9OLdgmJ04C5uUNIADhmQLPIUFw98w0y-QSXVLSRM3suAiJhzxSjqabwT5FahrMOsKFMLAJodBf',
                  ),
                ),
                Text(
                  'Omar Sherif',
                  style: TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 3 / 2,
                  ),
                ),
                Text(
                  'om397552@gmail.com',
                  style: TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2B65F6),
                    fontSize: 12,
                    height: 3 / 2,
                  ),
                ),
              ],
            ),
          ),
          textHeader(text: 'my info'),
          myListTileElement(
            leading: 'learning passes',
            onTap: () {},
          ),
          myListTileElement(
            leading: 'fav elements list',
            onTap: () {},
          ),
          textHeader(
            text: 'video settings',
          ),
          myListTileElement(
            leading: 'download options',
            onTap: () {},
          ),
          myListTileElement(
            leading: 'play video settings',
            onTap: () {},
          ),
          myListTileElement(
            leading: 'my courses',
            onTap: () {},
          ),
          //**********************************************************
          textHeader(text: 'account settings'),
          myListTileElement(
            leading: 'gmail notifications',
            onTap: () {},
          ),
          myListTileElement(
            leading: 'app settings',
            onTap: () {},
          ),
          myListTileElement(
            leading: 'account safety',
            onTap: () {},
          ),
          myListTileElement(
            leading: 'close account',
            onTap: () {},
          ),
          textHeader(text: 'support'),
          myListTileElement(
            leading: 'about panadol',
            onTap: () {},
          ),
          myListTileElement(
            leading: 'help and support',
            onTap: () {},
          ),
          myListTileElement(
            leading: 'share app ',
            onTap: () {},
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Sign out',
              style: TextStyle(
                color: Color(0xff2B65F6),
                fontSize: 19,
                height: 3 / 2,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text textHeader({
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Tajawal",
        fontSize: 11,
        fontWeight: FontWeight.bold,
        height: 3 / 2,
        color: Colors.black.withOpacity(
          .5,
        ),
      ),
    );
  }

  ListTile myListTileElement(
      {required String leading, required void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Text(
        leading,
        style: const TextStyle(
          fontFamily: "Tajawal",
          fontWeight: FontWeight.w800,
          color: Colors.black,
          fontSize: 13,
          height: 3 / 2,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
        size: 13,
      ),
    );
  }
}
