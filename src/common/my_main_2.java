package common;


 
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
 
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.PdfWriter;
 
public class my_main_2 {
 
 public static void main(String[] args) throws FileNotFoundException, DocumentException {
 
    Document document = new Document(new Rectangle(PageSize.A4));    
    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("c:/Java4s_BarCode_128.pdf"));    
 
    document.open();
        document.add(new Paragraph("Code_128 Format_Java4s.com"));
 
            Barcode128 code128 = new Barcode128();
            code128.setGenerateChecksum(true);
            code128.setCode("jinu jaad");    
 
        document.add(code128.createImageWithBarcode(writer.getDirectContent(), null, null));
    document.close();
 
    System.out.println("Document Generated...!!!!!!");
  }
 
}