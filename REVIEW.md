## Review

By Nina en Nienke

### Benoemen  
Documenten en variabelen krijgen in Swift geen _ maar een hoofdletter. 

### Onnoddige stukjes code
In de Mainpage laat ik de views elke keer hun data opnieuw inladen bij elke appear (zie bijv. regel 39), dit had ook anders gekund gezien het inladen alleen nodig is bij het opstarten van de app. Ik had bijvoorbeeld in overkoepelende deel de on appaer kunnen introduceren. 

### Verwijder feature
Tijdens de review viel op dat ik de gebruiker geen optie geef om input te wijzigen. Voor de bucketlist had ik hier goede redenen voor (zie assesment.md), voor de shop had dit echter wel gekund. 

### Mainpage bevat enige herhaling
Omdat ik permanente data via verschillende files verzamel zorg ik er nu voor dat ik voor elke datatype (bucketlijst, currency, achievements) en elke View een aantal soortgelijke stappen afloop. Dit had ik kunnen omleiden via een functie waar mijn mainpage naar herleidt inplaatsvan met de herhalingen. 

### Voltooien van taken 
Bij het afvinken van bucketlist taken kan het per ongeluk gebeuren dat de toggle wordt geactiveerd bij het indrukken. Ik had dit kunnen voorkomen met een slider, waardoor als bijkomende voordeel de gebruiker ook meer de ervaring van een voltooien taak meemaakt. 
