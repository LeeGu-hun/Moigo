package market;

public class MarketModifyProductCommand {
	private String modiProName, modiProPrice, modiProContent, grpName, modiProThumbnail;
	private int mktCode;
	
	public MarketModifyProductCommand() {
		super();
	}

	public MarketModifyProductCommand(String modiProName, String modiProPrice, String modiProContent, String grpName,
			String modiProThumbnail, int mktCode) {
		super();
		this.modiProName = modiProName;
		this.modiProPrice = modiProPrice;
		this.modiProContent = modiProContent;
		this.grpName = grpName;
		this.modiProThumbnail = modiProThumbnail;
		this.mktCode = mktCode;
	}

	public String getModiProName() {
		return modiProName;
	}

	public void setModiProName(String modiProName) {
		this.modiProName = modiProName;
	}

	public String getModiProPrice() {
		return modiProPrice;
	}

	public void setModiProPrice(String modiProPrice) {
		this.modiProPrice = modiProPrice;
	}

	public String getModiProContent() {
		return modiProContent;
	}

	public void setModiProContent(String modiProContent) {
		this.modiProContent = modiProContent;
	}

	public String getGrpName() {
		return grpName;
	}

	public void setGrpName(String grpName) {
		this.grpName = grpName;
	}

	public String getModiProThumbnail() {
		return modiProThumbnail;
	}

	public void setModiProThumbnail(String modiProThumbnail) {
		this.modiProThumbnail = modiProThumbnail;
	}

	public int getMktCode() {
		return mktCode;
	}

	public void setMktcode(int mktCode) {
		this.mktCode = mktCode;
	}
	
}
