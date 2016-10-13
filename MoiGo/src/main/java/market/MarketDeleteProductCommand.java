package market;

public class MarketDeleteProductCommand {
	
	private int mktCode;
	
	public MarketDeleteProductCommand() {
		super();
	}

	public MarketDeleteProductCommand(int mktCode) {
		super();
		this.mktCode = mktCode;
	}

	public int getMktCode() {
		return mktCode;
	}

	public void setMktCode(int mktCode) {
		this.mktCode = mktCode;
	}

}
