import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String description;
  final String time;
  final String? image;
  const NotificationCard({
    Key? key,
    required this.description,
    required this.time,
    this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: SizedBox(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 0.9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                  child: Image.asset(
                    image ?? 'assets/images/afaq-logo.png',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 + 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              time,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xfff707070),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Text(
                        description,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xfff707070),
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
