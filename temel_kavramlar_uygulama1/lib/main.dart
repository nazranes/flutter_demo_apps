import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  final url= 'https://t4.ftcdn.net/jpg/04/75/00/99/360_F_475009987_zwsk4c77x3cTpcI3W1C1LU4pOSyPKaqi.jpg';

  Widget _builtItem(String value, String label){
    return Expanded(child: Column(
                        children: [
                          Text(value, style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                           Text(label
                          )
                        ],
                      ),
                      );
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profil Sayfası'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(url),
            
                  ),
                 SizedBox(height: 16),
                  Text('Nazrin Huseynova', style: TextStyle(color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),),
                  
                  Text('Mobil Uygulama Geliştiricisi', style: TextStyle(color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),),
                
              SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      _builtItem('1.5K', 'Takipçi'),
                      _builtItem('2.5K', 'Takip'),
                      _builtItem('15', 'Gönderi'),

                  
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hakkımda', style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 18),),
                     SizedBox(height: 18,),

                      Text('Flutter İle Mobil Uygulama Geliştirmeyi Seviyorum. Yeni teknolojiler öyrenmek benim hobim.')
                    ],
                  ),
                ),
              )



              ],
            ),
          ),
        ),
      ),
    );
  }
}