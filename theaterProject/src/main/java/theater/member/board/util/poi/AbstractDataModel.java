package theater.member.board.util.poi;

public abstract class AbstractDataModel {
	 
    public abstract String[] getColumns();
 
    public abstract String getColumn(int col);
 
    public abstract String getData(int row, int col);
 
    public abstract int getColumnCount();
 
    public abstract int getDataSize();
}