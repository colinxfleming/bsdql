2-- to drill down from stg_signup to cons_id: stg_signup > cons_action_signup > cons_action

select 
	ca.cons_id,
	s.email
from stg_signup s 
join cons_action_signup cas
	on s.stg_signup_id = cas.stg_signup_id
join cons_action ca
	on cas.cons_action_signup_id = ca.cons_action_signup_id
;

-- 
/* 

It's best to filter on keys in stg_signup, in my experience. Some of the keys drop off or act weird when you drill in further. 

AVAILABLE AND USEFUL FILTERS IN stg_signup
- chapter_id
- create_dt
- source 
- subsource

*/

-- sample queries using each of these filters: 
-- note that these use inner joins! 
-- Occasionally BSD takes awhile to process things from stg_signup down all the way. 

-- signups just in chapters 2 and 3
select 
	ca.cons_id,
	s.email
from stg_signup s 
join cons_action_signup cas
	on s.stg_signup_id = cas.stg_signup_id
join cons_action ca 
	on cas.cons_action_signup_id = ca.cons_action_signup_id
where s.chapter_id in (2, 3)
;

-- signups after January 1, 2014
select 
	ca.cons_id,
	s.email
from stg_signup s 
join cons_action_signup cas
	on s.stg_signup_id = cas.stg_signup_id
join cons_action ca 
	on cas.cons_action_signup_id = ca.cons_action_signup_id
where s.create_dt >= '2014-01-01'
;

-- signups with the source 'michigan_best_state' and subsource 'jennifer_granholm'
select 
	ca.cons_id,
	s.email
from stg_signup s 
join cons_action_signup cas
	on s.stg_signup_id = cas.stg_signup_id
join cons_action ca 
	on cas.cons_action_signup_id = ca.cons_action_signup_id
where s.source = 'michigan_best_state'
	and s.subsource = 'jennifer_granholm'
;
