<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<body>
	<c:forEach var="srchGrp" items="${srchGroup }">
		<grp>
			<grpName>
				${srchGrp.grpName }
			</grpName>
			<grpLeader>
				${srchGrp.grpLeader }
			</grpLeader>
			<grpCate>
				${srchGrp.grpCate }
			</grpCate>
			<grpIntro>
				${srchGrp.grpIntro }
			</grpIntro>
			<grpRegDate>
				${srchGrp.grpRegDate }
			</grpRegDate>
			<grpImg>
				${srchGrp.grpThumbnail }
			</grpImg>
		</grp>
	</c:forEach>
	<c:forEach var="srchMkt" items="${srchMarket }">
		<mkt>
			<mktCode>
				${srchMkt.mktCode }
			</mktCode>
			<mktSeller>
				${srchMkt.mktSeller }
			</mktSeller>
			<mktPrName>
				${srchMkt.mktPrName }
			</mktPrName>
			<mktPrice>
				${srchMkt.mktPrice }
			</mktPrice>
			<mktContent>
				${srchMkt.mktContent }
			</mktContent>
			<grpName>
				${srchMkt.grpName }
			</grpName>
			<mktRegDate>
				${srchMkt.mktRegDate }
			</mktRegDate>
			<mktThumbnail>
				${srchMkt.mktThumbnail }
			</mktThumbnail>
		</mkt>
	</c:forEach>
</body>
</html>