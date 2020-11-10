/*:
 ## App Exercise - Finding a Heart Rate

 > Ces exercices renforcent les concepts Swift dans le contexte d'une application de suivi de la condition physique.


 De nombreuse API qui vous retournent des valeurs issues de capteurs vous retournent des Optionnels. Par exemple, une API permettant de travailler avec un moniteur de fréquence cardiaque peut vous indiquer `nil` si le moniteur de fréquence cardiaque est mal ajusté et ne peut pas déterminer correctement la fréquence cardiaque de l'utilisateur.


 Déclarez une variable `heartRate` de type `Int?` Et affectez-lui la valeur `nil`. Imprimer la valeur.
 */
var heartRate: Int? = nil
print(heartRate)
/*:
Dans cet exemple, si l'utilisateur corrige le positionnement du moniteur de fréquence cardiaque, l'application peut obtenir une lecture correcte de la fréquence cardiaque. Ci-dessous, mettez à jour la valeur de `heartRate` à 74. Imprimez la valeur.
 */
heartRate = 74
/*:
Comme vous l'avez fait dans d'autres exercices, créez une variable `hrAverage` de type `Int` et utilisez les valeurs ci-dessous et la valeur de `heartRate` précédente pour calculer la fréquence cardiaque moyenne.
 */
let oldHR1 = 80
let oldHR2 = 76
let oldHR3 = 79
let oldHR4 = 70

let total = oldHR1 + oldHR2 + oldHR3 + oldHR4 + (heartRate ?? 0)

if let currentHR = heartRate {
    let total = oldHR1 + oldHR2 + oldHR3 + oldHR4 + currentHR
    let moyenne = total/5
    print(moyenne)
} else {
    let total = oldHR1 + oldHR2 + oldHR3 + oldHR4
    let moyenne = total/4
    print(moyenne)
}

guard let currentHR = heartRate else { fatalError() }
print(currentHR)


/*:
 Si vous n'avez pas déballé la valeur de `heartRate`, vous avez probablement remarqué que vous ne pouvez pas effectuer d'opérations mathématiques sur une valeur optionnelle. Vous aurez d’abord besoin de déballer `heartRate`.

     Déballez en toute sécurité la valeur de `heartRate` en utilisant la sytaxe `if let`. S'il a une valeur, calculez la fréquence cardiaque moyenne en utilisant cette valeur et les fréquences cardiaques plus anciennes enregistrées ci-dessus. S'il n'a pas de valeur, calculez la fréquence cardiaque moyenne en utilisant uniquement les fréquences cardiaques les plus anciennes. Dans chaque cas, imprimez la valeur de `hrAverage`.
 */
