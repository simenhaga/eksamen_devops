# Oppgave 3
Branch protection og status sjekker - Beskriv hva sensor må gjøre for å konfigurere sin fork på en slik måte at

* **Ingen kan pushe kode direkte på main branch**
    * Gå til Settings -> branches og se etter seksjonen "**Branch Protection Rules**". 
    * Velg *Add*
    * Skriv *main* inn i feltet "Branch name pattern" 
  
* **Kode kan merges til main branch ved å lage en Pull request med minst en godkjenning**
  * Velg ```Require a pull request before merging```
  * Huk av for ``Require approvals``
  * Velg minst 1 fra nedtrekkslista
  
* **Kode kan merges til main bare når feature branchen som pull requesten er basert på, er verifisert av GitHub Actions.**
  * Velg ```Require status checks to pass before merging```
  * I søkefeltet skriv inn teksten build som skal la deg velge "GitHub Actions".
  * Trykk på knappen "Save Changes" nederst på siden.