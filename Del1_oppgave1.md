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