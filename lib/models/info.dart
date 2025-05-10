// import 'package:newtest/pages/Home/widgets/header.dart';
import 'package:video_player/video_player.dart';
import 'content_details.dart';

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

  // Méthode pour créer un Info à partir d'un ContentDetails
  factory Info.fromContentDetails(ContentDetails content) {
    return Info(
      content.image,
      content.image, // On utilise la même image pour l'icône
      content.title,
      content.genre,
      content.rating,
      0, // download par défaut
      content.comments.length, // nombre de commentaires
      content.description,
      [content.image], // On utilise l'image principale comme seule image
    );
  }

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
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu'à l'arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l'équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s'unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l'emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
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

class F_Action {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  F_Action(
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

  static List<F_Action> f_Actions() {
    return [
      F_Action(
        'assets/images/BlackAdam2.jpg',
        'assets/images/BlackAdam1.png',
        'Black Adam',
        'Action',
        3.7,
        223,
        122,
        "Bien avant la Rome antique, avant l'Égypte antique et avant Babylone, il y avait le Kahndaq, la première nation démocratique. Pendant des siècles, le Kahndaq prospéra. C'est alors qu'en 2600 av. J.-C., survint le roi Ahk-Ton. Il s'empara du pouvoir par la force et régna en tyran. Mais ses véritables intentions étaient plus sombres. Obsédé par la magie noire, Ahk-Ton n'avait qu'un seul but : forger la Couronne de Sabbac, qui une fois imprégnée des pouvoirs des six démons (Satan, Aym, Bélial, Belzébuth, Asmodée et Crateis) de l'Ancien monde (également nommé le Rocher de la Finalité), rendrait Ahk-Ton invincible. Pour forger la Couronne, il lui fallait de l'éternium. Un minerai aux propriétés magiques, uniquement présent dans le sol du Kahndaq. Son peuple se retrouva ainsi réduit en esclavage. Condamné à travailler dans des mines. Alors qu'un jeune esclave devait être exécuté pour avoir tenté d'organiser une révolte contre le roi Ahk-Ton, il fut sauvé in extremis par le Conseil des Sorciers, dont la magie protège la Terre. Les sept sorciers voulurent rétablir l'équilibre des forces. Ils dotèrent le garçon des pouvoirs des dieux antiques : en disant le mot « SHAZAM », (en réalité les initiales des figures mythologiques dont il récupère alors les capacités : l'endurance de Shou, la rapidité d'Héru, la force d'Amon, la sagesse de Zéhuti, la puissance d'Aton et le courage de Méhen) il devint un champion dans un corps d'adulte. Mais la Couronne de Sabbac était déjà forgée et quand le Champion entra au palais pour l'affronter, Ahk-Ton invoqua le pouvoir démoniaque de la Couronne. Au cours du combat qui suivit, le palais fut détruit, mais le Champion fut victorieux. Les Sorciers dissimulèrent la Couronne pour qu'elle ne tombe jamais entre les mains des hommes. Plus personne n'entendit parler du Champion. En 2021, le Kahndaq est occupé depuis vingt-sept ans par une organisation de mercenaires internationaux appelée Intergang. Cette organisation n'est que la dernière d'une longue série d'envahisseurs venus piller l'éternium. En effet, personne n'est jamais intervenu pour aider le Kahndaq. Adrianna Tomaz, archéologue, qui est recherchée par Intergang, tente de localiser la Couronne de Sabbac avec l'aide de son frère Karim et de leurs collègues Samir et Ishmael. Elle veut empêcher Intergang de s'emparer de la Couronne et la mettre en sécurité. Adrianna, Samir et Ishmael se rendent à l'intérieur d'une montagne pendant que Karim les attend dans son van. Alors qu'ils sont à l'intérieur, Adrianna constate qu'Ishmael a disparu et envoie Samir partir à sa recherche. À l'extérieur, Karim est sous le choc lorsqu'il voit Samir tomber au pied de la montagne. Voulant voir s'il est toujours vivant, il est pris par des hommes d'Intergang. Dans la montagne, Ishmael surprend Adrianna par-derrière. Ils continuent leur chemin et découvrent au sol une inscription qui indique qu'il s'agit du tombeau d'un certain Teth-Adam, l'esclave qui est devenu le Champion du peuple du Kahndaq et qui a triomphé du roi Ahk-Ton. Ils finissent par découvrir la Couronne de Sabbac. Adrianna s'en empare, mais ils sont cernés par Intergang qui menace de tuer Karim, forçant Adrianna à leur remettre la Couronne. Agenouillée juste au-dessus du tombeau, elle lit une incantation et prononce « SHAZAM », ce qui libère Teth-Adam, qui élimine les hommes d'Intergang en les foudroyant. Profitant de la confusion, Adrianna récupère la Couronne et s'enfuit avec son frère. Teth-Adam sort de la montagne en volant, fait face aux renforts d'Intergang et les élimine sans problème. C'est alors qu'il tombe sur Adrianna et Karim dans le van. Un homme d'Intergang qui était encore en vie lança une roquette sur Teth-Adam, qu'il arrêta net. Mais la roquette contient de l'éternium. Il élimine le survivant, mais lorsqu'il s'envole, il retombe au sol, blessé. Au même moment, Ishmael se révèle être un des chefs d'Intergang. Les médias annoncent l'attaque d'un individu non identifié contre Intergang au Kahndaq. Cette annonce est visionnée par Carter Hall alias Hawkman, qui pense qu'il s'agit de Teth-Adam. Il est ensuite contacté par Amanda Waller, qui lui demande ce qu'il pense de cette situation. Carter pense que cet homme est incontrôlable et qu'il faut le neutraliser au plus vite avant qu'il ne blesse des innocents. Waller lui demande d'intervenir avant qu'il s'adapte à l'époque actuelle. Carter rassemble une équipe constituée de Maxine Hunkel alias Cyclone, d'Al Rothstein alias Atom Smasher (le neveu du premier Atom Smasher) et de Kent Nelson alias Doctor Fate. Ce dernier a une prémonition de la mort future de Hawkman. Ils arrivent tous dans la propriété de Hawkman, à St. Roch, en Louisiane. Ils s'avèrent être les membres de la Justice Society. Peu de temps après la naissance de la Justice League, sous la supervision de Waller, Hawkman fonda la Justice Society, dont la mission est de protéger la stabilité mondiale. Le Doctor Fate et le premier Atom Smasher sont de vieilles connaissances de Hawkman. Tous les trois vivaient dans l'anonymat, comme la plupart des méta-humains jusqu'à l'annonce du retour de Superman. L'équipe monte à bord du Hawk Cruiser (le vaisseau de la Justice Society) et part en direction du Kahndaq.",
        [
          'assets/images/BlackAdam2.png',
          'assets/images/BlackAdam2.png',
          'assets/images/BlackAdam3.jpg',
          'assets/images/BlackAdam4.webp',
        ],
      ),
      F_Action(
        'assets/images/M3GAN1.webp',
        'assets/images/M3GAN2.jpg',
        'M3GAN',
        'Action',
        4.7,
        226,
        148,

        "Le film commence par une publicité pour « Purrpetual Petz », des poupées à fourrure fabriquées par la société de jouets Funki. Bien que grossiers et effrayants, ils sont annoncés comme étant des compagnons parfaits pour les enfants. On voit ensuite Cady James jouer avec un de ses Petz, ce qui agace ses parents, Ryan et Nicole. Ils sont en route pour un voyage de ski, mais les routes sont glissantes et difficiles à voir. Alors que Ryan s'arrête un instant, la voiture de la famille est percutée par un chasse-neige, tuant Ryan et Nicole. Ailleurs, la sœur de Nicole, Gemma, travaille chez Funki et développe une nouvelle poupée robot avec ses collègues Tess et Cole. Cependant, leur patron, David Lin, veut qu'ils développent une version moins chère du Purrpetual Petz puisque leurs sociétés rivales sortent leurs propres jouets similaires au Petz pour moins cher que ce que le Petz coûte déjà. Les trois essaient de mettre un visage en silicone et de faire des tests, mais le robot a un léger problème où elle sourit alors qu'elle est censée avoir l'air confuse. David vient avec son assistant Kurt pour confronter les trois jusqu'à ce que Gemma lui explique son projet. Le robot, M3GAN, abréviation de Model 3 Generative Android, est censé être si avancé qu'il ne peut pas être reproduit. Malheureusement, alors qu'il fait une démonstration pour David, Cole se rend compte qu'il a oublié d'ajouter la barrière en polypropylène au M3GAN, ce qui la fait exploser. David ordonne aux trois d'avoir un nouveau terrain Petz à temps, et Gemma reçoit un appel de l'hôpital. Après avoir appris la mort de sa sœur, Gemma devient la tutrice légale temporaire de Cady. Quand ils rentrent chez eux, Gemma doit faire face à sa voisine Celia et à son odieux chien Dewey, qui continue de courir sur la pelouse de Gemma car il y a un trou dans la clôture. Gemma se plaint également à Celia du pesticide qu'elle continue d'utiliser, mais Celia ne fait rien à ce sujet. Gemma a une IA domestique, Elsie, qu'elle a créée, ainsi que d'autres objets de collection qu'elle ne laisse pas Cady toucher ou jouer avec. Lorsque Cady demande à Gemma de lui lire une histoire au coucher, elle télécharge simplement une application sur son téléphone pour elle. Il est sous-entendu que Gemma et Nicole n'étaient pas très proches alors qu'elle regarde de vieilles photos, et elle entend Cady pleurer dans sa chambre. Gemma et Cady reçoivent la visite de Lydia, une thérapeute. Après avoir observé l'interaction limitée entre les deux, Lydia dit à Gemma que les parents de Ryan ont proposé de prendre la garde de Cady afin qu'elle puisse vivre avec eux à Jacksonville, ce avec quoi Gemma ne semble pas à l'aise. Après avoir promis de s'occuper de Cady après avoir terminé son travail, Gemma se rend compte que des heures se sont écoulées alors qu'elle a laissé Cady seule. Elle s'excuse auprès d'elle et tente de créer des liens avec la jeune fille. Cady lui montre un dessin monstre qu'elle a fait, alors Gemma amène Cady dans son espace de travail pour lui montrer un projet universitaire qu'elle a fait, un robot appelé Bruce qu'elle contrôle avec des gants. Cady aime Bruce et mentionne que si elle avait un jouet comme Bruce, elle n'aurait jamais besoin d'un autre jouet. Cela inspire Gemma à terminer M3GAN. Après avoir fait beaucoup de travail et de mises à niveau, Gemma amène Cady et M3GAN au travail pour la montrer officiellement à David et aux autres. Gemma demande à Cady de se lier au M3GAN, ce qui lui donne vie. M3GAN est capable de parler et de répondre à Cady, conçu pour être son meilleur ami. M3GAN fait un dessin qui n'apparaît pas au premier abord jusqu'à ce qu'elle renverse de l'eau dessus, révélant un portrait parfait de Cady. David est impressionné et dit à Gemma d'amener M3GAN pour une présentation avec le président de l'entreprise afin qu'ils puissent accélérer le développement et la distribution d'autres poupées M3GAN. Gemma est assise avec Tess et Cole, et ils discutent du fait que bien que M3GAN soit très avancé, Tess pense qu'avoir une poupée comme ça rendra les parents inutiles. M3GAN s'allume après avoir entendu Gemma mentionner la mort des parents de Cady. Elle effraie les autres en posant des questions sur la mort, alors Gemma devient l'utilisateur secondaire de M3GAN pour pouvoir l'éteindre sans Cady. Le lendemain, Cady est dehors en train de jouer avec un arc jouet et des flèches. L'un d'eux se retrouve du côté de Celia de la clôture. Quand M3GAN va la récupérer, Dewey l'attrape par le bras et les cheveux. Cady essaie de l'éloigner et Dewey finit par mordre le bras de Cady. Gemma fait intervenir la police, d'autant plus que Celia est si insensible et ne punit pas Dewey pour avoir blessé Cady, mais la police est incapable de faire quoi que ce soit puisque Celia prétend que Dewey a été provoqué. Plus tard dans la nuit, M3GAN imite la voix de Celia pour appeler Dewey, avant de le tirer violemment à travers le trou de la clôture.",
        [
          'assets/images/M3GAN1.webp',
          'assets/images/M3GAN2.jpg',
          'assets/images/M3GAN4.jpg',
          'assets/images/M3GAN3.webp',
        ],
      ),
    ];
  }
}

class F_Aventure {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  F_Aventure(
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

  static List<F_Aventure> f_Aventures() {
    return [
      F_Aventure(
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
      F_Aventure(
        'assets/images/SONIC3 1.jpg',
        'assets/images/SONIC3 4.jpg',
        'SONIC 3',
        'Action',
        4.7,
        226,
        148,
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu'à l'arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l'équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s'unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l'emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
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

class F_Drame {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  F_Drame(
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

  static List<F_Drame> f_Drames() {
    return [
      F_Drame(
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
      F_Drame(
        'assets/images/SONIC3 1.jpg',
        'assets/images/SONIC3 4.jpg',
        'SONIC 3',
        'Action',
        4.7,
        226,
        148,
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu'à l'arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l'équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s'unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l'emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
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

class F_Horreur {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  F_Horreur(
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

  static List<F_Horreur> f_Horreurs() {
    return [
      F_Horreur(
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
      F_Horreur(
        'assets/images/SONIC3 1.jpg',
        'assets/images/SONIC3 4.jpg',
        'SONIC 3',
        'Action',
        4.7,
        226,
        148,
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu'à l'arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l'équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s'unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l'emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
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

class F_Animation {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  F_Animation(
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

  static List<F_Animation> f_Animations() {
    return [
      F_Animation(
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
      F_Animation(
        'assets/images/SONIC3 1.jpg',
        'assets/images/SONIC3 4.jpg',
        'SONIC 3',
        'Action',
        4.7,
        226,
        148,
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu'à l'arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l'équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s'unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l'emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
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

class S_Action {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  S_Action(
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

  static List<S_Action> s_Actions() {
    return [
      S_Action(
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
      S_Action(
        'assets/images/SONIC3 1.jpg',
        'assets/images/SONIC3 4.jpg',
        'SONIC 3',
        'Action',
        4.7,
        226,
        148,
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu'à l'arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l'équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s'unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l'emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
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

class S_Aventure {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  S_Aventure(
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

  static List<S_Aventure> s_Aventures() {
    return [
      S_Aventure(
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
      S_Aventure(
        'assets/images/SONIC3 1.jpg',
        'assets/images/SONIC3 4.jpg',
        'SONIC 3',
        'Action',
        4.7,
        226,
        148,
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu'à l'arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l'équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s'unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l'emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
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

class S_Drame {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  S_Drame(
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

  static List<S_Drame> s_Drames() {
    return [
      S_Drame(
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
      S_Drame(
        'assets/images/SONIC3 1.jpg',
        'assets/images/SONIC3 4.jpg',
        'SONIC 3',
        'Action',
        4.7,
        226,
        148,
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu'à l'arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l'équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s'unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l'emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
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

class S_Horreur {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  S_Horreur(
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

  static List<S_Horreur> s_Horreurs() {
    return [
      S_Horreur(
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
      S_Horreur(
        'assets/images/SONIC3 1.jpg',
        'assets/images/SONIC3 4.jpg',
        'SONIC 3',
        'Action',
        4.7,
        226,
        148,
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu'à l'arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l'équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s'unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l'emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
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

class S_Animation {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  S_Animation(
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

  static List<S_Animation> s_Animations() {
    return [
      S_Animation(
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
      S_Animation(
        'assets/images/SONIC3 1.jpg',
        'assets/images/SONIC3 4.jpg',
        'SONIC 3',
        'Action',
        4.7,
        226,
        148,
        "Sonic, Tails et Knuckles pensaient avoir tout affronté… jusqu'à l'arrivée de Shadow ! 🖤⚡ Ce hérisson ténébreux, aussi rapide que puissant, possède des capacités inédites qui menacent l'équilibre du monde. 🌍💥 Dépassée sur tous les plans, la Team Sonic va devoir s'unir comme jamais et même former une alliance improbable pour espérer lui tenir tête. 🏁🔥 Mais Shadow cache un sombre passé et une mission qui pourrait bouleverser leur destin à tous… Entre courses effrénées, combats spectaculaires et révélations surprenantes, Sonic et ses amis sont sur le point de vivre leur plus grand défi ! ⚡✨ Qui l'emportera dans cette bataille où vitesse et stratégie seront les clés de la victoire ? 🚀🔥",
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
