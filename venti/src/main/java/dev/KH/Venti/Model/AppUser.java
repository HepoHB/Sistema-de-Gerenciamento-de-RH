package dev.KH.Venti.Model;

import jakarta.persistence.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
@Table(name = "Venti_User")
public class AppUser {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id", nullable = false)
    private Long id;

    @Column(name = "user_name", nullable = false)
    private String name;

    @Column(name = "user_login", nullable = false)
    private String login;

    @Column(name = "user_password", nullable = false)
    private String password;

    //@Enumerated(EnumType.STRING)
    //@Column(name = "user_access_level", nullable = false)
    //private String accessLevel;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getName(){ return name; }
    public void setName(String name){ this.name = name; }

    public String getLogin(){ return login; }
    public void setLogin(String login){ this.login = login; }

    private static BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public String getPassword(){ return password; }
    public void setPassword(String password){ this.password = encoder.encode(password); }

}
