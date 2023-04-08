package br.com.gabrielxavier.enuns;

import java.util.ArrayList;
import java.util.List;

public enum CategoriaLivroEnum {

    FICCAO("Ficção"),
    NAO_FICCAO("Não-Ficção"),
    TERROR("Terror"),
    ROMANCE("Romance"),
    BIOGRAFIA("Biografia"),
    AUTOAJUDA("Auto-ajuda"),
    FILOSOFIA("Filosofia"),
    AVENTURA("Aventura"),
    TECNOLOGIA("Tecnologia");


    private final String name;

    CategoriaLivroEnum(String name) {
        this.name = name;
    }


    @Override
    public String toString() {
        return name;
    }


    public static List<String> getNames() {
        List<String> list = new ArrayList<>();
        for (CategoriaLivroEnum categoria : CategoriaLivroEnum.values()) {
            list.add(categoria.toString());
        }
        return list;
    }
}
