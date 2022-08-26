package controller;
import com.example.examen.service.ServicePersona;
import model.BeanPersona;
import model.DaoPersona;
import utils.ResultAction;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Juliio Villalobos
@WebServlet(name = "ServletUsuario",
        urlPatterns = {
                "/get-persona",
                "/get-user",
                "/create-user",
                "/add-persona",
                "/save-persona",
                "/delete-persona"
        }
)
public class ServletUsuario extends HttpServlet {
    Logger logger = Logger.getLogger("ServletUsuario");
    String action;
    DaoPersona daoPersona = new DaoPersona();
    ServicePersona servicePersona = new ServicePersona();
    String urlRedirect = "/get-personas";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action = request.getServletPath();
        logger.log(Level.INFO, "Path-> "+action);
        switch (action){
            case "/get-persona":
                List<BeanPersona> personas = daoPersona.findAll();
                request.setAttribute("personas", personas);
                urlRedirect = "/views/index.jsp";
                break;
            case "/create-user":
                urlRedirect = "/views/create.jsp";
                break;
            case "/get-user":
                String id = request.getParameter("id");
                id = (id == null) ? "0":id;
                try{
                    BeanPersona persona = daoPersona.findOne(Integer.parseInt(id));
                    request.setAttribute("persona",persona);
                    urlRedirect = "/views/update.jsp";
                }catch (Exception e){
                    urlRedirect = "/get-persona";
                }
                break;
            default:
                request.setAttribute("libros", daoPersona.findAll());
                urlRedirect = "/get-personas";
                break;
        }
        request.getRequestDispatcher(urlRedirect).forward(request, response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws  ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = request.getServletPath();
        switch (action){
            case "/add-persona":
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                String birthday = request.getParameter("birthday");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                System.out.println(nombre);
                System.out.println(apellidos);
                System.out.println(birthday);
                BeanPersona persona = new BeanPersona();
                persona.setNombre(nombre);
                persona.setApellidos(apellidos);
                persona.setBirthday(birthday);
                persona.setEmail(email);
                persona.setPhone(phone);
                persona.setUsername(username);
                persona.setPassword(password);
                daoPersona.add(persona);
                urlRedirect = "/get-persona";
                break;
            case "/save-persona":
                String nombre2 = request.getParameter("nombre");
                String apellidos2 = request.getParameter("apellidos");
                String curp2 = request.getParameter("curp");
                String birthday2 = request.getParameter("birthday");
                String id = request.getParameter("id");
                System.out.println(nombre2);
                System.out.println(apellidos2);
                System.out.println(curp2);
                System.out.println(birthday2);
                BeanPersona persona2 = new BeanPersona();
                persona2.setNombre(nombre2);
                persona2.setApellidos(apellidos2);
                persona2.setBirthday(birthday2);
                persona2.setId(Integer.parseInt(id));
                ResultAction result2 = servicePersona.update(persona2);
                urlRedirect = "/get-usuarios?result="+
                        result2.isResult()+"&message="+result2.getMessage()
                        +"&status="+result2.getStatus();
                break;
            case "/delete-persona":
                String idUser = request.getParameter("id");
                ResultAction deleteResult = servicePersona.delete(idUser);
                urlRedirect = "/get-usuarios?result="+
                        deleteResult.isResult()+"&message="+
                        URLEncoder.encode(deleteResult.getMessage(), StandardCharsets.UTF_8.name())
                        +"&status="+deleteResult.getStatus();
                break;
            default:
                urlRedirect = "/get-persona";
                break;
        }
        response.sendRedirect(request.getContextPath()+urlRedirect);
    }
}
