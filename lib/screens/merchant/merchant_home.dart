import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopper/api/repositories/merchant_repository.dart';
import 'package:shopper/components/text_form_field.dart';
import 'package:shopper/components/upload_image.dart';
import 'package:file_picker/file_picker.dart';

import '../../components/custom_button.dart';

class MerchantHome extends StatefulWidget {
  const MerchantHome({Key? key}) : super(key: key);

  @override
  State<MerchantHome> createState() => _MerchantHomeState();
}

class _MerchantHomeState extends State<MerchantHome> {
  MerchantController merchantController = MerchantController();

  UploadImage imageUploader = UploadImage();
  final formKey = GlobalKey<FormState>();

  final productNameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  Uint8List imageFileUint8List = Uint8List(0);
  File imageFile = File("/Users/echatahkingdavid/Downloads/profile.png");
  selectImageFromCamera() async {
    try {
      final cameraFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (cameraFile != null) {
        return cameraFile?.path;
      } else {
        return '';
      }
    } catch (e) {
      print(e);
    }
  }

  selectImageFromGallery() async {
    try {
      final galleryFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (galleryFile != null) {
        String imagePath = galleryFile.path;
        imageFileUint8List = await galleryFile.readAsBytes();
        await imageFile.writeAsBytes(imageFileUint8List);
        Navigator.pop(context);
        setState(() {
          imageFile;
          imageFileUint8List;
        });
        print(imagePath);
        return imageFileUint8List;
      } else {
        return '';
      }
    } catch (e) {
      print(e);
      //
      // setState(() {
      //   imageFileUint8List = ;
      // });
    }
  }

  String selectedImagePath = '';
  late bool option;
  File? file = null;

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: 200,
              child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Text(
                        "Select image from?",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                option = true;
                                FilePickerResult? result = await FilePicker
                                    .platform
                                    .pickFiles(type: FileType.image);
                                print(
                                    "result ${result?.files.first.path.toString()}");
                                if (result != null) {
                                  setState(() {
                                    file = File(result.files.single.path!);
                                  });
                                } else {
                                  //user canceled the picker
                                }
                                Navigator.pop(context);
                              },
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/photos.jpeg',
                                        height: 60,
                                        width: 60,
                                      ),
                                      const Text('Gallery'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                option = false;
                              },
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/camcam.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      const Text('Camera'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await selectImage();
                    },
                    child: file == null
                        ? Image.asset(
                            "images/add_image.png",
                            width: size.width * 0.35,
                            height: size.height * 0.3,
                          )
                        : Container(
                            height: size.height * 0.4,
                            width: size.width * 0.4,
                            child: Image(
                              image: FileImage(file!),
                            ),
                          ),
                  ),
                  CustomTextFormField(
                    hint: 'Product name',
                    textEditingController: productNameController,
                    keyboardTpe: TextInputType.name,
                    validator: (name) => name == null || name.isEmpty
                        ? 'Enter a valid name'
                        : null,
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomTextFormField(
                    hint: 'Price',
                    textEditingController: priceController,
                    keyboardTpe: TextInputType.number,
                    validator: (price) => price == null || price.isEmpty
                        ? 'Enter a valid price'
                        : null,
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomTextFormField(
                    hint: 'Description',
                    textEditingController: descriptionController,
                    keyboardTpe: TextInputType.text,
                    validator: (description) =>
                        description == null || description.isEmpty
                            ? 'Enter a valid description'
                            : null,
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomTextFormField(
                    hint: 'Quantity',
                    textEditingController: quantityController,
                    keyboardTpe: TextInputType.number,
                    validator: (quantity) =>
                        quantity == null || quantity.isEmpty
                            ? 'Enter a valid quantity'
                            : null,
                  ),
                  SizedBox(height: size.height * 0.03),
                  InkWell(
                    onTap: () async {
                      // if (formKey.currentState!.validate()) {
                      //   bool created = await merchantController.createProduct(
                      //       productName: productNameController.text,
                      //       price: priceController,
                      //       description: descriptionController.text,
                      //       quantity: quantityController,
                      //       image: file);
                      //   if (created) {
                      //     Get.to(() => const CustomerHome());
                      //   }
                      // }
                    },
                    child: const CustomButton(
                      text: 'Create product',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
