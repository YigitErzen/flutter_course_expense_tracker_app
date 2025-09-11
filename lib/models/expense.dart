import   'package:uuid/uuid.dart';

const uuid = Uuid();

class expense {
 expense({
    required this.title,
    required this.amount,
    required this.date,
 }) : id = uuid.v4();
 

 final String title;
 final double amount;
 final DateTime date;
 final String id;
}