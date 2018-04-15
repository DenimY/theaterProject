package theater.member.board.util.poi;

import java.util.List;

public class DataModel extends AbstractDataModel {
    
    private String[] columns = {"month", "date"};
    private List<String[]> data;
     
    public DataModel(List<String[]> data) {
        this.data = data;
    }
     
    @Override
    public String getColumn(int col) {
        return columns[col];
    }
     
    @Override
    public String[] getColumns() {
        return columns;
    }
     
    @Override
    public String getData(int row, int col) {
        return data.get(row)[col];
    }
 
    @Override
    public int getColumnCount() {
        return columns.length;
    }
     
    @Override
    public int getDataSize() {
        return data.size();
    }
}
