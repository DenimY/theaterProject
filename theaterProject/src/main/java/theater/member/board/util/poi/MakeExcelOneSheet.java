package theater.member.board.util.poi;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
 
public class MakeExcelOneSheet implements MakeExcel {
 
    private DataModel    dataModel;
 
    private HSSFWorkbook workbook;
    private HSSFSheet    sheet;
    private HSSFFont     font;
 
    public MakeExcelOneSheet(DataModel dataModel) {
        this.dataModel = dataModel;
 
        workbook = new HSSFWorkbook();
        sheet = workbook.createSheet();
 
        font = workbook.createFont();
        font.setFontName(HSSFFont.FONT_ARIAL);
    }
 
    public void setDocumentTitle() {
        HSSFCellStyle titleStyle = workbook.createCellStyle();
        titleStyle.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        titleStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        titleStyle.setFont(font);
        sheet.createFreezePane(0, 1);
        HSSFRow row = sheet.createRow(0);
        int titleSize = dataModel.getColumnCount();
         
        for (int i = 0; i < titleSize; i++) {
            HSSFCell cell = row.createCell((short) i);
            String rValue = dataModel.getColumn(i);
            HSSFRichTextString rs = new HSSFRichTextString(rValue);
            cell.setCellValue(rs);
            cell.setCellStyle(titleStyle);
        }
    }
 
    public void setDocumentBody() {
        int dataSize = dataModel.getDataSize();
        int columnsSize = dataModel.getColumnCount();
 
        for (int i = 0; i < dataSize; i++) {
            HSSFRow row = sheet.createRow(i + 1);
            for (int j = 0; j < columnsSize; j++) {
                HSSFCell cell = row.createCell((short) j);
                String rValue = dataModel.getData(i, j);
                HSSFRichTextString rs = new HSSFRichTextString(rValue);
                cell.setCellValue(rs);
                sheet.autoSizeColumn((short) j);
            }
        }
    }
 
    public void saveToFile(String fileName) {
        FileOutputStream fs = null;
        System.out.println(System.getProperty("user.home") + "\\Documents\\" + fileName + ".xls");
        try {
            fs = new FileOutputStream(System.getProperty("user.home") + "\\Documents\\" + fileName + ".xls");
            workbook.write(fs);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fs.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}