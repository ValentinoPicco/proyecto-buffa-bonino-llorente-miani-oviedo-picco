package ar.edu.unrc.gestioncursos.simulador.ui;

import ar.edu.unrc.gestioncursos.simulador.api.FlowableRestClient;
import ar.edu.unrc.gestioncursos.simulador.config.AppConfig;

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

/**
 * Ventana principal provisoria del Paso 1.
 * En el Paso 3 se reemplaza por la tabla de solicitudes y las acciones.
 */
public final class MainFrame extends JFrame {

    public MainFrame(AppConfig config, FlowableRestClient cliente, String usuario) {
        super("Simulador de comunicaciones");
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        JPanel contenido = new JPanel(new BorderLayout(0, 14));
        contenido.setBorder(BorderFactory.createEmptyBorder(20, 24, 18, 24));

        JLabel titulo = new JLabel("Simulacion de comunicaciones");
        titulo.setFont(titulo.getFont().deriveFont(Font.BOLD, 20f));

        JLabel sesion = new JLabel("Usuario REST: " + usuario
                + "   |   Proceso: " + config.get("process.definitionKey", "Process_Curso"));
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
                Conexion establecida con la API REST de Flowable.

                En el proximo paso esta ventana mostrara:
                  - Las solicitudes activas del proceso Process_Curso.
                  - El estado actual de cada solicitud.
                  - Solo las comunicaciones habilitadas para ese estado:
                      aceptar propuesta, rechazar, pedir modificaciones,
                      enviar nomina y cancelar preparacion.

                URL de la API: %s
                Origen de configuracion: %s
                """.formatted(cliente.baseUrl(), config.getOrigen()));
        contenido.add(new JScrollPane(pendiente), BorderLayout.CENTER);

        JButton salir = new JButton("Salir");
        salir.addActionListener(evento -> dispose());
        JPanel pie = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        pie.add(salir);
        contenido.add(pie, BorderLayout.SOUTH);

        setContentPane(contenido);
        setPreferredSize(new Dimension(760, 460));
        pack();
        setLocationRelativeTo(null);
    }
}
