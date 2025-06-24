import 'package:flutter/material.dart';

class HondaScreen extends StatelessWidget {
  final List<Map<String, String>> hondaCars = [
    {
        'titulo': 'HONDA',
        'imagen':
            'https://console.firebase.google.com/u/0/project/importacionesmaradiaga-6698e/firestore/databases/-default-/data/~2FCars~2FoaWoRY0vGUNVMekpoMTV'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            '"https://res.cloudinary.com/dtpkeixv3/image/upload/v1745691497/20250426_121816/shixdnfoxb56r5engfwk.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745692518/20250426_123517/k70q20lj34zcxrroyroe.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747194902/20250513_215501/ban6khvvwyf6ip1zfz9t.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747194457/20250513_214735/qadq4azjmdeo7m3kh3vj.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1746156922/20250501_213521/n8pm753a6svn4hfq7rha.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1746159523/20250501_221842/ft3bp5w2jhjehc3ydhia.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745679833/20250426_090353/bnjfzhxkp8hc8bfonkqa.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1746158739/20250501_220538/ttdcjouj7cysqibqilbj.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747195917/20250513_221156/f3dlx4uiik6cht6l4c4v.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745639226/20250425_214705/mpnlrtrpieyjl6n8xzxi.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1746158390/20250501_215948/riiwruiot0ezpxcfmlvx.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745688577/20250426_112936/qfl9tnznwcqdl9jjgw8d.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745638111/20250425_212831/vj85ft9pggacio2qoyek.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745687199/20250426_110638/mhopcdybrix0dn6gbixu.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745642678/20250425_224438/sna5zr7yxldbdg0cwwxc.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747194634/20250513_215034/norajh1vwm7q8q6h9xwg.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747195413/20250513_220332/xqvtx6iwmm9wophgkjtr.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745641613/20250425_222653/zt6sammmbbok73c60zuw.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1746157842/20250501_215041/s17gc640jliywy60tgoe.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745689147/20250426_113906/oa2vmu0k4e8xfub0c0zr.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745637956/20250425_212556/beftms4orlsoqazucvdy.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745679395/20250426_085634/xqejxohfx7yijqrdsrif.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745643753/20250425_230232/osefxqpompcyvtoynp55.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747195607/20250513_220646/ik6g4quooysjmnw9utef.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745691939/20250426_122539/vfcforeljfurpxr2g31a.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745681091/20250426_092449/ham8gtymt8ha5wlhznzs.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745642965/20250425_224925/dp0llpmgjku8salknfzi.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1746157612/20250501_214651/xjxzcm8ts9y4hvlifqxl.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747194216/20250513_214334/poi1azhhixo7uvwtcp32.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1746158042/20250501_215400/hvlxontpiiyjk576yk0a.jpg
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745687047/20250426_110406/ilh5xcc91mzp0en8p3wg.jpg'
      },
      {
        'titulo': 'HONDA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745680677/20250426_091750/gyxtawkiir0286vql5yd.png'
      },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6C9286),
        centerTitle: true,
        title: Text(
          'HONDA',
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
          children: List.generate(hondaCars.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(hondaCars[index]['imagen']!),
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
                  hondaCars[index]['titulo']!,
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
