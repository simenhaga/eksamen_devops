# Del 1, oppgave 1

### Hva er utfordringene med dagens systemutviklingsprosess - og hvordan vil innføring av DevOps kunne være med på å løse disse? Hvilke DevOps prinsipper blir brutt?

En av de største utfordringene med dagens systemutviklingsprosesser er at det ofte kan være en stor klyng mellom utviklings- og driftsavdelinger, noe som kan føre til at endringer tar lengre tid å implementere, og at det kan være en stor kommunikasjonsbarriere mellom de to avdelingene.

Innføring av DevOps-prinsipper kan bidra til å løse disse utfordringene ved å fokusere på samarbeid og kommunikasjon mellom utviklings- og driftsavdelinger, noe som kan gjøre det lettere å implementere endringer raskere og mer smertefritt. DevOps-prinsippene legger vekt på å automatisere prosessene så mye som mulig, noe som kan bidra til å redusere mengden av menneskelige feil og gjøre det lettere å rette opp i dem når de oppstår.

Et av de viktigste DevOps-prinsippene som ofte blir brutt i dagens systemutviklingsprosesser er prinsippet om "kontinuerlig leveranse". Dette prinsippet går ut på at endringer i systemet skal implementeres så ofte som mulig, slik at de kan testes og valideres fortløpende. Dersom dette prinsippet blir brutt, kan det føre til at endringer tar lengre tid å implementere, og at det kan være vanskeligere å rette opp i eventuelle feil som oppstår.


### En vanlig respons på mange feil under release av ny funksjonalitet er å gjøre det mindre hyppig, og samtidig forsøke å legge på mer kontroll og QA. Hva er problemet med dette ut ifra et DevOps perspektiv, og hva kan være en bedre tilnærming?

Problemet med denne tilnærmingen fra et DevOps-perspektiv er at den ikke adresserer den underliggende årsaken til feilene i den nye funksjonaliteten. Denne tilnærmingen fokuserer på å forhindre at feil oppstår i utgangspunktet, i stedet for å adressere grunnårsaken til feilene og forsøke å fikse dem.

En bedre tilnærming ville være å bruke prinsippene til DevOps og bruke kontinuerlig integrasjon, automatisert testing og kontinuerlig levering for å sikre at koden blir testet og utgitt raskt og effektivt. Dette gjør det mulig å identifisere og fikse eventuelle problemer tidlig, og dermed forhindre ytterligere problemer på veien. Videre tillater det team å samarbeide mer effektivt, noe som fører til en raskere og mer pålitelig utviklingsprosess.

### Teamet overleverer kode til en annen avdelng som har ansvar for drift - hva er utfordringen med dette ut ifra et DevOps perspektiv, og hvilke gevinster kan man få ved at team han ansvar for både drift- og utvikling?

Utfordringen fra et DevOps-perspektiv er at utviklingsteamet ikke har direkte kontroll over operasjonene til koden de overleverer. Dette betyr at teamet vil mangle synlighet og kontroll over eventuelle problemer som oppstår med koden i drift. I tillegg kan det hende at teamet ikke har tilgang til de samme verktøyene og prosessene som driftsteamet bruker, noe som kan begrense teamets evne til å feilsøke og identifisere problemer.

Fordelene med at utviklingsteamet er ansvarlig for både drift og utvikling inkluderer forbedret samarbeid, strømlinjeformede prosesser og bedre synlighet i driften av koden. Dette kan føre til raskere løsning av eventuelle problemer som oppstår, samt bedre kvalitetssikring og større smidighet i å svare på kundenes behov. I tillegg kan dette føre til økte kostnadsbesparelser, da utviklings- og driftsteamene kan jobbe sammen for å skape en effektiv og effektiv arbeidsflyt.


### Å release kode ofte kan også by på utfordringer. Beskriv hvilke- og hvordan vi kan bruke DevOps prinsipper til å redusere eller fjerne risiko ved hyppige leveraner.

Automatisering er nøkkelen til å redusere risiko knyttet til kontinuerlige leveranser. Automatisering reduserer manuell intervensjon og bidrar til å sikre repeterbarhet og nøyaktighet. Med automatisering utføres oppgaver som bygg, tester og distribusjoner raskere og mer pålitelig enn manuelle prosesser.

Kontinuerlig integrasjon og distribusjon kan bidra til å redusere risiko forbundet med kontinuerlige leveranser. Kontinuerlig integrasjon gjør det mulig å oppdage og løse eventuelle problemer tidlig i utviklingsprosessen, mens kontinuerlig distribusjon gir mulighet for distribusjon av kode i små batcher, i stedet for store batcher, noe som reduserer risikoen for at en feil eller feil vil forårsake en større forstyrrelse.

Til slutt er overvåking et annet viktig DevOps-prinsipp. Overvåking gjør det mulig å oppdage eventuelle problemer eller anomalier som kan oppstå under distribusjonsprosessen. Dette bidrar til å sikre at koden distribueres pålitelig og effektivt, og reduserer risikoen forbundet med kontinuerlige leveranser.


# Del 2, Oppgave 3
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

# Del 3, Oppgave 1

Workflowen failer fordi vi ikke har definert repository secrets på GitHub for Docker Hub. Jeg må opprette to secrets under *settings -> secrets -> add new repository secret.* <br>
Den første skal hete ```DOCKER_HUB_USERNAME``` og den andre ``DOCKER_HUB_TOKEN``. Dette finner vi ut ved å se i ````docker.yml```` fila.<br>
Legg inn brukernavn og passord i de to hemmelighetene. 

# Del 3, Oppgave 3

Beskriv deretter med egne ord hva sensor må gjøre for å få sin fork til å laste opp container image til sitt eget ECR repo.
* **Opprett nøkkler på AWS**
    * Se på .github/workflows/docker.yaml - Vi setter hemmeligheter ved å legge til følgende kodeblokk i github actions workflow fila vår slik at terraform kan autentisere seg med vår identitet, og våre rettigheter.
        ```yaml
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        ```
    * Lag AWS IAM Access Keys for din bruker. Security Credentials -> Access Keys -> Create New Access Key.

* **Legg til hemmeligheter i GitHub repoet ditt**.
    * Settings -> Secrets -> New repository secret.
    * Legg til hemmelighetene ```AWS_ACCESS_KEY_ID``` og ```AWS_SECRET_ACCESS_KEY``` med verdier fra AWS IAM Access Keys.

* **Opprett ditt eget ECR-repo**
  ```bash
  aws ecr create-repository \
  --repository-name [DITT_ECR_NAVN] \
  ```

* **Endre docker.yml**
    * Endre verdiene ```[DITT_ECR_NAVN]``` til navnet på ECR repoet ditt.
        ````yaml
      docker tag shopifly 244530008913.dkr.ecr.eu-west-1.amazonaws.com/[DITT_ECR_NAVN:$rev
      docker push 244530008913.dkr.ecr.eu-west-1.amazonaws.com/[DITT_ECR_NAVN]:$rev
        ````

# Del 5, Oppgave 1
Årsaken til dette problemet er at  koden til konsulentene i Gaffel consulting mangler en *backend* del som lagrer og behandler terraform state.
Terraform state-fila blir derfor kun lagret lokalt på maskinen til konsulenten som kjører terraform. State-fila er bindeleddet mellom infrastrukturen og terraformkoden.
State-fila innholder informasjon om bucket som er/blir lagret og vil derfor ikke forsøke å opprette bucket på nytt om den allerede eksisterer. 
Dette er en av grunnene til at det er viktig å bruke terraform state for å holde rede på infrastrukturen.
