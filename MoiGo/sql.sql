select * from USERINFO;
select * from GROUPJOIN;
select * from GROUPINFO;
select * from GROUPBOARD;
select * from MARKET;

insert into GROUPBOARD values(2, 'reva', '고기', '진리', sysdate, '멋쟁이'); 

select * from groupBoard where grpName = '멋쟁이' order by brdRegDate desc;
select * from groupBoard where grpName = 'reva';

select * from groupjoin grpj, groupInfo grpi where grpj.grpname = grpi.grpname and userNick ='닉네임' and rownum <=6 order by grpregdate desc;

select * from market order by MKTREGDATE desc

select gj.grpname, gi.grpthumbnail from groupJoin gj join groupInfo gi on gj.grpname=gi.grpname where gj.usernick='닉네임' and rownum <= 6;


select count(*) grpName from groupInfo where grpName='소고기타다끼';


select gj.grpname, gi.grpthumbnail from groupJoin gj join groupInfo gi on gj.grpname=gi.grpname where gj.usernick='닉네임';