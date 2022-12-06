# Oppgave 1
Årsaken til dette problemet er at  koden til konsulentene i Gaffel consulting mangler en *backend* del som lagrer og behandler terraform state. 
Terraform state-fila blir derfor kun lagret lokalt på maskinen til konsulenten som kjører terraform. State-fila er bindeleddet mellom infrastrukturen og terraformkoden.
State-fila innholder informasjon om bucket som er/blir lagret og vil derfor ikke forsøke å opprette bucket på nytt om den allerede eksisterer. 
