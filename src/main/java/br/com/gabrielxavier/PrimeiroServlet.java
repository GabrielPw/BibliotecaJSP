package br.com.gabrielxavier;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/minhaServlet", "/servlet"})
public class PrimeiroServlet extends HttpServlet {
    // Para que este servlet seja acessível ao navegador é necessário configurar (mapear) ele no web.xml

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter writer = response.getWriter();

        writer.println("<html>");
        writer.println("<body>");
        writer.println("<h1>Meu primeiro Servlet. Que maravilha!</h1>");
        writer.println("</body>");
        writer.println("</html>");


    }
}
