package group;

public class GroupDeleteCommand {
	private int brdSeq;
	
	public GroupDeleteCommand() {
		super();
	}

	public GroupDeleteCommand(int brdSeq) {
		super();
		this.brdSeq = brdSeq;
	}

	public int getBrdSeq() {
		return brdSeq;
	}

	public void setBrdSeq(int brdSeq) {
		this.brdSeq = brdSeq;
	};
	
}
