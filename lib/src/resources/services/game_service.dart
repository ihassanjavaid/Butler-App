import 'http_request.dart';

class GameService{

  Future<GameSearchResult> getGamesSearch(String query) async {
    final url = "https://api.rawg.io/api/games?search=$query";

    final gameSearchResponse = await getData(url);

    GameSearchResult gameSearchResult = GameSearchResult.fromJson(
        gameSearchResponse);
    return gameSearchResult;
  }
}

class GameSearchResult {
  int count;
  String next;
  Null previous;
  List<GameResults> results;
  bool userPlatforms;

  GameSearchResult(
      {this.count, this.next, this.previous, this.results, this.userPlatforms});

  GameSearchResult.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<GameResults>();
      json['results'].forEach((v) {
        results.add(new GameResults.fromJson(v));
      });
    }
    userPlatforms = json['user_platforms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['user_platforms'] = this.userPlatforms;
    return data;
  }
}

class GameResults {
  String slug;
  String name;
  int playtime;
  List<Platforms> platforms;
  List<Stores> stores;
  String released;
  bool tba;
  String backgroundImage;
  double rating;
  int ratingTop;
  List<Ratings> ratings;
  int ratingsCount;
  int reviewsTextCount;
  int added;
  AddedByStatus addedByStatus;
  int metacritic;
  int suggestionsCount;
  String updated;
  int id;
  String score;
  Clip clip;
  List<Tags> tags;
  EsrbRating esrbRating;
  Null userGame;
  int reviewsCount;
  int communityRating;
  String saturatedColor;
  String dominantColor;
  List<ShortScreenshots> shortScreenshots;

  GameResults(
      {this.slug,
        this.name,
        this.playtime,
        this.platforms,
        this.stores,
        this.released,
        this.tba,
        this.backgroundImage,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.ratingsCount,
        this.reviewsTextCount,
        this.added,
        this.addedByStatus,
        this.metacritic,
        this.suggestionsCount,
        this.updated,
        this.id,
        this.score,
        this.clip,
        this.tags,
        this.esrbRating,
        this.userGame,
        this.reviewsCount,
        this.communityRating,
        this.saturatedColor,
        this.dominantColor,
        this.shortScreenshots});

