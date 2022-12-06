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
