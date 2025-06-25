import 'package:flutter/material.dart';

class HyundaiScreen extends StatelessWidget {
  final List<Map<String, String>> hyundaiCars = [
    {
      'titulo': 'HYUNDAI',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745679569/20250426_085928/un8vjcimyemfnj6oqtho.jpg'
    },
    {
      'titulo': 'HYUNDAI',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745637267/20250425_211426/a0wwant4fsalonnkiwna.jpg'
    },
    {
      'titulo': 'HYUNDAI',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745639847/20250425_215726/z4rhywqxau55or4bvdos.jpg'
    },
    {
      'titulo': 'HYUNDAI',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745639492/20250425_215131/j1gxvwhmzryqfrx5rbpn.jpg'
    },
    {
      'titulo': 'HYUNDAI',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747194457/20250513_214735/qadq4azjmdeo7m3kh3vj.jpg'
    },
    {
      'titulo': 'HYUNDAI',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745687454/20250426_111053/myzqxjj3dqnfzj0jnvk3.jpg'
    },
    {
      'titulo': 'HYUNDAI',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745690601/20250426_120320/vu9yzg79jlnipv1xrvu9.jpg'
    },
    {
      'titulo': 'HYUNDAI',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745640517/20250425_220836/rbc1bkgpd44mhgepxs4s.jpg'
    },
    {
      'titulo': 'HYUNDAI',
      'imagen': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745690920/20250426_120839/y1b4qavem2m1xobel88d.jpg'
    },
  ];

<<<<<<< HEAD
  const HyundaiScreen({super.key});

=======
>>>>>>> e3846cc6db5ab1270407338ec69e0b87c4114f63
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6C9286),
        centerTitle: true,
        title: Text(
          'HYUNDAI',
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
          children: List.generate(hyundaiCars.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(hyundaiCars[index]['imagen']!),
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
                  hyundaiCars[index]['titulo']!,
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
