package body Participant is
   
    function Adversaire(J : Joueur) return Joueur is 
    begin
    	if J = Joueur1 then
    		return Joueur2;
    	end if;
    	return Joueur1;
  	end Adversaire;
    
      
end Participant;
