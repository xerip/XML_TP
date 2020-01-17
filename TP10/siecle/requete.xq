declare option saxon:output "indent=yes";

<resultat>
<ul>
{
    for
        $annee in doc("siecle.xml")//annee
        for 
			$mois in $annee/mois
			for 
				$jour in $mois/jour
			
    let $numero := ($jour/numero - 1)
    let $nom := $jour/nom
    let $numAnnee := $annee/numero
    let $nomMois := $mois/nom
    let $moisNum := $mois/numero
    where ($moisNum = (1, 2))
    return
		<li>
			<jour>
				{attribute id {$jour/@id}}
				<annee>
					{$numAnnee}
				</annee>
				<mois>
					{$moisNum}
				</mois>
				<nom>
					{$nom}
				</nom>
			</jour>
		</li>
}
</ul>
</resultat>
