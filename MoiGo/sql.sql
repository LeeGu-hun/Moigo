select * from USERINFO;
select * from GROUPJOIN;
select * from GROUPINFO;
select * from GROUPBOARD;
select * from MARKET;

insert into GROUPBOARD values(2, 'reva', '고기', '진리', sysdate, '멋쟁이'); 

select * from groupBoard where grpName = '멋쟁이' order by brdRegDate desc;
select * from groupBoard where grpName = 'reva';