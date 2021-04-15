class FirebaseJson {

  String date;

  String caseNo;

  // Cases
  num caseTotal;
  num caseActive;
  num caseBefore;
  num caseToday;

  // Active
      // ALBAY
  num activeALBAY;
  num activeBacacay;
  num activeCamalig;
  num activeDaraga;
  num activeGuinobatan;
  num activeJovellar;
  num activeLegazpi;
  num activeLibon;
  num activeLigao;
  num activeMalilipot;
  num activeMalinao;
  num activeManito;
  num activeOas;
  num activePioduran;
  num activePolangui;
  num activeRapuRapu;
  num activeSantoDomingo;
  num activeTabaco;
  num activeTiwi;

      // CAMNORTE
  num activeCAMNORTE;
  num activeBasud;
  num activeCapalonga;
  num activeDaet;
  num activeJosePanganiban;
  num activeLabo;
  num activeMercedes;
  num activeParacale;
  num activeSanLorenzo;
  num activeSanVicente;
  num activeSantaElena;
  num activeTalisay;
  num activeVinzons;

      // CAMSUR
  num activeCAMSUR;
  num activeBaao;
  num activeBalatan;
  num activeCamBato;
  num activeBombon;
  num activeBuhi;
  num activeBula;
  num activeCabusao;
  num activeCalabanga;
  num activeCamaligan;
  num activeCanaman;
  num activeCaramoan;
  num activeDelGallego;
  num activeGainza;
  num activeGarchitorena;
  num activeGoa;
  num activeIriga;
  num activeLagonoy;
  num activeLibmanan;
  num activeLupi;
  num activeMagarao;
  num activeMilaor;
  num activeMinalabac;
  num activeNabua;
  num activeNaga;
  num activeOcampo;
  num activePamplona;
  num activePasacao;
  num activePili;
  num activePresentacion;
  num activeRagay;
  num activeSagnay; // enye
  num activeCamSanFernando;
  num activeSanJose;
  num activeSipocot;
  num activeSiruma;
  num activeTigaon;
  num activeTinambac;


      // CATANDUANES
  num activeCATANDUANES;
  num activeBagamanoc;
  num activeBaras;
  num activeCatBato;
  num activeCaramoran;
  num activeGigmoto;
  num activePandan;
  num activePanganiban;
  num activeSanAndres;
  num activeSanMiguel;
  num activeViga;
  num activeVirac;

      // MASBATE
  num activeMASBATE;
  num activeAroroy;
  num activeBaleno;
  num activeBalud;
  num activeBatuan;
  num activeCataingan;
  num activeCawayan;
  num activeClaveria;
  num activeDimasalang;
  num activeEsperanza;
  num activeMandaon;
  num activeMasbateCity;
  num activeMilagros;
  num activeMobo;
  num activeMonreal;
  num activePalanas;
  num activePioCorpuz;
  num activePlacer;
  num activeMasSanFernando;
  num activeSanJacinto;
  num activeSanPascual;
  num activeUson;

      // SORSOGON
  num activeSORSOGON;
  num activeBarcelona;
  num activeBulan;
  num activeBulusan;
  num activeCasiguran;
  num activeCastilla;
  num activeDonsol;
  num activeGubat;
  num activeIrosin;
  num activeJuban;
  num activeMagallanes;
  num activeMatnog;
  num activePilar;
  num activePrietoDiaz;
  num activeSantaMagdalena;
  num activeSorsogonCity;

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
    this.activeBacacay,
    this.activeCamalig,
    this.activeDaraga,
    this.activeGuinobatan,
    this.activeJovellar,
    this.activeLegazpi,
    this.activeLibon,
    this.activeLigao,
    this.activeMalilipot,
    this.activeMalinao,
    this.activeManito,
    this.activeOas,
    this.activePioduran,
    this.activePolangui,
    this.activeRapuRapu,
    this.activeSantoDomingo,
    this.activeTabaco,
    this.activeTiwi,

        // CAMNORTE
    this.activeCAMNORTE,
    this.activeBasud,
    this.activeCapalonga,
    this.activeDaet,
    this.activeJosePanganiban,
    this.activeLabo,
    this.activeMercedes,
    this.activeParacale,
    this.activeSanLorenzo,
    this.activeSanVicente,
    this.activeSantaElena,
    this.activeTalisay,
    this.activeVinzons,

        // CAMSUR
    this.activeCAMSUR,
    this.activeBaao,
    this.activeBalatan,
    this.activeCamBato,
    this.activeBombon,
    this.activeBuhi,
    this.activeBula,
    this.activeCabusao,
    this.activeCalabanga,
    this.activeCamaligan,
    this.activeCanaman,
    this.activeCaramoan,
    this.activeDelGallego,
    this.activeGainza,
    this.activeGarchitorena,
    this.activeGoa,
    this.activeIriga,
    this.activeLagonoy,
    this.activeLibmanan,
    this.activeLupi,
    this.activeMagarao,
    this.activeMilaor,
    this.activeMinalabac,
    this.activeNabua,
    this.activeNaga,
    this.activeOcampo,
    this.activePamplona,
    this.activePasacao,
    this.activePili,
    this.activePresentacion,
    this.activeRagay,
    this.activeSagnay,
    this.activeCamSanFernando,
    this.activeSanJose,
    this.activeSipocot,
    this.activeSiruma,
    this.activeTigaon,
    this.activeTinambac,

        // CATANDUANES
    this.activeCATANDUANES,
    this.activeBagamanoc,
    this.activeBaras,
    this.activeCatBato,
    this.activeCaramoran,
    this.activeGigmoto,
    this.activePandan,
    this.activePanganiban,
    this.activeSanAndres,
    this.activeSanMiguel,
    this.activeViga,
    this.activeVirac,

        // MASBATE
    this.activeMASBATE,
    this.activeAroroy,
    this.activeBaleno,
    this.activeBalud,
    this.activeBatuan,
    this.activeCataingan,
    this.activeCawayan,
    this.activeClaveria,
    this.activeDimasalang,
    this.activeEsperanza,
    this.activeMandaon,
    this.activeMasbateCity,
    this.activeMilagros,
    this.activeMobo,
    this.activeMonreal,
    this.activePalanas,
    this.activePioCorpuz,
    this.activePlacer,
    this.activeMasSanFernando,
    this.activeSanJacinto,
    this.activeSanPascual,
    this.activeUson,

        // SORSOGON
    this.activeSORSOGON,
    this.activeBarcelona,
    this.activeBulan,
    this.activeBulusan,
    this.activeCasiguran,
    this.activeCastilla,
    this.activeDonsol,
    this.activeGubat,
    this.activeIrosin,
    this.activeJuban,
    this.activeMagallanes,
    this.activeMatnog,
    this.activePilar,
    this.activePrietoDiaz,
    this.activeSantaMagdalena,
    this.activeSorsogonCity,

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
    activeALBAY = json['aALBAY'];
    activeBacacay = json['aBacacay'];
    activeCamalig = json['aCamalig'];
    activeDaraga = json['aDaraga'];
    activeGuinobatan = json['aGuinobatan'];
    activeJovellar = json['aJovellar'];
    activeLegazpi = json['aLegazpi'];
    activeLibon = json['aLibon'];
    activeLigao = json['aLigao'];
    activeMalilipot = json['aMalilipot'];
    activeMalinao = json['aMalinao'];
    activeManito = json['Manito'];
    activeOas = json['aOas'];
    activePioduran = json['aPioduran'];
    activePolangui = json['aPolangui'];
    activeRapuRapu = json['aRapurapu'];
    activeSantoDomingo = json['aStoDomingo'];
    activeTabaco = json['aTabaco'];
    activeTiwi = json['aTiwi'];

        // CAMNORTE
    activeCAMNORTE = json['aCAMNORTE'];
    activeBasud = json['aBasud'];
    activeCapalonga = json['aCapalonga'];
    activeDaet = json['aDaet'];
    activeJosePanganiban = json['aJosePanganiban'];
    activeLabo = json['aLabo'];
    activeMercedes = json['aMercedes'];
    activeParacale = json['aParacale'];
    activeSanLorenzo = json['aSanLorenzo'];
    activeSanVicente = json['aSanVicente'];
    activeSantaElena = json['aSantaElena'];
    activeTalisay = json['aTalisay'];
    activeVinzons = json['aVinzons'];

        // CAMSUR
    activeCAMSUR = json['aCAMSUR'];
    activeBaao = json['aBaao'];
    activeBalatan = json['aBalatan'];
    activeCamBato = json['aBatoCam'];
    activeBombon = json['aBombon'];
    activeBuhi = json['aBuhi'];
    activeBula = json['aBula'];
    activeCabusao = json['aCabusao'];
    activeCalabanga = json['aCalabanga'];
    activeCamaligan = json['aCamaligan'];
    activeCanaman = json['aCanaman'];
    activeCaramoan = json['aCaramoan'];
    activeDelGallego = json['aDelGallego'];
    activeGainza = json['aGainza'];
    activeGarchitorena = json['aGarchitorena'];
    activeGoa = json['aGoa'];
    activeIriga = json['aIriga'];
    activeLagonoy = json['aLagonoy'];
    activeLibmanan = json['aLibmanan'];
    activeLupi = json['aLupi'];
    activeMagarao = json['aMagarao'];
    activeMilaor = json['aMilaor'];
    activeMinalabac = json['aMinalabac'];
    activeNabua = json['aNabua'];
    activeNaga = json['aNaga'];
    activeOcampo = json['aOcampo'];
    activePamplona = json['aPamplona'];
    activePasacao = json['aPasacao'];
    activePili = json['aPili'];
    activePresentacion = json['aPresentacion'];
    activeRagay = json['aRagay'];
    activeSagnay = json['aSagnay'];
    activeCamSanFernando = json['aSanFernandoCam'];
    activeSanJose = json['aSanJose'];
    activeSipocot = json['aSipocot'];
    activeSiruma = json['aSiruma'];
    activeTigaon = json['aTigaon'];
    activeTinambac = json['aTinambac'];

        // CATANDUANES
    activeCATANDUANES = json['aCATANDUANES'];
    activeBagamanoc = json['aBagamanoc'];
    activeBaras = json['aBaras'];
    activeCatBato = json['aBatoCat'];
    activeCaramoran = json['aCaramoran'];
    activeGigmoto = json['aGigmoto'];
    activePandan = json['aPandan'];
    activePanganiban = json['aPanganiban'];
    activeSanAndres = json['aSanAndres'];
    activeSanMiguel = json['aSanMiguel'];
    activeViga = json['aViga'];
    activeVirac = json['aVirac'];

        // MASBATE
    activeMASBATE = json['aMASBATE'];
    activeAroroy = json['aAroroy'];
    activeBaleno = json['aBaleno'];
    activeBalud = json['aBalud'];
    activeBatuan = json['aBatuan'];
    activeCataingan = json['aCataingan'];
    activeCawayan = json['aCawayan'];
    activeClaveria = json['aClaveria'];
    activeDimasalang = json['aDimasalang'];
    activeEsperanza = json['aEsperanza'];
    activeMandaon = json['aMandaon'];
    activeMasbateCity = json['aMasbateCity'];
    activeMilagros = json['aMilagros'];
    activeMobo = json['aMobo'];
    activeMonreal = json['aMonreal'];
    activePalanas = json['aPalanas'];
    activePioCorpuz = json['aPioCorpuz'];
    activePlacer = json['aPlacer'];
    activeMasSanFernando = json['aSanFernandoMas'];
    activeSanJacinto = json['aSanJacinto'];
    activeSanPascual = json['aSanPascual'];
    activeUson = json['aUson'];

        // SORSOGON
    activeSORSOGON = json['aSORSOGON'];
    activeBarcelona = json['aBarcelona'];
    activeBulan = json['aBulan'];
    activeBulusan = json['aBulusan'];
    activeCasiguran = json['aCasiguran'];
    activeCastilla = json['aCastilla'];
    activeDonsol = json['aDonsol'];
    activeGubat = json['aGubat'];
    activeIrosin = json['aIrosin'];
    activeJuban = json['aJuban'];
    activeMagallanes = json['aMagallanes'];
    activeMatnog = json['aMatnog'];
    activePilar = json['aPilar'];
    activePrietoDiaz = json['aPrietoDiaz'];
    activeSantaMagdalena = json['aSantaMagdalena'];
    activeSorsogonCity = json['aSorsogonCity'];

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
    data['aALBAY'] = this.activeALBAY;
    data['aBacacay'] = this.activeBacacay;
    data['aCamalig'] = this.activeCamalig;
    data['aDaraga'] = this.activeDaraga;
    data['aGuinobatan'] = this.activeGuinobatan;
    data['aJovellar'] = this.activeJovellar;
    data['aLegazpi'] = this.activeLegazpi;
    data['aLibon'] = this.activeLibon;
    data['aLigao'] = this.activeLigao;
    data['aMalilipot'] = this.activeMalilipot;
    data['aMalinao'] = this.activeMalinao;
    data['Manito'] = this.activeManito;
    data['aOas'] = this.activeOas;
    data['aPioduran'] = this.activePioduran;
    data['aPolangui'] = this.activePolangui;
    data['aRapurapu'] = this.activeRapuRapu;
    data['aStoDomingo'] = this.activeSantoDomingo;
    data['aTabaco'] = this.activeTabaco;
    data['aTiwi'] = this.activeTiwi;

        // CAMNORTE
    data['aCAMNORTE'] = this.activeCAMNORTE;
    data['aBasud'] = this.activeBasud;
    data['aCapalonga'] = this.activeCapalonga;
    data['aDaet'] = this.activeDaet;
    data['aJosePanganiban'] = this.activeJosePanganiban;
    data['aLabo'] = this.activeLabo;
    data['aMercedes'] = this.activeMercedes;
    data['aParacale'] = this.activeParacale;
    data['aSanLorenzo'] = this.activeSanLorenzo;
    data['aSanVicente'] = this.activeSanVicente;
    data['aSantaElena'] = this.activeSantaElena;
    data['aTalisay'] = this.activeTalisay;
    data['aVinzons'] = this.activeVinzons;

        // CAMSUR
    data['aCAMSUR'] = this.activeCAMSUR;
    data['aBaao'] = this.activeBaao;
    data['aBalatan'] = this.activeBalatan;
    data['aBatoCam'] = this.activeCamBato;
    data['aBombon'] = this.activeBombon;
    data['aBuhi'] = this.activeBuhi;
    data['aBula'] = this.activeBula;
    data['aCabusao'] = this.activeCabusao;
    data['aCalabanga'] = this.activeCalabanga;
    data['aCamaligan'] = this.activeCamaligan;
    data['aCanaman'] = this.activeCanaman;
    data['aCaramoan'] = this.activeCaramoan;
    data['aDelGallego'] = this.activeDelGallego;
    data['aGainza'] = this.activeGainza;
    data['aGarchitorena'] = this.activeGarchitorena;
    data['aGoa'] = this.activeGoa;
    data['aIriga'] = this.activeIriga;
    data['aLagonoy'] = this.activeLagonoy;
    data['aLibmanan'] = this.activeLibmanan;
    data['aLupi'] = this.activeLupi;
    data['aMagarao'] = this.activeMagarao;
    data['aMilaor'] = this.activeMilaor;
    data['aMinalabac'] = this.activeMinalabac;
    data['aNabua'] = this.activeNabua;
    data['aNaga'] = this.activeNaga;
    data['aOcampo'] = this.activeOcampo;
    data['aPamplona'] = this.activePamplona;
    data['aPasacao'] = this.activePasacao;
    data['aPili'] = this.activePili;
    data['aPresentacion'] = this.activePresentacion;
    data['aRagay'] = this.activeRagay;
    data['aSagnay'] = this.activeSagnay;
    data['aSanFernandoCam'] = this.activeCamSanFernando;
    data['aSanJose'] = this.activeSanJose;
    data['aSipocot'] = this.activeSipocot;
    data['aSiruma'] = this.activeSiruma;
    data['aTigaon'] = this.activeTigaon;
    data['aTinambac'] = this.activeTinambac;

        // CATANDUANES
    data['aCATANDUANES'] = this.activeCATANDUANES;
    data['aBagamanoc'] = this.activeBagamanoc;
    data['aBaras'] = this.activeBaras;
    data['aBatoCat'] = this.activeCatBato;
    data['aCaramoran'] = this.activeCaramoran;
    data['aGigmoto'] = this.activeGigmoto;
    data['aPandan'] = this.activePandan;
    data['aPanganiban'] = this.activePanganiban;
    data['aSanAndres'] = this.activeSanAndres;
    data['aSanMiguel'] = this.activeSanMiguel;
    data['aViga'] = this.activeViga;
    data['aVirac'] = this.activeVirac;

        // MASBATE
    data['aMASBATE'] = this.activeMASBATE;
    data['aAroroy'] = this.activeAroroy;
    data['aBaleno'] = this.activeBaleno;
    data['aBalud'] = this.activeBalud;
    data['aBatuan'] = this.activeBatuan;
    data['aCataingan'] = this.activeCataingan;
    data['aCawayan'] = this.activeCawayan;
    data['aClaveria'] = this.activeClaveria;
    data['aDimasalang'] = this.activeDimasalang;
    data['aEsperanza'] = this.activeEsperanza;
    data['aMandaon'] = this.activeMandaon;
    data['aMasbateCity'] = this.activeMasbateCity;
    data['aMilagros'] = this.activeMilagros;
    data['aMobo'] = this.activeMobo;
    data['aMonreal'] = this.activeMonreal;
    data['aPalanas'] = this.activePalanas;
    data['aPioCorpuz'] = this.activePioCorpuz;
    data['aPlacer'] = this.activePlacer;
    data['aSanFernandoMas'] = this.activeMasSanFernando;
    data['aSanJacinto'] = this.activeSanJacinto;
    data['aSanPascual'] = this.activeSanPascual;
    data['aUson'] = this.activeUson;

        // SORSOGON
    data['aSORSOGON'] = this.activeSORSOGON;
    data['aBarcelona'] = this.activeBarcelona;
    data['aBulan'] = this.activeBulan;
    data['aBulusan'] = this.activeBulusan;
    data['aCasiguran'] = this.activeCasiguran;
    data['aCastilla'] = this.activeCastilla;
    data['aDonsol'] = this.activeDonsol;
    data['aGubat'] = this.activeGubat;
    data['aIrosin'] = this.activeIrosin;
    data['aJuban'] = this.activeJuban;
    data['aMagallanes'] = this.activeMagallanes;
    data['aMatnog'] = this.activeMatnog;
    data['aPilar'] = this.activePilar;
    data['aPrietoDiaz'] = this.activePrietoDiaz;
    data['aSantaMagdalena'] = this.activeSantaMagdalena;
    data['aSorsogonCity'] = this.activeSorsogonCity;

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