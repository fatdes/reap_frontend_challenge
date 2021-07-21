import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'insta_pic_cubit.dart';

class AddPost extends StatefulWidget {
  @override
  AddPostState createState() => AddPostState();
}

class AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();

  bool _enable = true;
  bool _enableSubmit = false;

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _imageFile;

  String? _description;

  void _pickImage() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (await pickedFile.length() > 300 * 1000) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('image size should be <= ${300 * 1000}')));
          return;
        }
      }

      setState(() {
        _imageFile = pickedFile;
        _enableSubmit = _imageFile != null && _formKey.currentState!.validate();
      });
    } catch (e) {
      print('Image picker error $e');
    }
  }

  @override
  void initState() {
    super.initState();

    _enable = true;
    _enableSubmit = false;
    _imageFile = null;
    _description = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          onChanged: () {
            _enableSubmit =
                _imageFile != null && _formKey.currentState!.validate();
          },
          child: Column(
            children: [
              TextField(
                onTap: _enable ? _pickImage : null,
                decoration: InputDecoration(
                  hintText: 'click here to choose file to upload',
                ),
                readOnly: true,
              ),
              SizedBox(height: 16),
              if (_imageFile != null)
                kIsWeb
                    ? Image.network(
                        _imageFile!.path,
                        width: 100,
                      )
                    : Image.file(
                        File(_imageFile!.path),
                        width: 100,
                      ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                  labelText: 'description',
                  hintText: 'allowed characters A-Za-z0-9!@#\$%^&*()-_+ =',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[A-Za-z0-9!@#\$%^&*()-_+ =]')),
                  LengthLimitingTextInputFormatter(50),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  }

                  if (value.length > 50) {
                    return 'description should be less than or equal to 50 characters';
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.always,
                maxLength: 50,
                enabled: _enable,
                onSaved: (value) {
                  this._description = value;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _enableSubmit
                    ? () {
                        if (_imageFile != null &&
                            _formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                            _enable = false;
                            _enableSubmit = false;

                            BlocProvider.of<InstaPicCubit>(context).createPost(
                              _imageFile!.readAsBytes(),
                              _description,
                            );
                            Navigator.of(context).pop(); // back to main screen
                          });
                        }
                      }
                    : null,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
