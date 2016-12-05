with Ada.Interger_Text_Io; use Ada.Integer_Text_Io;
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Unchecked_Deallocation;


    -- Affichage de la liste, dans l'ordre de parcours
    procedure Affiche_Liste (L : in Liste) 
	P : Liste ;   
	begin
	   P := L;
	   while (not Est_Vide(P)) loop
	      Put(P.Val) ;
	      P := P.Suiv ;
	   end loop ;
	end Affiche;

    -- Insertion d'un element V en tete de liste
    procedure Insere_Tete (V : in Element; L : in out Liste)
	begin
	   L := new Cellule'(V,L) ;
	end Insere_Tete;


    -- Vide la liste et libere toute la memoire utilisee
    procedure Libere_Liste(L : in out Liste)
	begin
		Vide(L);
	end Libere_Liste;

    -- Creation de la liste vide
    function Creer_Liste return Liste
	begin
		return null;
	end Creer_Liste;

    -- Cree un nouvel iterateur 
    function Creer_Iterateur (L : Liste) return Iterateur
	begin
		return null;
	end Creer_Iterateur;
		

    -- Liberation d'un iterateur
    procedure Libere_Iterateur(It : in out Iterateur);
	begin
	end Libere_Iterateur;

    -- Avance d'une case dans la liste
    procedure Suivant(It : in out Iterateur);

    -- Retourne l'element courant
    function Element_Courant(It : Iterateur) return Element;

    -- Verifie s'il reste un element a parcourir
    function A_Suivant(It : Iterateur) return Boolean;
	begin
		




