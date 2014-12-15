-- cons are the core person representation in BSD. You get to a person's actions, information, etc through their cons_id. 
-- The cons table contains some basic data, and then other stuff is joinable through cons_id. 

select 
	cons_id, firstname, lastname
from cons
; 

/*

TABLES YOU CAN GET TO WITH CONS_IDS
- mailing_recipient_unque (from which you can get what mailings they got and clicked on)
- cons_action_contribution (their donations)
- cons_action (their signups and possibly unsubscribes? Check on this) 
- cons_email (email addresses they have and their subscription status)
- cons_addr (physical addresses they have)
- cons_phone (phones they have) 

*/