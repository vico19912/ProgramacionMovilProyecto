class Car {
  String ?id; //<----- id de firebase util para actualizar
  String brand;
  String model;
  double price;
  int year;
  List<String> imgUrl;
  String desc;
  int miles;
  bool towTruck;
  bool sold = false;

  Car(
      {
      this.id , 
      required this.imgUrl,
      required this.brand,
      required this.model,
      required this.price,
      required this.year,
      required this.desc,
      required this.miles,
      required this.towTruck,
      required this.sold});
}