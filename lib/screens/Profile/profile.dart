import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.network(
              "https://drive.google.com/uc?id=1KssF2NCpPUHhhVSD1jBva7migz_D0iJU",
              fit: BoxFit.cover,
              height: size.height,
              width: size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: size.height * 0.4,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      const CircleAvatar(
                                        radius: 42,
                                        backgroundImage: NetworkImage(
                                            "https://drive.google.com/uc?id=18TJ_y_K78G7VqXjuxjiplUylQLATr5Cd"),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(
                                                255, 95, 225, 99),
                                          ),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          const url =
                                              'https://www.instagram.com/___ankit94/';
                                          try {
                                            await launchUrlString(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          } catch (e) {
                                            if (kDebugMode) {
                                              print('Error: $e');
                                            }
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Could not open Instagram. Please try again.')),
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.black54),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 9, horizontal: 12),
                                          child: const Text(
                                            "ADD FRIEND",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: () async {
                                          const url =
                                              'https://github.com/Ankitsaroj94';
                                          try {
                                            await launchUrlString(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          } catch (e) {
                                            if (kDebugMode) {
                                              print('Error: $e');
                                            }
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Could not open GitHub. Please try again.')),
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.pink,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 12),
                                          child: const Text(
                                            "Follow",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Ankit Saroj",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 35,
                                ),
                              ),
                              const Text(
                                "Flutter Developer",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                    color: Colors.black45),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "A Flutter developer is a software engineer who has proficiency with the Flutter framework to develop mobile, web apps",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Divider(color: Colors.black12),
                        SizedBox(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              friendAndMore("FRIENDS", "50"),
                              friendAndMore("FOLLOWING", "3"),
                              friendAndMore("FOLLOWER", "3"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox friendAndMore(String title, String number) {
    return SizedBox(
      width: 110,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black26),
          ),
          Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
