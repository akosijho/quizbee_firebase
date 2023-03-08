import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

const BASE_URL = "http://quizzbee.bisubilar.org/api";
FirebaseFirestore db = FirebaseFirestore.instance;
String host = Platform.isAndroid ? '10.0.2.2' : "localhost";