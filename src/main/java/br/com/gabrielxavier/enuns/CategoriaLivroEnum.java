package br.com.gabrielxavier.enuns;

import java.util.ArrayList;
import java.util.List;

public enum CategoriaLivroEnum {

    FICCAO("Ficção"),
    DISTOPIA("Distopia"),
    NAO_FICCAO("Não Ficção"),
    TERROR("Terror"),
    MISTERIO("Misterio"),
    TRAGEDIA("Tragédia"),
    FICCAO_POLITICA("Ficção política"),
    FICCAO_ABSURDA("Ficção absurda"),
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
