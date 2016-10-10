package market;

public class MarketAddProductCommand {
	String productName, productPrice, productContent, mktSeller, grpName;
	
	public MarketAddProductCommand() {
		super();
	}
	
	public MarketAddProductCommand(String productName, String productPrice, String productContent, String mktSeller,
			String grpName) {
		super();
		this.productName = productName;
		this.productPrice = productPrice;
		this.productContent = productContent;
		this.mktSeller = mktSeller;
		this.grpName = grpName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getMktSeller() {
		return mktSeller;
	}

	public void setMktSeller(String mktSeller) {
		this.mktSeller = mktSeller;
	}

	public String getGrpName() {
		return grpName;
	}

	public void setGrpName(String grpName) {
		this.grpName = grpName;
	}
	
}
