package fr.formation.afpa;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;

import fr.formation.afpa.domain.Compte;
import fr.formation.afpa.domain.Customer;
import fr.formation.afpa.service.CompteService;
import fr.formation.afpa.service.CustomerService;

@WebServlet("/")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerService service = new CustomerService();
	private CompteService servicecompte = new CompteService();

    public CustomerController() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		System.out.println("********************************************************");
		System.out.println(action);
		try {
			switch(action) {
			case "/pdfExport":
				System.out.println("/pdfExport");
				pdfExport(request,response);
				break;
			case "/xlsExport":
				System.out.println("/pdfExport");
				xlsExport(request,response);
				break;
			case "/login":
				System.out.println("/login");
				login(request,response);
				break;
			case "/logout":
				System.out.println("/logout");
				logout(request,response);
				break;
			case "/insert":
				System.out.println("/insert");
				insertCustomer(request,response);
				break;
			case "/insertget":
				System.out.println("/insertget");
				insertget(request,response);
				break;
			case "/delete":
				System.out.println("/delete");
				deleteCustomer(request,response);
				break;
			case "/updateget":
				System.out.println("/updateget");
				updateget(request,response);
				break;
			case "/update":
				System.out.println("/update");
				updateCustomer(request,response);
				break;
			default:
				System.out.println("/listCustomer");
				listCustomer(request,response);
				break;
			}
		} catch (Exception e) {
	
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        System.err.println("LOGIN : " + login + "//  MDP : " + password);

		Compte compte  = servicecompte.findByLogingAndPassword(login, password);
		if(compte != null) {
			HttpSession session = request.getSession();
			session.setAttribute("customer", compte.getCustomer());
			if (password.equals("123456")) {
				request.getServletContext().getRequestDispatcher("/listcustomer").forward(request, response);
			} else {
			request.getServletContext().getRequestDispatcher("/listcustomer").forward(request, response);
			}
		}
		else {
			request.setAttribute("error", "<span style='color:red'>mot de passe ou login incorrect !</span>");
            request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        } 
        
	}

	private void xlsExport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            
            try ( HSSFWorkbook workbook = new HSSFWorkbook(); 
                   ) {
                
                // --- Define some cell styles ---
                CellStyle headerCellStyle = workbook.createCellStyle();
                HSSFFont font = workbook.createFont();
                font.setBold( true );
                headerCellStyle.setFont(font);  
                headerCellStyle.setAlignment( HorizontalAlignment.CENTER );
                
                List<Customer> listall = service.findAll();
                CellStyle numericCellStyle = workbook.createCellStyle();
                numericCellStyle.setDataFormat( 
                    workbook.getCreationHelper().createDataFormat().getFormat("0.00"));

                // --- Export T_Articles table ---
                HSSFSheet articleSheet = workbook.createSheet( "Export Yahya" );
                HSSFRow row = articleSheet.createRow( 0 );
                HSSFCell cell;

                row.setRowStyle( headerCellStyle );
                cell = row.createCell( 0 );
                cell.setCellStyle( headerCellStyle);
                cell.setCellValue( "CustID" );
                
                cell = row.createCell( 1 );
                cell.setCellStyle( headerCellStyle);
                cell.setCellValue( "address" );
                
                cell = row.createCell( 2 );
                cell.setCellStyle( headerCellStyle);
                cell.setCellValue( "city" );
                
                cell = row.createCell( 3 );
                cell.setCellStyle( headerCellStyle);
                cell.setCellValue( "custtypeid" );
                
                int rowIndex = 1;
                Date date= new Date();
                for (Customer line : listall) {
                            row = articleSheet.createRow( rowIndex++ );
                            cell = row.createCell( 0 , CellType.NUMERIC); 
                            cell.setCellStyle( numericCellStyle );
                            cell.setCellValue( line.getCustId() );

                            cell = row.createCell( 1 ); 
                            cell.setCellValue( line.getAddress() );

                            cell = row.createCell( 2 ); 
                            cell.setCellValue( line.getCity()  );

                            cell = row.createCell( 3 );
                            cell.setCellValue( line.getCustTypeCd() );
                }
                
                // Auto size each columns of the article's sheet
                for( int i=0; i<4; i++ ) articleSheet.autoSizeColumn( i );
            
                // --- Export T_Users table ---
                HSSFSheet userSheet = workbook.createSheet( "T_Users table" );
                // TODO: Continue to export other data 
            
            
                // Write the XLSX file to the HTTP socket
                response.setContentType( "application/vnd.ms-excel" );
                try ( OutputStream out = response.getOutputStream() ) {
                    workbook.write( out );
                }
                
            }           
            
        } catch (Exception e) {
            e.printStackTrace();
            
            response.setContentType( "text/html" );
            try ( PrintWriter out = response.getWriter() ) {
                out.println( "An error is produced, please view de server logs " + 
                             "for more informations" );
            }
        }
    }

	private void pdfExport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String masterPath = request.getServletContext().getRealPath( "/WEB-INF/FacMaster.pdf" );
	        response.setContentType( "application/pdf" );
	        
	        try ( PdfReader reader = new PdfReader( masterPath );
	              PdfWriter writer = new PdfWriter( response.getOutputStream() );
	              PdfDocument document = new PdfDocument( reader, writer ) ) {
	            
	            PdfPage page = document.getPage( 1 );
	            PdfCanvas canvas = new PdfCanvas( page );
	            
	            FontProgram fontProgram = FontProgramFactory.createFont();
	            PdfFont font = PdfFontFactory.createFont( fontProgram, "UTF-8", true );
	            canvas.setFontAndSize( font, 12 );
	            
	            canvas.beginText();
	            
	            canvas.setTextMatrix( 0, 0 );
	            canvas.showText( "départ en coordonnée x=0 et y=0" );
	            
	            canvas.setTextMatrix( 470, 760 );
	            List<Customer> listall = service.findAll();
	            
	            int top = 500;
	   
	            NumberFormat formatter = NumberFormat.getNumberInstance( new Locale( "fr", "FR" ) );
	            Date date= new Date();
	            for (Customer line : listall) {
	               
	                canvas.setTextMatrix( 50, top );
	                canvas.showText( "" + line.getCustId() );

	                canvas.setTextMatrix( 70, top );
	                canvas.showText( line.getAddress() );

	                canvas.setTextMatrix( 210, top );
	                canvas.showText( line.getCity() );

	                canvas.setTextMatrix( 400, top );
	                canvas.showText( line.getCustTypeCd() );

	                canvas.setTextMatrix( 420, top );
	                canvas.showText( "" + line.getFedId() );
	                
	                top -= 20;
	            }
	            canvas.setTextMatrix( 50, top );
	            canvas.showText( "Imprimé par Guillaume SOULAT le  " + date);
	            canvas.endText();
	            
	        }
	        
	    }
		
	

	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("message", "bravo guillaume");
		session.invalidate();
		request.getServletContext().getRequestDispatcher("/login").forward(request, response);
		
	}

	private void insertget(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/WEB-INF/pages/ajoutercustomer.jsp").forward(request, response);
		
	}

	private void updateget(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Customer customer = service.findById(id);
		request.setAttribute("customer", customer);
		getServletContext().getRequestDispatcher("/WEB-INF/pages/modifiercustomer.jsp").forward(request, response);
		
	}

	private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Customer> list = service.findAll();
		List<Customer> listall = service.findAll();
		
		int page = 1;
        int recordsPerPage = 5;
        if(request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        
        List<Customer> listfiltrer = service.findForTable((page-1)*recordsPerPage,recordsPerPage);
                                 
        int noOfRecords = listall.size();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        request.setAttribute("customers", listfiltrer);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("/WEB-INF/pages/listcustomer.jsp").forward(request, response);
	}

	public void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		service.deleteById(id);
		response.sendRedirect("listcustomer");
	}

	public void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = new Customer();
		customer.setAddress(request.getParameter("address"));
		customer.setCity(request.getParameter("city"));
		customer.setState(request.getParameter("state"));
		customer.setCustTypeCd(request.getParameter("custTypeCd"));
		customer.setFedId(request.getParameter("fedId"));
		customer.setPostalCode(request.getParameter("postalCode"));
		service.saveOrUpdate(customer);
		request.getServletContext().getRequestDispatcher("/listcustomer").forward(request, response);
	}
	
	public void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = new Customer();
		customer.setCustId(Integer.parseInt(request.getParameter("custId")));
		customer.setAddress(request.getParameter("address"));
		customer.setCity(request.getParameter("city"));
		customer.setState(request.getParameter("state"));
		customer.setCustTypeCd(request.getParameter("custTypeCd"));
		customer.setFedId(request.getParameter("fedId"));
		customer.setPostalCode(request.getParameter("postalCode"));
		service.update(customer);
		request.getServletContext().getRequestDispatcher("/listcustomer").forward(request, response);
	}

}