  GameResults.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    playtime = json['playtime'];
    if (json['platforms'] != null) {
      platforms = new List<Platforms>();
      json['platforms'].forEach((v) {
        platforms.add(new Platforms.fromJson(v));
      });
    }
    if (json['stores'] != null) {
      stores = new List<Stores>();
      json['stores'].forEach((v) {
        stores.add(new Stores.fromJson(v));
      });
    }
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    if (json['ratings'] != null) {
      ratings = new List<Ratings>();
      json['ratings'].forEach((v) {
        ratings.add(new Ratings.fromJson(v));
      });
    }
    ratingsCount = json['ratings_count'];
    reviewsTextCount = json['reviews_text_count'];
    added = json['added'];
    addedByStatus = json['added_by_status'] != null
        ? new AddedByStatus.fromJson(json['added_by_status'])
        : null;
    metacritic = json['metacritic'];
    suggestionsCount = json['suggestions_count'];
    updated = json['updated'];
    id = json['id'];
    score = json['score'];
    clip = json['clip'] != null ? new Clip.fromJson(json['clip']) : null;
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    esrbRating = json['esrb_rating'] != null
        ? new EsrbRating.fromJson(json['esrb_rating'])
        : null;
    userGame = json['user_game'];
    reviewsCount = json['reviews_count'];
    communityRating = json['community_rating'];
    saturatedColor = json['saturated_color'];
    dominantColor = json['dominant_color'];
    if (json['short_screenshots'] != null) {
      shortScreenshots = new List<ShortScreenshots>();
      json['short_screenshots'].forEach((v) {
        shortScreenshots.add(new ShortScreenshots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['playtime'] = this.playtime;
    if (this.platforms != null) {
      data['platforms'] = this.platforms.map((v) => v.toJson()).toList();
    }
    if (this.stores != null) {
      data['stores'] = this.stores.map((v) => v.toJson()).toList();
    }
    data['released'] = this.released;
    data['tba'] = this.tba;
    data['background_image'] = this.backgroundImage;
    data['rating'] = this.rating;
    data['rating_top'] = this.ratingTop;
    if (this.ratings != null) {
      data['ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    data['ratings_count'] = this.ratingsCount;
    data['reviews_text_count'] = this.reviewsTextCount;
    data['added'] = this.added;
    if (this.addedByStatus != null) {
      data['added_by_status'] = this.addedByStatus.toJson();
    }
    data['metacritic'] = this.metacritic;
    data['suggestions_count'] = this.suggestionsCount;
    data['updated'] = this.updated;
    data['id'] = this.id;
    data['score'] = this.score;
    if (this.clip != null) {
      data['clip'] = this.clip.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.esrbRating != null) {
      data['esrb_rating'] = this.esrbRating.toJson();
    }
    data['user_game'] = this.userGame;
    data['reviews_count'] = this.reviewsCount;
    data['community_rating'] = this.communityRating;
    data['saturated_color'] = this.saturatedColor;
    data['dominant_color'] = this.dominantColor;
    if (this.shortScreenshots != null) {
      data['short_screenshots'] =
          this.shortScreenshots.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Platforms {
  Platform platform;

  Platforms({this.platform});

  Platforms.fromJson(Map<String, dynamic> json) {
    platform = json['platform'] != null
        ? new Platform.fromJson(json['platform'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.platform != null) {
      data['platform'] = this.platform.toJson();
    }
    return data;
  }
}

class Platform {
  int id;
  String name;
  String slug;

  Platform({this.id, this.name, this.slug});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Stores {
  Platform store;

  Stores({this.store});

  Stores.fromJson(Map<String, dynamic> json) {
    store = json['store'] != null ? new Platform.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.store != null) {
      data['store'] = this.store.toJson();
    }
    return data;
  }
}

class Ratings {
  int id;
  String title;
  int count;
  double percent;

  Ratings({this.id, this.title, this.count, this.percent});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    count = json['count'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['count'] = this.count;
    data['percent'] = this.percent;
    return data;
  }
}

class AddedByStatus {
  int toplay;
  int yet;
  int owned;
  int beaten;
  int dropped;
  int playing;

  AddedByStatus(
      {this.toplay,
        this.yet,
        this.owned,
        this.beaten,
        this.dropped,
        this.playing});

  AddedByStatus.fromJson(Map<String, dynamic> json) {
    toplay = json['toplay'];
    yet = json['yet'];
    owned = json['owned'];
    beaten = json['beaten'];
    dropped = json['dropped'];
    playing = json['playing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toplay'] = this.toplay;
    data['yet'] = this.yet;
    data['owned'] = this.owned;
    data['beaten'] = this.beaten;
    data['dropped'] = this.dropped;
    data['playing'] = this.playing;
    return data;
  }
}

class Clip {
  String clip;
  Clips clips;
  String video;
  String preview;

  Clip({this.clip, this.clips, this.video, this.preview});

  Clip.fromJson(Map<String, dynamic> json) {
    clip = json['clip'];
    clips = json['clips'] != null ? new Clips.fromJson(json['clips']) : null;
    video = json['video'];
    preview = json['preview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clip'] = this.clip;
    if (this.clips != null) {
      data['clips'] = this.clips.toJson();
    }
    data['video'] = this.video;
    data['preview'] = this.preview;
    return data;
  }
}

class Clips {
  String s320;
  String s640;
  String full;

  Clips({this.s320, this.s640, this.full});

  Clips.fromJson(Map<String, dynamic> json) {
    s320 = json['320'];
    s640 = json['640'];
    full = json['full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['320'] = this.s320;
    data['640'] = this.s640;
    data['full'] = this.full;
    return data;
  }
}

class Tags {
  int id;
  String name;
  String slug;
  String language;
  int gamesCount;
  String imageBackground;

  Tags(
      {this.id,
        this.name,
        this.slug,
        this.language,
        this.gamesCount,
        this.imageBackground});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    language = json['language'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['language'] = this.language;
    data['games_count'] = this.gamesCount;
    data['image_background'] = this.imageBackground;
    return data;
  }
}

class EsrbRating {
  int id;
  String name;
  String slug;
  String nameEn;
  String nameRu;

  EsrbRating({this.id, this.name, this.slug, this.nameEn, this.nameRu});

  EsrbRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['name_en'] = this.nameEn;
    data['name_ru'] = this.nameRu;
    return data;
  }
}

class ShortScreenshots {
  int id;
  String image;

  ShortScreenshots({this.id, this.image});

  ShortScreenshots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
