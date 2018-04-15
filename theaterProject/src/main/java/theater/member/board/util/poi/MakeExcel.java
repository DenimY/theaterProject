package theater.member.board.util.poi;

public interface MakeExcel {
	 
    public void setDocumentTitle();
 
    public void setDocumentBody();
 
    public void saveToFile(String fileName);
 
}