class FirebaseJson {

  String date;
  num caseNo;

  // Cases
  num caseTotal;
  num caseActive;
  num caseBefore;
  num caseToday;

  // Active
      // ALBAY
  num activeALBAY;
  num activeLegazpi;

      // CAMNORTE
  num activeCAMNORTE;

      // CAMSUR
  num activeCAMSUR;

      // CATANDUANES
  num activeCATANDUANES;

      // MASBATE
  num activeMASBATE;

      // SORSOGON
  num activeSORSOGON;

  num activeOthers;

  // Recoveries
  num recoveriesTotal;
  num recoveriesToday;

  num recoveriesALBAY;
  num recoveriesCAMNORTE;
  num recoveriesCAMSUR;
  num recoveriesCATANDUANES;
  num recoveriesMASBATE;
  num recoveriesSORSOGON;

  num recoveriesLegazpi;
  num recoveriesNaga;

  // Deaths
  num deathsTotal;
  num deathsBefore;
  num deathsOthers;

  num deathsALBAY;
  num deathsCAMNORTE;
  num deathsCAMSUR;
  num deathsCATANDUANES;
  num deathsMASBATE;
  num deathsSORSOGON;

  num deathsLegazpi;
  num deathsNaga;

  // Tests
  num testsTotal;
  num testsOthers;

  num testsBRDL;
  num testsBMC;
  num testsMetro;

  num testsALBAY;
  num testsCAMNORTE;
  num testsCAMSUR;
  num testsCATANDUANES;
  num testsMASBATE;
  num testsSORSOGON;

  num testsLegazpi;
  num testsNaga;


  FirebaseJson({

    this.date,
    this.caseNo,

    // Cases
    this.caseTotal,
    this.caseActive,
    this.caseBefore,
    this.caseToday,

    // Active
        // ALBAY
    this.activeALBAY,
    this.activeLegazpi,

        // CAMNORTE
    this.activeCAMNORTE,

        // CAMSUR
    this.activeCAMSUR,

        // CATANDUANES
    this.activeCATANDUANES,

        // MASBATE
    this.activeMASBATE,

        // SORSOGON
    this.activeSORSOGON,

    this.activeOthers,

    // Recoveries
    this.recoveriesTotal,
    this.recoveriesToday,

    this.recoveriesALBAY,
    this.recoveriesCAMNORTE,
    this.recoveriesCAMSUR,
    this.recoveriesCATANDUANES,
    this.recoveriesMASBATE,
    this.recoveriesSORSOGON,

    this.recoveriesLegazpi,
    this.recoveriesNaga,

    // Deaths
    this.deathsTotal,
    this.deathsBefore,
    this.deathsOthers,

    this.deathsALBAY,
    this.deathsCAMNORTE,
    this.deathsCAMSUR,
    this.deathsCATANDUANES,
    this.deathsMASBATE,
    this.deathsSORSOGON,

    this.deathsLegazpi,
    this.deathsNaga,

    // Tests
    this.testsTotal,
    this.testsOthers,

    this.testsBRDL,
    this.testsBMC,
    this.testsMetro,

    this.testsALBAY,
    this.testsCAMNORTE,
    this.testsCAMSUR,
    this.testsCATANDUANES,
    this.testsMASBATE,
    this.testsSORSOGON,

    this.testsLegazpi,
    this.testsNaga,

  });

  FirebaseJson.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    caseNo = json['caseNo'];

    // Cases
    caseTotal = json['cTotal'];
    caseActive = json['cActive'];
    caseBefore = json['cBefore'];
    caseToday = json['cToday'];

    // Active
        // ALBAY
    activeALBAY = json['aAlbay'];
    activeLegazpi = json['aLegazpi'];

        // CAMNORTE
    activeCAMNORTE = json['aCAMNORTE'];

        // CAMSUR
    activeCAMSUR = json['aCAMSUR'];

        // CATANDUANES
    activeCATANDUANES = json['aCATANDUANES'];

        // MASBATE
    activeMASBATE = json['aMASBATE'];

        // SORSOGON
    activeSORSOGON = json['aSORSOGON'];

    activeOthers = json['aOthers'];

        // Recoveries
    recoveriesTotal = json['rTotal'];
    recoveriesToday = json['tToday'];

    recoveriesALBAY = json['rALBAY'];
    recoveriesCAMNORTE = json['rCAMNORTE'];
    recoveriesCAMSUR = json['CAMSUR'];
    recoveriesCATANDUANES = json['rCATANDUANES'];
    recoveriesMASBATE = json['rMASBATE'];
    recoveriesSORSOGON = json['rSORSOGON'];

