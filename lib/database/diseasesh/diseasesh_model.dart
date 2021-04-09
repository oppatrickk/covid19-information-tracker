class RandomJson {
  int cases;
  int deaths;
  int recovered;

  int todayCases;
  int todayDeaths;
  int todayRecovered;

  int active;
  int critical;
  int tests;

  num casesPerOneMillion;
  num deathsPerOneMillion;
  num recoveredPerOneMillion;

  num activePerOneMillion;
  num criticalPerOneMillion;
  num testsPerOneMillion;

  int population;
  String country;

  RandomJson({
    this.cases,
    this.deaths,
    this.recovered,

    this.todayCases,
    this.todayDeaths,
    this.todayRecovered,

    this.active,
    this.critical,
    this.tests,

    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.recoveredPerOneMillion,

    this.activePerOneMillion,
    this.criticalPerOneMillion,
    this.testsPerOneMillion,

    this.population,
    this.country,
  });

  RandomJson.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];

    todayCases = json['todayCases'];
    todayDeaths = json['todayDeaths'];
    todayRecovered = json['todayRecovered'];

    active = json['active'];
    critical = json['critical'];
    tests = json['tests'];

    casesPerOneMillion = json['casesPerOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'];
    recoveredPerOneMillion = json['recoveredPerOneMillion'];

    activePerOneMillion = json['activePerOneMillion'];
    criticalPerOneMillion = json['criticalPerOneMillion'];
    testsPerOneMillion = json['testsPerOneMillion'];

    population = json['population'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;

    data['todayCases'] = this.todayCases;
    data['todayDeaths'] = this.todayDeaths;
    data['todayRecovered'] = this.todayRecovered;

    data['active'] = this.active;
    data['critical'] = this.critical;
    data['tests'] = this.tests;

    data['casesPerOneMillion'] = this.casesPerOneMillion;
    data['deathsPerOneMillion'] = this.deathsPerOneMillion;
    data['recoveredPerOneMillion'] = this.recoveredPerOneMillion;

    data['activePerOneMillion'] = this.activePerOneMillion;
    data['criticalPerOneMillion'] = this.criticalPerOneMillion;
    data['testsPerOneMillion'] = this.testsPerOneMillion;

    data['population'] = this.population;
    data['country'] = this.country;

    return data;
  }
}