package market;

public class MarketAddProductCommand {
	String productName, productPrice, productContent, mktSeller;
	
	public MarketAddProductCommand() {
		super();
	}

	public MarketAddProductCommand(String mktSeller, String productName, String productPrice, String productContent) {
		super();
		this.mktSeller = mktSeller;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productContent = productContent;
	}

	public String getMktSeller() {
		return mktSeller;
	}

	public void setMktSeller(String mktSeller) {
		this.mktSeller = mktSeller;
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
	
}