package org.codingpedia.demo.rest;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.sql.DataSource;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

public class TestSelectCommit {

    public static void main(String[] args) throws Exception {
        // On charge le contexte Spring
        ClassPathXmlApplicationContext ctx =
                new ClassPathXmlApplicationContext("/spring/application-context.xml");

        DataSource ds = ctx.getBean("restDemoDS", DataSource.class);

        try (Connection conn = ds.getConnection()) {
            System.out.println("autoCommit = " + conn.getAutoCommit());

            conn.setAutoCommit(false); // désactive l’auto-commit

            try (Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery("SELECT * FROM podcasts");
                while (rs.next()) {
                    System.out.println("Podcast: " + rs.getString("title"));
                }
            }

            // Ici, pas de commit encore
            System.out.println("Avant commit, vérifie avec une autre session si les données ont changé");

            // Optionnel : commit manuel
            conn.commit();
            System.out.println("Commit effectué");
        }
    }

    // Exemple de méthode avec Spring + @Transactional
    @Transactional(readOnly = true)
    public void selectWithTransaction() {
        // Hibernate va ouvrir une transaction mais ne committra rien
        // flush() n’est pas appelé sur un simple SELECT
    }
}
