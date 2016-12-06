with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Unchecked_Deallocation;

package body liste_generique is

	procedure Libere is new Ada.Unchecked_Deallocation (Cellule, Liste);

    -- Affichage de la liste, dans l'ordre de parcours
    procedure Affiche_Liste (L : in Liste) is
	P : Liste := L;   
	begin
	   while P /= null loop
	      Put(P.Val);
	      Put(" ");
	      P := P.Suiv ;
	   end loop ;
	   New_Line;
	end Affiche_Liste;

    -- Insertion d'un element V en tete de liste
    procedure Insere_Tete (V : in Element; L : in out Liste) is
	begin
	   L := new Cellule'(V,L) ;
	end Insere_Tete;


    -- Vide la liste et libere toute la memoire utilisee
    procedure Libere_Liste(L : in out Liste) is
	Tmp : Liste;
	begin
		while L /= null loop
			Tmp :=L;
			L := L.Suiv;
			Libere(Tmp);
		end loop;
	end Libere_Liste;

    -- Creation de la liste vide
    function Creer_Liste return Liste is
	begin
		return null;
	end Creer_Liste;

    -- Cree un nouvel iterateur 
    function Creer_Iterateur (L : Liste) return Iterateur is
	begin
		return null;
	end Creer_Iterateur;
		

    -- Liberation d'un iterateur
    procedure Libere_Iterateur(It : in out Iterateur) is
	Tmp : Iterateur := It;
	begin
		while It /= null loop
			Tmp :=It;
			It := It.Suiv;
			Libere(Tmp);
		end loop;
	end Libere_Iterateur;

    -- Avance d'une case dans la liste
    procedure Suivant(It : in out Iterateur) is
    Tmp : Iterateur;
	begin
		Tmp :=L;
		L := L.Suiv;
		Libere(Tmp);
	end Suivant;

    -- Retourne l'element courant
    function Element_Courant(It : Iterateur) return Element is
    begin
    	return Iterateur.Val;
    end Element_Courant;

    -- Verifie s'il reste un element a parcourir
    function A_Suivant(It : Iterateur) return Boolean is
	begin
		if Iterateur.Suiv = null then
			return false;
		end if;
		return true;
	end A_Suivant;

end liste_generique;
