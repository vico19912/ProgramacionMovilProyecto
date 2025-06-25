import 'package:flutter/material.dart';

class FordScreen extends StatelessWidget {
  final List<Map<String, String>> fordCars = [
    {
      'titulo': 'FORD',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745687454/20250426_111053/myzqxjj3dqnfzj0jnvk3.jpg'
    },
    {
      'titulo': 'FORD',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745682467/20250426_094746/g6f8unluoc5zju9znprd.jpg'
    },
    {
      'titulo': 'FORD',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747195770/20250513_220929/lorpgkzgirlyvv4cegdt.jpg'
    },
    {
      'titulo': 'FORD',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745644330/20250425_231210/thdhqyg5rri6r2yqsvhn.jpg'
    },
    {
      'titulo': 'FORD',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747194781/20250513_215300/zh0nsoj8pm8v9ge0xjpz.jpg'
    },
    {
      'titulo': 'FORD',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1746232466/20250502_183422/ctzqyfd0cma1kbyk1gwh.jpg'
    },
    {
      'titulo': 'FORD',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745679060/20250426_085059/vw8rhaew96ife592wcts.jpg'
    },
    {
      'titulo': 'FORD',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745682215/20250426_094334/miyqyovvokdblcrtwkrd.jpg'
    },
  ];

  const FordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6C9286),
        centerTitle: true,
        title: Text(
          'FORD',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: List.generate(fordCars.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(fordCars[index]['imagen']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Text(
                  fordCars[index]['titulo']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
