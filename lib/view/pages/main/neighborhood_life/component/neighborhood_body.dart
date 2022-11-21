import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/models/neighborhood_life.dart';
import 'package:workspace/theme.dart';

class NeighborhoodBody extends StatelessWidget {
  final NeighborhoodLife neighborhoodLife;
  const NeighborhoodBody({required this.neighborhoodLife, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('${neighborhoodLife.category}', style: textTheme().bodyText2),
                    ),
                  ),
                  Text('${neighborhoodLife.date}', style: textTheme().bodyText2),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: '${neighborhoodLife.profileImgUri}',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('${neighborhoodLife.userName}', style: textTheme().bodyText1),
                  SizedBox(width: 8),
                  Text('${neighborhoodLife.location} 인증 ${neighborhoodLife.authCount}회'),
                ],
              ),
              SizedBox(height: 16),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text('${neighborhoodLife.content}', style: textTheme().bodyText1),
              ),
              SizedBox(height: 16),
              Visibility(
                visible: neighborhoodLife.contentImgUri != '',
                child: CachedNetworkImage(
                  imageUrl: '${neighborhoodLife.contentImgUri}',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        Divider(color: Colors.grey, height: 0),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              _buildLikeButton(),
              SizedBox(width: 16),
              _buildCommentButton(),
            ],
          ),
        ),
        SizedBox(
          height: 16,
          child: Container(
            color: Colors.grey[200],
          ),
        )
      ],
    );
  }

  Row _buildLikeButton() {
    return Row(
      children: [
        Icon(CupertinoIcons.smiley, size: 25, color: Colors.grey),
        SizedBox(width: 8),
        Text('공감하기', style: textTheme().bodyText1),
      ],
    );
  }

  Row _buildCommentButton() {
    return Row(
      children: [
        Icon(CupertinoIcons.text_bubble, size: 25, color: Colors.grey),
        SizedBox(width: 8),
        Text('댓글쓰기 ${neighborhoodLife.commentCount}', style: textTheme().bodyText1),
      ],
    );
  }
}
