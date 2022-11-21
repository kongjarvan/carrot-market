import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:workspace/models/neighborhood_life.dart';
import 'package:workspace/theme.dart';

class NeighborhoodHeader extends StatelessWidget {
  const NeighborhoodHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: '${neighborhoodLifeList[0].profileImgUri}',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text('${lifeTitle}', style: textTheme().bodyText1),
          ),
        ],
      ),
    );
  }
}
