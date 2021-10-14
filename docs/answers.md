## Fråga 1

Uttrycket är möjligt att skriva eftersom att haskell använder sig av lat evaluering. Haskell kommer alltså inte skapa den oändliga listan i onödan, utan först när vi ber haskell om element ifrån den så kommer den skapa så många element vi vill ha och ge dem till oss. Uttrycket funkar inte i språk som t.ex. java därför att java hade försökt skapa en oändligt lista direkt, och det säger sig självt varför det inte skulle funka.

## Fråga 2

En rekursiv funktion är en funktion som har minst ett basfall och som kallar sig själv ända tills att basfallet är nått. Behöver användas i haskell hela tiden då vi inte har några loopar.

## Fråga 3

I haskell funkar funktionen för väldigt stora värden på n (testade som högst n = 10000000 på min dator). I javascript kraschar funktionen då n är närmar sig 10000, och felmeddelanden som uppstår är "RangeError: Maximum call stack size exceeded", vilket tyder på att det uppståt ett stack overflow. Alltså har de rekursiva funktionerna blivit för många för datorn att hantera, de får inte plats på stacken och programmet har inget annat val än att terminera.

Du kan få såklart få samma problem i haskell, om funktionen nedan körs med ett värde som t.ex. 50000000 så får du felmeddelandet "Exception: stack overflow"

```haskell
naiveFib :: Integer -> Integer
naiveFib 0 = 0
naiveFib 1 = 1
naiveFib n = naiveFib (n - 1) + naiveFib (n - 2)
```

Anledningen till att sum implementationen i haskell inte resulterar i ett stack overflow är för att den är svansrekursiv. Vi kan se att sum funktionen i haskell är svansrekursiv eftersom att resultatet av det sista rekursiva anropet är resultatet för själva funktionen. Det stämmer inte i naiveFib ovan, om vi kollar på naiveFib (n - 2). När högersidan av plus tecknet har gjort sitt sista rekursiva anrop, så är resultat vi får INTE svaret på själva funktionen för det måste adderas ihop med den vänsta sidan av plus tecknet.

När en funktion är svansrekursiv så kan den optimeras av ghc till att använda sig av mindre minne, och därför undviker vi att få stack overflow.
