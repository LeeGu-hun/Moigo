package group;

public class GroupWriteCommand {
	String writeTitle, writeContent;

	public GroupWriteCommand(String writeTitle, String writeContent) {
		super();
		this.writeTitle = writeTitle;
		this.writeContent = writeContent;
	}

	public String getWriteTitle() {
		return writeTitle;
	}

	public void setWriteTitle(String writeTitle) {
		this.writeTitle = writeTitle;
	}

	public String getWriteContent() {
		return writeContent;
	}

	public void setWriteContent(String writeContent) {
		this.writeContent = writeContent;
	}
	
}
