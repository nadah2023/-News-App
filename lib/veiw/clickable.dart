import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickablePhoto extends StatefulWidget {
  final String imageUrl;
  final String linkUrl;

  const ClickablePhoto({
    Key? key,
    required this.imageUrl,
    required this.linkUrl,
  }) : super(key: key);

  @override
  _ClickablePhotoState createState() => _ClickablePhotoState();
}

class _ClickablePhotoState extends State<ClickablePhoto> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(widget.linkUrl),
      child: Image.network(widget.imageUrl),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
