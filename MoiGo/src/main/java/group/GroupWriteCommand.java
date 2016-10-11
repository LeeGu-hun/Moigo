package group;

public class GroupWriteCommand {
	String writeTitle, writeContent, writer, writeThumbnail;

	public GroupWriteCommand() {
		
	}
	
	public GroupWriteCommand(String writeTitle, String writeContent, String writer, String writeThumbnail) {
		this.writeTitle = writeTitle;
		this.writeContent = writeContent;
		this.writer = writer;
		this.writeThumbnail = writeThumbnail;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public String getWriteThumbnail() {
		return writeThumbnail;
	}

	public void setWriteThumbnail(String writeThumbnail) {
		this.writeThumbnail = writeThumbnail;
	}
	
}
