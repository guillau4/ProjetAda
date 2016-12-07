with Participant; use Participant; 
with Liste_Generique;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;


    
package body Moteur_Jeu is
    
    -- Choix du prochain coup par l'ordinateur. 
    -- E : l'etat actuel du jeu;
    -- P : profondeur a laquelle la selection doit s'effetuer
    function Choix_Coup(E : Etat) return Coup is
		C : Coup;
		L : Liste_Coups.Liste;
		M : Integer := -100;
		N : Integer;
		
		type ran is range 0 .. 1;
		package alea is new Ada.Numerics.Discrete_Random (ran);
		use alea;
		
		R : ran;
		G : Generator;
    
    begin
	    Reset(G);
	    R := Random(G);
	    L := Coups_Possibles(E, JoueurMoteur);
		if not Liste_Coups.Est_Vide(L) then
			C := Liste_Coups.Get_Val(L);
		end if;	
			while not Liste_Coups.Est_Vide(L) loop
				N := Eval_Min_Max(E, P, Liste_Coups.Get_Val(L), JoueurMoteur);

				if N > M then
					M := N;
					C := Liste_Coups.Get_Val(L);
				else
					if N = M then
					--Choix non equiprobable mais permettant de l'alea
						if R = 1 then
							M := N;
							C := Liste_Coups.Get_Val(L);
						end if;
						R := Random(G);
					end if;
				end if;
				L := Liste_Coups.Get_Suiv(L);
			end loop;
		return C;
    end Choix_Coup;
   
   
   
    function Eval_Min_Max(E : Etat; P : Natural; C : Coup; J : Joueur)
        return Integer is
    F : Etat:=E;
    L : Liste_Coups.Liste;
    M : Integer := -100;
    N : Integer;
    begin
    --On commence par determiner le point de vue adopté (signe)
    	if J = JoueurMoteur then
    		M := 100;
    	end if;
    	
	    F := Etat_Suivant(F, C);
	    if Est_Gagnant(F, adversaire(J)) then
	    	return M;
	    end if;

	    if P = 0 then
	--On utilise la fonction eval de puissance, au signe près
	    	return M*Eval(F);
	    end if;
	    
	--Sinon on recommence recursivement
	    L := Coups_Possibles(F, Adversaire(J));
	    while not Liste_Coups.Est_Vide(L) loop
	   -- Affiche_Coup(Liste_Coups.Get_Val(L));
	    	N := Eval_Min_Max(F, P-1, Liste_Coups.Get_Val(L), Adversaire(J));
	    	--Put(N);
			if J = JoueurMoteur then
				if N < M then
					M := N;
				end if;
			else
				if N > M then
					M := N;
				end if;					
	    	end if;
	    	L := Liste_Coups.Get_Suiv(L);
	    end loop;
	    
	    return M;
    end Eval_Min_Max;
   
end Moteur_Jeu;
