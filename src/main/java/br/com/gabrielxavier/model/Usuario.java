package br.com.gabrielxavier.model;

import br.com.gabrielxavier.enuns.UserRole;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
public class Usuario {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;

    private String nome;
    private String email;
    @Enumerated(EnumType.STRING)
    private UserRole role;

}
