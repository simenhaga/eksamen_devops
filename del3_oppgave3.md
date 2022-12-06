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
    
    