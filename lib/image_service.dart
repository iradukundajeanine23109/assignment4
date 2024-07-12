import 'package:image_picker/image_picker.dart';

Future<void> pickImageFromGallery() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    // Use the selected image
  }
}

Future<void> captureImageWithCamera() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  if (image != null) {
    // Use the captured image
  }
}
