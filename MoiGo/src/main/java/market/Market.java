package market;

import java.util.Date;

public class Market {
	int mktCode;
	String mktSeller, mktPrName, mktPrice, mktContent, grpName;
	Date mktRegDate;
	
	public Market(int mktCode, String mktSeller, String mktPrName, String mktPrice, String mktContent, String grpName,
			Date mktRegDate) {
		this.mktCode = mktCode;
		this.mktSeller = mktSeller;
		this.mktPrName = mktPrName;
		this.mktPrice = mktPrice;
		this.mktContent = mktContent;
		this.grpName = grpName;
		this.mktRegDate = mktRegDate;
	}
	
	public int getMktCode() {
		return mktCode;
	}
	public void setMktCode(int mktCode) {
		this.mktCode = mktCode;
	}
	public String getMktSeller() {
		return mktSeller;
	}
	public void setMktSeller(String mktSeller) {
		this.mktSeller = mktSeller;
	}
	public String getMktPrName() {
		return mktPrName;
	}
	public void setMktPrName(String mktPrName) {
		this.mktPrName = mktPrName;
	}
	public String getMktPrice() {
		return mktPrice;
	}
	public void setMktPrice(String mktPrice) {
		this.mktPrice = mktPrice;
	}
	public String getMktContent() {
		return mktContent;
	}
	public void setMktContent(String mktContent) {
		this.mktContent = mktContent;
	}
	public String getGrpName() {
		return grpName;
	}
	public void setGrpName(String grpName) {
		this.grpName = grpName;
	}
	public Date getMktRegDate() {
		return mktRegDate;
	}
	public void setMktRegDate(Date mktRegDate) {
		this.mktRegDate = mktRegDate;
	}
	
	
}
