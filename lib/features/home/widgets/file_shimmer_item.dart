import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FileShimmerItem extends StatelessWidget {
  const FileShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        spacing: AppSpacing.md,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(color: Colors.white, borderRadius: AppStyle.borderCard),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (_, cc) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 14,
                    width: cc.maxWidth,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: AppStyle.borderButton),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 12,
                    width: cc.maxWidth * 0.6,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: AppStyle.borderButton),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
