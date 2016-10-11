select * from USERINFO;
select * from GROUPJOIN;
select * from GROUPINFO;
select * from GROUPBOARD;
select * from MARKET;

insert into GROUPBOARD values(2, 'reva', '고기', '진리', sysdate, '멋쟁이'); 

select * from groupBoard where grpName = '멋쟁이' order by brdRegDate desc;
select * from groupBoard where grpName = 'reva';

select * from groupjoin grpj, groupInfo grpi where grpj.grpname = grpi.grpname and userNick ='닉네임' order by grpregdate desc;

select * from market order by MKTREGDATE desc