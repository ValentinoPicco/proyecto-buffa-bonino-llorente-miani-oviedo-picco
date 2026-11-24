package ar.edu.unrc.gestioncursos.simulador.ui;

import ar.edu.unrc.gestioncursos.simulador.api.FlowableRestClient;
import ar.edu.unrc.gestioncursos.simulador.config.AppConfig;
import com.fasterxml.jackson.databind.JsonNode;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.SwingWorker;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.util.Map;
import java.util.concurrent.ExecutionException;

public final class LoginFrame extends JFrame {

    private final AppConfig config;

    private final JTextField baseUrlField;
    private final JTextField usuarioField;
    private final JPasswordField passwordField;
    private final JButton probarButton = new JButton("Probar conexion");
    private final JButton ingresarButton = new JButton("Ingresar");
    private final JLabel estadoLabel = new JLabel(" ");

    public LoginFrame(AppConfig config) {
        super("Simulador de comunicaciones - Acceso");
        this.config = config;

        this.baseUrlField = new JTextField(config.get("rest.baseUrl", "http://localhost:8080/flowable-ui/process-api"), 30);
        this.usuarioField = new JTextField(config.get("rest.username", "admin"), 18);
        this.passwordField = new JPasswordField(config.get("rest.password", "test"), 18);

        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setContentPane(crearContenido());
        getRootPane().setDefaultButton(ingresarButton);
        probarButton.addActionListener(evento -> conectar(false));
        ingresarButton.addActionListener(evento -> conectar(true));
        setResizable(false);
        pack();
        setLocationRelativeTo(null);
    }

    private JPanel crearContenido() {
        JPanel contenedor = new JPanel(new BorderLayout(0, 16));
        contenedor.setBorder(BorderFactory.createEmptyBorder(24, 28, 20, 28));

        JLabel titulo = new JLabel("Simulacion de comunicaciones");
        titulo.setFont(titulo.getFont().deriveFont(Font.BOLD, 33f));

        JLabel subtitulo = new JLabel("Conexion con la API REST de Flowable");
        subtitulo.setForeground(new Color(90, 90, 90));

        JPanel encabezado = new JPanel();
        encabezado.setLayout(new javax.swing.BoxLayout(encabezado, javax.swing.BoxLayout.Y_AXIS));
        encabezado.add(titulo);
        encabezado.add(javax.swing.Box.createVerticalStrut(4));
        encabezado.add(subtitulo);
        contenedor.add(encabezado, BorderLayout.NORTH);

        JPanel formulario = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 0, 5, 10);
        gbc.anchor = GridBagConstraints.LINE_END;

        agregarFila(formulario, gbc, 0, "URL de la API", baseUrlField);
        agregarFila(formulario, gbc, 1, "Usuario", usuarioField);
        agregarFila(formulario, gbc, 2, "Contrasena", passwordField);

        JPanel centro = new JPanel();
        centro.setLayout(new javax.swing.BoxLayout(centro, javax.swing.BoxLayout.Y_AXIS));
        centro.add(formulario);
        centro.add(javax.swing.Box.createVerticalStrut(10));

        estadoLabel.setForeground(new Color(70, 70, 70));
        estadoLabel.setPreferredSize(new Dimension(1080, 540));
        centro.add(estadoLabel);
        contenedor.add(centro, BorderLayout.CENTER);

        JPanel pie = new JPanel(new BorderLayout(0, 10));
        JLabel configuracion = new JLabel("<html><span style='color:#777777'>Configuracion: "
                + escapar(config.getOrigen()) + "</span></html>");
        configuracion.setFont(configuracion.getFont().deriveFont(33f));
        pie.add(configuracion, BorderLayout.NORTH);

        JPanel botones = new JPanel(new FlowLayout(FlowLayout.RIGHT, 8, 0));
        botones.add(probarButton);
        botones.add(ingresarButton);
        pie.add(botones, BorderLayout.SOUTH);
        contenedor.add(pie, BorderLayout.SOUTH);

        return contenedor;
    }

    private static void agregarFila(JPanel panel, GridBagConstraints gbc, int fila, String etiqueta, javax.swing.JComponent campo) {
        gbc.gridx = 0;
        gbc.gridy = fila;
        gbc.anchor = GridBagConstraints.LINE_END;
        panel.add(new JLabel(etiqueta), gbc);
        gbc.gridx = 1;
        gbc.anchor = GridBagConstraints.LINE_START;
        panel.add(campo, gbc);
    }

    private void conectar(boolean abrirVentanaPrincipal) {
        String baseUrl = baseUrlField.getText().trim();
        String usuario = usuarioField.getText().trim();
        String password = new String(passwordField.getPassword());

        if (baseUrl.isEmpty() || usuario.isEmpty()) {
            estado("Complete la URL, el usuario y la contrasena.", new Color(160, 40, 40));
            return;
        }

        probarButton.setEnabled(false);
        ingresarButton.setEnabled(false);
        estado("Conectando con " + baseUrl + "...", new Color(70, 70, 70));

        new SwingWorker<JsonNode, Void>() {
            @Override
            protected JsonNode doInBackground() {
                FlowableRestClient cliente = new FlowableRestClient(
                        baseUrl,
                        usuario,
                        password,
                        config.getEntero("rest.connectTimeoutMs", 5000),
                        config.getEntero("rest.requestTimeoutMs", 15000));
                String processKey = config.get("process.definitionKey", "Process_Curso");
                return cliente.get("/repository/process-definitions",
                        Map.of("key", processKey, "latest", "true", "size", "10"));
            }

            @Override
            protected void done() {
                probarButton.setEnabled(true);
                ingresarButton.setEnabled(true);
                try {
                    JsonNode respuesta = get();
                    int total = respuesta.path("total").asInt(0);
                    if (total == 0) {
                        estado("Conexion exitosa, pero el proceso "
                                + config.get("process.definitionKey", "Process_Curso")
                                + " no esta deployado.", new Color(160, 90, 20));
                        return;
                    }
                    JsonNode definicion = respuesta.path("data").path(0);
                    String nombre = definicion.path("name").asText("(sin nombre)");
                    String version = definicion.path("version").asText("?");
                    estado("Conexion exitosa: " + nombre + " (version " + version + ").", new Color(30, 110, 50));

                    if (abrirVentanaPrincipal) {
                        FlowableRestClient cliente = new FlowableRestClient(
                                baseUrl,
                                usuario,
                                password,
                                config.getEntero("rest.connectTimeoutMs", 5000),
                                config.getEntero("rest.requestTimeoutMs", 15000));
                        MainFrame principal = new MainFrame(config, cliente, usuario);
                        principal.setVisible(true);
                        dispose();
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    estado("Operacion interrumpida.", new Color(160, 40, 40));
                } catch (ExecutionException e) {
                    estado("No se pudo conectar: " + mensajeDe(e.getCause()), new Color(160, 40, 40));
                }
            }
        }.execute();
    }

    private void estado(String texto, Color color) {
        estadoLabel.setForeground(color);
        estadoLabel.setText("<html>" + escapar(texto) + "</html>");
    }

    private static String mensajeDe(Throwable error) {
        Throwable actual = error;
        while (actual.getCause() != null && actual.getCause() != actual) {
            actual = actual.getCause();
        }
        return actual.getMessage() != null ? actual.getMessage() : actual.getClass().getSimpleName();
    }

    private static String escapar(String texto) {
        return texto.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    }
}
