# Slutavstämning  Programmering 1: Avancerad Provrättare #

### Skärminspelning

Du kommer spela in din skärm under avstämningen. Installera [Sharex (https://getsharex.com/)](https://getsharex.com/).

När Sharex installerats, tryck på pilen till höger om “Capture” i den vänstra panelen, och välj ”Screen Recording”. Sharex kommer nu ladda ner och installera FFmpeg (en videokomprimerare).

När FFmpeg installerats kan du börja spela in skärmen.

I task-baren längst ner i windows ser du till höger en röd plupp. När du är klar med uppgiften klickar du på pluppen för att avsluta inspelningen.

Filmen sparas i mp4-formatet. I Classroom finnas en separat inlämningsuppgift där du laddar upp filmen senast ett dygn efter provets slut.

#### Funktionalitet

Den här uppgiften går ut på att skriva ett program som läser in en fil med provsvar för en elev, och och skriver för varje fråga ut om eleven svarat rätt. Sedan skriver provet ut totala antal rätt eleven hade i provet.


Följande funktionalitet ska finnas: 

En meny som frågar vilken data som efterfrågas:

![0.gif](./0.gif)

1. Resultat för en enskild elev

Programmet skall fråga efter namn på en svarsfil. Därefter skriver programmet för varje rad ut frågans nummer följt av "Rätt" eller "Fel" beroende på om eleven svarat rätt eller fel. Slutligen skriver programmet ut antalet poäng eleven fick på provet.

![1.gif](./1.gif)

2. Resultat för en hel klass

  Programmet skall fråga efter namn på en mapp. Därefter läser programmet in alla filer i mappen och skriver ut följande resultat:

* Filnamn och resultat (antal rätt) för varje prov
* Namnet på filen med högst poäng (om flera har samma poäng, tag den första)
* Medel av alla resultat
* Median av alla resultat. 

![2.gif](./2.gif)


#### Dataformat

* svarsfilen består av en *rad* text per provfråga.
* Varje rad har två kolumner med tecken, där den första kolumnen visar korrekt svarsalternativ, och den andra kolumnen visar det svarsalternativ eleven valt.
* Programmet som skapar proven har kastat om svarsalternativen för varje fråga - dvs det som är rätt svarsalternativ för en elev på en fråga är inte nödvändigtvis rätt svarsalternativ för en annan elev.
* Svarsalternativ består av ett tecken (a, b, c ,d, e eller f)

Exempel svarsfil (enbart 10 rader):
```
a b
b b
b b
a a
f d
e e
d d
c a
c c
b b
```

## Bedömningsmatris

#### Planering & Problemanalys

| E                                                            | C                                                            | A                                                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Tillsammans** med läraren analyserar du **enkla** problem och planerar dina lösningar med **enkla** flödesscheman. | **Med läraren som bollplank** analyserar du **lite mer avancerade** problem och planerar **utförligt** dina lösningar med flödesscheman. | **Med läraren som bollplank**analyserar du **avancerade** problem och planerar **utförligt** dina lösningar med flödesscheman. |

- Har du delat upp problemet i flera delproblem?
- Har du en välstrukturerad lösning med flera funktioner?

#### Implementering & Felsökning

| E                                                            | C                                                            | A                                                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Tillsammans** med läraren implementerar du lämpliga verktyg och felsöker **enkla** syntaxfel. | **Med läraren som bollplank**implementerar du lämpliga verktyg och felsöker **systematiskt** syntaxfel, körtidsfel och logiska fel. | **Med läraren som bollplank** implementerar du **med säkerhet** lämpliga verktyg och felsöker **systematiskt och effektivt** syntaxfel, körtidsfel och logiska fel. |

- Använde du debuggern?
- Läste du felmeddelanden?
- Testade du alla möjliga input?

#### Validering & Felhantering

| E                                                            | C                                                            | A                                                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Tillsammans** med läraren validerar du indata och använder **enkla**felmeddelanden. | **Med läraren som bollplank**validerar du indata och använder **tydliga**felmeddelanden. | **Med läraren som bollplank** validerar du indata och använder **tydliga** felmeddelanden samt använder undantagshantering. |

- Vad händer om filen inte finns?
- Vad händer om filen är tom eller har felaktigt formaterad data?
- Vad händer om användaren väljer ett menyalternativ som inte finns?

#### Kommunikation & Dokumentation

| E                                                            | C                                                            | A                                                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Tillsammans** med läraren skriver du tydlig och lättläst kod och kommenterar din kod. | **Med läraren som bollplank**skriver du tydlig och lättläst kod och dokumenterar din kod. | **Med läraren som bollplank** skriver du tydlig och lättläst kod och dokumenterar din kod utifrån en angiven standard. |

- Är all kod indenterad korrekt?
- Är det tydliga variabel- och funktionsnamn?
- Är det någon rad som gör för mycket?
- Är alla funktioner dokumenterade?

#### Utvärdering & Optimering

| E                                                            | C                                                            | A                                                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Tillsammans** med läraren använder du **enkla** omdömen när du utvärderar din egen förmåga och använder **enkel**terminologi när du utvärderar din kod. | **Med läraren som bollplank**använder du **nyanserade**omdömen när du utvärderar din egen förmåga och använder **korrekt** terminologi när du utvärderar din kod. | **Med läraren som bollplank** optimerar du dina program och använder **nyanserade**omdömen när du utvärderar din egen förmåga samt använder **korrekt**terminologi när du utvärderar din kod. |

I din självbedömning:

- Vad kände du gick bra?
- Vad kände du gick mindre bra?
- Hur kan du förbättra ditt program?
- Finns det något som kan optimeras?

