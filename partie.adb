with Liste_Generique, Participant;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
use Participant;


package body Partie is

	procedure Joue_Partie(E : in out Etat; J : in Joueur) is
	K: Joueur := J;
	Fini : Boolean := false;
	C: Coup;
		begin
			Affiche_Jeu(E);
			while not fini loop
				if K = Joueur1 then
					C := Coup_Joueur1(E);
				else
					C := Coup_Joueur2(E);
				end if;
			E := Etat_Suivant(E,C);
			Affiche_coup(C);
			Affiche_Jeu(E);
			K := Adversaire(K);

			if Est_Gagnant(E,Adversaire(K)) then
				fini := true;
				if K = Joueur1 then
					Put_Line("Joueur 1 remporte la partie !");
				else
					Put_Line("Joueur 2 remporte la partie !");
				end if;
			end if;
			if Est_Nul(E) then
				fini := true;
				Put_Line("Partie nulle !");
			end if;
		end loop;
	end Joue_Partie;
end Partie;
