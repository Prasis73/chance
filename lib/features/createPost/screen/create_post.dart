// screens/create_post_screen.dart
import 'dart:io';

import 'package:chance/core/const/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends HookWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPublic = useState(true);
    final selectedTopic = useState<String?>(null);
    final imageFile = useState<XFile?>(null);
    final picker = ImagePicker();

    Future<void> pickImage(ImageSource source) async {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile.value = pickedFile;
      }
    }

    void showPostCreatedToast() {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Hire me to Post Content")));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Create Post',
          style: AppTextStyles.bold700Style16,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: showPostCreatedToast,
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff5DC482),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                '  Post  ',
                style:
                    AppTextStyles.bold700Style16.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Public/Business toggle
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => isPublic.value = true,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isPublic.value
                              ? const Color(0xff5DC482)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isPublic.value
                                ? Colors.transparent
                                : Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Public',
                            style: TextStyle(
                              color:
                                  isPublic.value ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => isPublic.value = false,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isPublic.value
                              ? Colors.transparent
                              : const Color(0xff5DC482),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isPublic.value
                                ? Colors.grey
                                : Colors.transparent,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Business',
                            style: TextStyle(
                              color:
                                  isPublic.value ? Colors.black : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Text input
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Type something',
                  border: InputBorder.none,
                ),
                maxLines: 10,
              ),
              const SizedBox(height: 16),
              // Topic selection
              Text(
                'Topic',
                style: AppTextStyles.bold400Style14,
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ChoiceChip(
                      label: Text(
                        'Climate Change & Sustainability',
                        style: AppTextStyles.bold600Style13,
                      ),
                      selected: selectedTopic.value ==
                          'Climate Change & Sustainability',
                      onSelected: (selected) {
                        selectedTopic.value =
                            selected ? 'Climate Change & Sustainability' : null;
                      },
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: Text(
                        'Conscious Art',
                        style: AppTextStyles.bold600Style13,
                      ),
                      selected: selectedTopic.value == 'Conscious Art',
                      onSelected: (selected) {
                        selectedTopic.value = selected ? 'Conscious Art' : null;
                      },
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: Text(
                        'Architecture',
                        style: AppTextStyles.bold600Style13,
                      ),
                      selected: selectedTopic.value == 'Architecture',
                      onSelected: (selected) {
                        selectedTopic.value = selected ? 'Architecture' : null;
                      },
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: Text('Food', style: AppTextStyles.bold600Style13),
                      selected: selectedTopic.value == 'Food',
                      onSelected: (selected) {
                        selectedTopic.value = selected ? 'Food' : null;
                      },
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    // Add more topics as needed
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Image picker
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        pickImage(ImageSource.camera);
                      },
                      child: SvgPicture.asset(
                        'assets/images/camera.svg',
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        pickImage(ImageSource.gallery);
                      },
                      child: SvgPicture.asset(
                        'assets/images/gallery.svg',
                      )),
                ],
              ),
              if (imageFile.value != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Image.file(
                    File(imageFile.value!.path),
                    height: 200,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
