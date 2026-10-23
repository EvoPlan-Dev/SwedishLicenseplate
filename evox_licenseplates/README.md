# Svenska registreringsskyltar för FiveM

Fristående FiveM-resource som laddar de medföljande svenska skylttexturerna och
typsnittet. Ingen framework-dependency krävs.

## Installation

1. Kopiera hela mappen `se_licenseplates` till serverns `resources`-mapp.
2. Lägg till följande rad i `server.cfg`:

   ```cfg
   ensure se_licenseplates
   ```

3. Starta om servern. Vid installation på en redan använd klient kan FiveM-cachen
   behöva rensas innan den nya texturen syns.

Resursen sätter formatet för nygenererade skyltar till ` ABC 123`. Det inledande
blanksteget flyttar den synliga texten ett tecken åt höger. Om ESX, QBCore,
ox_core eller en annan resource redan skapar registreringsnummer, sätt
`Config.ApplyPlatePattern = false` i `config.lua`. Sparade registreringsnummer i en
databas ändras inte. En framework-genererad skylt behöver i så fall få samma
inledande blanksteg i frameworkets egen skyltgenerator.

Kör endast en resource som ersätter `vehshare`-skyltarna åt gången. Vid konflikt
gäller normalt den mapping som laddades sist.

## Innehåll

- `stream/se_licenseplates.ytd` – omdöpt texture dictionary som laddas säkert och
  kopplas till spelets `vehshare` via `AddReplaceTexture`.
- `client.lua` – laddning, texture replacement, timeout och städning vid stopp.
- `config.lua` – valbart registreringsnummerformat.

Version 1.2.0 återställer originaldesignen med det breda EU-fältet och använder
i stället ett inledande blanksteg för placeringen. `carcols.ymt` laddas inte,
eftersom den kan krocka med andra fordonsresurser och FiveM inte tillämpar dess
ändrade `FontExtents` på basspelets skyltprofiler. Texture dictionary-filen är
bantad från 55 till de 14 texturer som resursen faktiskt använder.

## Credits och användning

Originalfilerna kommer från **Swedish License Plates** av Drivezz. Paketet är
endast en FiveM-anpassning av användarens lokala exemplar. Originalskaparen anger
att filerna inte får återpubliceras eller distribueras; dela därför länken till
originalsidan i stället för detta paket:

https://www.lcpdfr.com/downloads/gta5mods/datafile/49947-swedish-license-plates/
