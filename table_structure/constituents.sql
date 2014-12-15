-- cons are the core person representation in BSD. You get to a person's actions, information, etc through their cons_id. 
-- The cons table contains some basic data, and then other stuff is joinable through cons_id. 
-- keys to know: cons_id (primary key), firstname, lastname
select 
	cons_id, firstname, lastname
from cons
; 

/*
USEFUL THINGS TO KNOW IN CONS


RELATED TABLES OF JUST CONSTITUENT INFO AND KEYS TO KNOW

cons_addr: contains address data
- keys: addr1 (varchar), addr2 (varchar), city (varchar), state_cd (varchar), zip (varchar), zip5 (varchar), is_primary (boolean)
- note that BSD does not validate data in raw uploads. 

cons_phone: contains phone numbers
- keys: phone (varchar), cons_phone_type_id (int), is_primary (boolean)
- phone is a string, cons

-- cons_email: email data, subscription


PATTERNS ACROSS TABLES
- behavior of is_primary: [tk]

OTHER TABLES YOU CAN GET TO WITH CONS_IDS, DISCUSSED IN DIFFERENT PARTS
- mailing_recipient_unque (from which you can get what mailings they got and clicked on)
- cons_action_contribution (their donations)
- cons_action (their signups and possibly unsubscribes? Check on this) 

*/

-- sample queries to a few tables, so you can see how the joins might work

-- people with primary addresses in michigan
select 
	c.cons_id, c.firstname, c.lastname, 
	a.addr1, a.addr2, a.state_cd, a.zip
from cons c
join cons_addr a on a.cons_id = c.cons_id
where a.state_cd = 'MI'
	and a.is_primary = true
;

-- people and their home phone numbers, if we have them on file
select
	c.cons_id, p.phone
from cons c
left join cons_phone p on c.cons_id = p.cons_id 
where p.cons_phone_type_id = 1 -- home phone
; 