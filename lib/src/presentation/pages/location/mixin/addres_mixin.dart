import 'package:flutter/material.dart';

import '../pages/location_page.dart';

mixin AddressMixin on State<LocationPage>{
  TextEditingController addressController = TextEditingController();
  TextEditingController podezdController = TextEditingController();
  TextEditingController etajController = TextEditingController();
  TextEditingController kvartiraController = TextEditingController();
  TextEditingController orientirController = TextEditingController();
  TextEditingController addressnameController = TextEditingController();
  TextEditingController yandexlocationController = TextEditingController();
}