import 'package:event_fit/domain/models/publish.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final List<Publish> publishData = [
  Publish(
      id: "001",
      name: "publish one",
      siteDescription: "en mi casita",
      imageUrl:
          "https://d500.epimg.net/cincodias/imagenes/2019/05/02/lifestyle/1556809482_591063_1556811610_noticia_normal.jpg",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100))),
  Publish(
      id: "002",
      name: "publish two",
      siteDescription: "Al GYM",
      imageUrl:
          "https://elcomercio.pe/resizer/8QH0dkyeXB0DOIYQDIOvAR3_E8I=/980x0/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/5MEZYIWBRFDSRIJ6ZBZCNP4SU4.jpg",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100))),
  Publish(
      id: "002",
      name: "publish three",
      siteDescription: "a jugar bola",
      imageUrl:
          "https://i.pinimg.com/736x/7a/2f/f6/7a2ff6f9b328a848b8a9d5e571210432.jpg",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100))),
  Publish(
      id: "002",
      name: "publish three",
      siteDescription: "a jugar bola",
      imageUrl:
          "https://st4.depositphotos.com/9925326/40560/i/450/depositphotos_405608314-stock-photo-soccer-player-kicking-ball-on.jpg",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100))),
  Publish(
      id: "002",
      name: "publish three",
      siteDescription: "a jugar bola",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTndd2SWxgD0GgxRX26_19LlLg1HoOnyxL0AQ&usqp=CAU",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100))),
  Publish(
      id: "002",
      name: "publish three",
      siteDescription: "a jugar bola",
      imageUrl:
          "https://media.istockphoto.com/id/1295916972/es/foto/el-f%C3%BAtbol-es-mi-vida.jpg?s=612x612&w=0&k=20&c=gLYUOQvx_5_z2f32LXunhdCHVS1V0wl9w9TD7tkttMY=",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100)))
];
