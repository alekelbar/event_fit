import 'package:event_fit/infrastructure/models/publish.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final List<Publish> publishData = [
  Publish(
      id: "001",
      name: "¡De paseo!",
      siteDescription: "En una playa de méxico",
      imageUrl:
          "https://th.bing.com/th/id/OIP.kledA06j2arvt0d3ndXciAHaNK?pid=ImgDet&rs=1",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100))),
  Publish(
      id: "002",
      name: "¡Increible!",
      siteDescription: "Visitando un lugar de ensueño",
      imageUrl:
          "https://thenorthernboy.com/wp-content/uploads/2020/03/top-Lake-District-accomodation-683x1024.png",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100))),
  Publish(
      id: "002",
      name: "De pelicula",
      siteDescription: "el agua parece un cristal",
      imageUrl:
          "https://thumbs.dreamstime.com/b/jacques-cartier-provincial-park-7674763.jpg",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100))),
  Publish(
      id: "002",
      name: "¿Te vienes?",
      siteDescription: "Un tranquilo día de pesca",
      imageUrl: "https://i.redd.it/4lbqx4c7ggmz.jpg",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100))),
  Publish(
      id: "002",
      name: "El atardecer",
      siteDescription: "No hay mejor momento para relajarse",
      imageUrl:
          "https://i.pinimg.com/originals/cc/ce/60/ccce60b01fd0db4ff32e563c77c15dbd.jpg",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100))),
  Publish(
      id: "002",
      name: "¿Viste?",
      siteDescription:
          "Es como si el sol se escondiera literalmente tras la montaña",
      imageUrl:
          "https://i.pinimg.com/originals/ff/71/21/ff712154380202b84ef55f9d9f0b2c59.jpg",
      type: DynamicEvent(
          pointOne: const LatLng(100, 100), pointTwo: const LatLng(100, 100)))
];
