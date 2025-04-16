import 'package:newtest/pages/Home/widgets/header.dart';

class Info {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  Info(
    this.bgImage,
    this.icon,
    this.name,
    this.type,
    this.score,
    this.download,
    this.review,
    this.description,
    this.images,
  );

  static List<Info> infos() {
    return [
      Info(
        'assets/images/HOUSE 1.jpg',
        'assets/images/HOUSE 2.jpg',
        'The Haunting of Hill House',
        'Action',
        4.7,
        226,
        148,
        "The Haunting of Hill House est une série d'horreur psychologique créée par Mike Flanagan, diffusée sur Netflix✨. Elle est inspirée du roman classique de Shirley Jackson, mais prend des libertés créatives pour développer l'histoire. L'intrigue se concentre sur la famille Crain, qui a déménagé dans la mystérieuse et hantée Hill House dans le but de rénover la maison pour la revendre. Cependant, leur séjour se transforme rapidement en un cauchemar lorsque des événements surnaturels se produisent.☠ Les Crain sont confrontés à des apparitions effrayantes et à des expériences traumatisantes, qui les marquent profondément à long terme. La série alterne entre deux timelines : l'enfance des membres de la famille dans la maison et leur vie adulte, alors qu'ils tentent de faire face aux traumatismes laissés par leur passé. Au fur et à mesure que l'histoire se déroule, les personnages explorent des thèmes de perte, de chagrin et de la manière dont les traumatismes familiaux peuvent influencer les relations et le présent. La série est saluée pour son atmosphère tendue, ses personnages profonds et son habileté à tisser des récits de peur et d'émotion.🤩",
        [
          'assets/images/HOUSE 1.jpg',
          'assets/images/HOUSE 2.jpg',
          'assets/images/HOUSE 3.jpg',
          'assets/images/HOUSE 4.jpg',
        ],
      ),
      Info(
        'assets/images/SONIC3 1.jpg',
        'assets/images/SONIC3 4.jpg',
        'SONIC 3',
        'Action',
        4.7,
        226,
        148,
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu’à l’arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l’équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s’unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l’emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
        [
          'assets/images/SONIC3 1.jpg',
          'assets/images/SONIC3 5.jpg',
          'assets/images/SONIC3 6.jpg',
          'assets/images/SONIC3 7.jpg',
        ],
      ),
    ];
  }
}

class Info1 {}
