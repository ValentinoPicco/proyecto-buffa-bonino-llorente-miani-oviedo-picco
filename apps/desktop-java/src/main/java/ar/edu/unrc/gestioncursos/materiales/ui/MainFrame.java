package ar.edu.unrc.gestioncursos.materiales.ui;

import ar.edu.unrc.gestioncursos.materiales.config.AppConfig;
import ar.edu.unrc.gestioncursos.materiales.engine.FlowableEngines;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.util.List;

/**
 * Ventana principal provisoria del Paso 1.
 * En el Paso 2 se reemplaza por la tabla de tareas Material.
 */
public final class MainFrame extends JFrame {

    public MainFrame(AppConfig config, FlowableEngines engines, String usuario, List<String> grupos) {
        super("Preparacion de materiales");
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        JPanel contenido = new JPanel(new BorderLayout(0, 14));
        contenido.setBorder(BorderFactory.createEmptyBorder(20, 24, 18, 24));

        JLabel titulo = new JLabel("Preparacion de materiales");
        titulo.setFont(titulo.getFont().deriveFont(Font.BOLD, 20f));

        JLabel sesion = new JLabel("Usuario: " + usuario
                + "   |   Grupos: " + (grupos.isEmpty() ? "(sin grupos)" : String.join(", ", grupos)));
        sesion.setForeground(new Color(80, 80, 80));

        JPanel encabezado = new JPanel();
        encabezado.setLayout(new javax.swing.BoxLayout(encabezado, javax.swing.BoxLayout.Y_AXIS));
        encabezado.add(titulo);
        encabezado.add(javax.swing.Box.createVerticalStrut(4));
        encabezado.add(sesion);
        contenido.add(encabezado, BorderLayout.NORTH);

        JTextArea pendiente = new JTextArea();
        pendiente.setEditable(false);
        pendiente.setLineWrap(true);
        pendiente.setWrapStyleWord(true);
        pendiente.setBackground(new Color(248, 248, 248));
        pendiente.setBorder(BorderFactory.createEmptyBorder(12, 12, 12, 12));
        pendiente.setText("""
                Conexion establecida con el motor Flowable.

                En el proximo paso esta ventana mostrara:
                  - Las tareas "Preparar materiales" asignadas al usuario.
                  - Las tareas disponibles para reclamar por el grupo Administracion.
                  - Los botones para reclamar y completar la tarea.

                Configuracion JDBC: %s
                Origen de configuracion: %s
                """.formatted(
                config.get("db.url", "(sin configurar)"),
                config.getOrigen()));
        contenido.add(new JScrollPane(pendiente), BorderLayout.CENTER);

        JButton salir = new JButton("Salir");
        salir.addActionListener(evento -> dispose());
        JPanel pie = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        pie.add(salir);
        contenido.add(pie, BorderLayout.SOUTH);

        setContentPane(contenido);
        setPreferredSize(new Dimension(720, 440));
        pack();
        setLocationRelativeTo(null);
    }
}
