with Liste_Generique, Participant;
with Ada.Text_IO;
use Participant;


package body Partie is

procedure Joue_Partie(E : in out Etat; J : in Joueur) is
C: Coup;
	begin
		Affiche_Jeu(E);
		while not Est_Nul(E) or Est_Gagnant(E,Adversaire(J)) loop
			if J = Joueur1 then
				C := Coup_Joueur1(E);
			else
				C := Coup_Joueur2(E);
			end if;
		Affiche_coup(C);
		Affiche_Jeu(E);
		J := Adversaire(J);
		end loop;
	end Joue_Partie;

end Partie;
