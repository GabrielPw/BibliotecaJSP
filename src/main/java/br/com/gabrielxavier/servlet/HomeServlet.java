package br.com.gabrielxavier.servlet;

import br.com.gabrielxavier.model.Autor;
import br.com.gabrielxavier.model.Livro;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.service(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("Criou a lista de livros!\n");
        List<Livro> livros = new ArrayList<>(List.of(
                new Livro(1L, "A Revolução dos Bichos", "George Orwell", "https://m.media-amazon.com/images/I/91BsZhxCRjL.jpg"),
                new Livro(2L, "Crime e Castigo", "Fiódor Dostoiévski", "https://m.media-amazon.com/images/I/916WkSH4cGL.jpg"),
                new Livro(3L, "1984", "George Orwell", "https://m.media-amazon.com/images/I/819js3EQwbL.jpg"),
                new Livro(4L, "Frankenstein", "Mary Shelley", "https://kbimages1-a.akamaihd.net/bd3fce8f-a9a0-4cb0-a539-d8779090ba51/1200/1200/False/frankenstein-557.jpg"),
                new Livro(5L, "A Metamorfose", "Franz Kafka", "https://m.media-amazon.com/images/I/71QLwli7GUL.jpg"),
                new Livro(6L, "Discurso do Método", "René Descartes", "https://m.media-amazon.com/images/I/81+nKmcY6fL.jpg"))
        );

        List<Autor> autores = new ArrayList<>(List.of(
                new Autor(1L, "George Orwell", "", "https://imgs.search.brave.com/XZapAaXM9snUcPgbGgJyC08K2ldVWACo7zINk55sGTA/rs:fit:1142:1200:1/g:ce/aHR0cHM6Ly9lbnRy/ZWNhbm9zLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvMjAxOS8w/OC9lYy1nZW9yZ2Ut/b3J3ZWxsLTg3MTZl/MjJjOWE3YjM2ZWYz/YmVkZDhkYTA1MTU3/ZGI1LmpwZw"),
                new Autor(2L, "Fiódor Dostoiévski", "", "https://imgs.search.brave.com/WXQ99tpXz_QuPmhZ0DSZPj1RhzlI5V9Yh5YHuC34r1Y/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly8xLmJw/LmJsb2dzcG90LmNv/bS8teXpuRFdRcWJf/Wm8vV241T1VDb1Fz/S0kvQUFBQUFBQUFC/ZW8vMUp4dXo4bEwx/U1VrN2ZodXZZTXpS/VTNnMVBxbzFOUmVR/Q0xjQkdBcy9zMTYw/MC9GaSUyNUMzJTI1/QjNkb3IlMkJEb3N0/b2lldnNraS5qcGc"),
                new Autor(3L, "Franz Kafka", "", "https://imgs.search.brave.com/AVsMXNm9zQApuNt39ioGeKQPRj4Xc0_7zLNpP6O6BdA/rs:fit:1200:1199:1/g:ce/aHR0cHM6Ly80LmJw/LmJsb2dzcG90LmNv/bS8taWRxQWhudUE1/c0EvV0xNZEFsTmRr/WUkvQUFBQUFBQUFD/TmsvY3kyRHFtZUFS/OU1UX0c2bjN4QnB0/a25iSDR0SHZVdkFn/Q0xjQi9zMTYwMC9m/cmFuei1rYWZrYS5q/cGc"),
                new Autor(4L, "Mary Shelley", "", "https://imgs.search.brave.com/LSxGDFI9HWUuebBHGPyhG5y0EK-BSlJq6Qja7-GPA5Y/rs:fit:1200:902:1/g:ce/aHR0cHM6Ly9mdGht/Yi50cW4uY29tL21T/MUh6UGNpeDNDendm/TUVWNGU4MURWQ1Ni/cyUzZC8xMjAzeDkw/Mi9maWx0ZXJzOmZp/bGwoYXV0byUyYzEp/L01hcnktU2hlbGxl/eS0xNzExOTQwMzR4/LTU2YWEyM2E0M2Rm/NzhjZjc3MmFjODc5/ZC5qcGc"),
                new Autor(5L, "Arthur Schopenhauer", "", "https://imgs.search.brave.com/GZN7Wo3BqEjIaYzAyOqxPriaIpEkmJVn5VxzkQdHIt4/rs:fit:1200:1153:1/g:ce/aHR0cHM6Ly93d3cu/Ymlvc2lnbG9zLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAw/OC8wOC9hcnRodXIt/c2Nob3BlbmhhdWVy/LTE1MzZ4MTE1My5q/cGc"),
                new Autor(6L, "Liev Tolstói", "", "https://imgs.search.brave.com/nK73q3VXsPIZsiGfFHdRcWMx8_350a__0Vzbkwv0exI/rs:fit:1200:1164:1/g:ce/aHR0cHM6Ly8xLmJw/LmJsb2dzcG90LmNv/bS8tcUhGWmt6dFVE/Q0UvVjlJT3RYUmV0/dkkvQUFBQUFBQUFi/cVEvUGxoYVdXUTNl/QUFOaTBwTUxVcGZh/VVVEQlN1cFBiNWl3/Q0xjQi9zMTYwMC9N/VEU1TlRVMk16STBP/VFF4TURBMk16UTMu/anBn")

        ));

        request.setAttribute("livros", livros);
        request.setAttribute("autores", autores);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