    recoveriesLegazpi = json['rLegazpi'];
    recoveriesNaga = json['rNaga'];

    // Deaths

    deathsTotal = json['dTotal'];
    deathsBefore = json['dBefore'];
    deathsOthers = json['dOthers'];

    deathsALBAY = json['dALBAY'];
    deathsCAMNORTE = json['dCAMNORTE'];
    deathsCAMSUR = json['dCAMSUR'];
    deathsCATANDUANES = json['dCATANDUANES'];
    deathsMASBATE = json['dMASBATE'];
    deathsSORSOGON = json['dSORSOGON'];

    deathsLegazpi = json['dLEGAZPI'];
    deathsNaga = json['dNAGA'];

    // Tests
    testsTotal = json['tTotal'];
    testsOthers = json['tOthers'];

    testsBRDL = json['tBRDRL'];
    testsBMC = json['tBMC'];
    testsMetro = json['tMetro'];

    testsALBAY = json['tALBAY'];
    testsCAMNORTE = json['tCAMNORTE'];
    testsCAMSUR = json['tCAMSUR'];
    testsCATANDUANES = json['tCATANDUANES'];
    testsMASBATE = json['tMASBATE'];
    testsSORSOGON = json['tSORSOGON'];

    testsLegazpi = json['tLegazpi'];
    testsNaga = json['tNaga'];

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic> ();

    data['date'] = this.date;
    data['caseNo'] = this.caseNo;

    // Cases
    data['cTotal'] = this.caseTotal;
    data['cActive'] = this.caseActive;
    data['cBefore'] = this.caseBefore;
    data['cToday'] = this.caseToday;

    // Active
    // ALBAY
    data['aAlbay'] = this.activeALBAY;
    data['aLegazpi'] = this.activeLegazpi;

    // CAMNORTE
    data['aCAMNORTE'] = this.activeCAMNORTE;

    // CAMSUR
    data['aCAMSUR'] = this.activeCAMSUR;

    // CATANDUANES
    data['aCATANDUANES'] = this.activeCATANDUANES;

    // MASBATE
    data['aMASBATE'] = this.activeMASBATE;

    // SORSOGON
    data['aSORSOGON'] = this.activeSORSOGON;

    data['aOthers'] = this.activeOthers;

    // Recoveries
    data['rTotal'] = this.recoveriesTotal;
    data['tToday'] = this.recoveriesToday;

    data['rALBAY'] = this.recoveriesALBAY;
    data['rCAMNORTE'] = this.recoveriesCAMNORTE;
    data['CAMSUR'] = this.recoveriesCAMSUR;
    data['rCATANDUANES'] = this.recoveriesCATANDUANES;
    data['rMASBATE'] = this.recoveriesMASBATE;
    data['rSORSOGON'] = this.recoveriesSORSOGON;

    data['rLegazpi'] = this.recoveriesLegazpi;
    data['rNaga'] = this.recoveriesNaga;

    // Deaths

    data['dTotal'] = this.deathsTotal;
    data['dBefore'] = this.deathsBefore;
    data['dOthers'] = this.deathsOthers;

    data['dALBAY'] = this.deathsALBAY;
    data['dCAMNORTE'] = this.deathsCAMNORTE;
    data['dCAMSUR'] = this.deathsCAMSUR;
    data['dCATANDUANES'] = this.deathsCATANDUANES;
    data['dMASBATE'] = this.deathsMASBATE;
    data['dSORSOGON'] = this.deathsSORSOGON;

    data['dLEGAZPI'] = this.deathsLegazpi;
    data['dNAGA'] = this.deathsNaga;

    // Tests
    data['tTotal'] = this.testsTotal;
    data['tOthers'] = this.testsOthers;

    data['tBRDRL'] = this.testsBRDL;
    data['tBMC'] = this.testsBMC;
    data['tMetro'] = this.testsMetro;

    data['tALBAY'] = this.testsALBAY;
    data['tCAMNORTE'] = this.testsCAMNORTE;
    data['tCAMSUR'] = this.testsCAMSUR;
    data['tCATANDUANES'] = this.testsCATANDUANES;
    data['tMASBATE'] = this.testsMASBATE;
    data['tSORSOGON'] = this.testsSORSOGON;

    data['tLegazpi'] = this.testsLegazpi;
    data['tNaga'] = this.testsNaga;

    // TO ADD: Positive and Negative

    return data;
  }
}