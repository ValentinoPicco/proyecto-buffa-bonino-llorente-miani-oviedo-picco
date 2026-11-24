package ar.edu.unrc.gestioncursos.materiales.ui;

import ar.edu.unrc.gestioncursos.materiales.config.AppConfig;
import ar.edu.unrc.gestioncursos.materiales.engine.FlowableEngines;
import org.flowable.idm.api.Group;
import org.flowable.idm.api.IdmIdentityService;

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
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.util.List;
import java.util.concurrent.ExecutionException;

public final class LoginFrame extends JFrame {

    private final AppConfig config;
    private final FlowableEngines engines;

    private final JTextField usuarioField = new JTextField(22);
    private final JPasswordField passwordField = new JPasswordField(22);
    private final JButton ingresarButton = new JButton("Ingresar");
    private final JLabel estadoLabel = new JLabel(" ");

    public LoginFrame(AppConfig config, FlowableEngines engines) {
        super("Preparacion de materiales - Acceso");
        this.config = config;
        this.engines = engines;

        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setContentPane(crearContenido());
        getRootPane().setDefaultButton(ingresarButton);
        ingresarButton.addActionListener(evento -> ingresar());
        setResizable(false);
        pack();
        setLocationRelativeTo(null);
    }

    private JPanel crearContenido() {
        JPanel contenedor = new JPanel(new BorderLayout(0, 16));
        contenedor.setBorder(BorderFactory.createEmptyBorder(24, 28, 20, 28));

        JLabel titulo = new JLabel("Preparacion de materiales");
        titulo.setFont(titulo.getFont().deriveFont(Font.BOLD, 33f));

        JLabel subtitulo = new JLabel("Acceso con credenciales de Flowable");
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

        gbc.gridx = 0;
        gbc.gridy = 0;
        formulario.add(new JLabel("Usuario"), gbc);
        gbc.gridx = 1;
        gbc.anchor = GridBagConstraints.LINE_START;
        formulario.add(usuarioField, gbc);

        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.anchor = GridBagConstraints.LINE_END;
        formulario.add(new JLabel("Contrasena"), gbc);
        gbc.gridx = 1;
        gbc.anchor = GridBagConstraints.LINE_START;
        formulario.add(passwordField, gbc);

        JPanel centro = new JPanel();
        centro.setLayout(new javax.swing.BoxLayout(centro, javax.swing.BoxLayout.Y_AXIS));
        centro.add(formulario);
        centro.add(javax.swing.Box.createVerticalStrut(10));

        estadoLabel.setForeground(new Color(160, 40, 40));
        estadoLabel.setPreferredSize(new Dimension(1080, 540));
        centro.add(estadoLabel);
        contenedor.add(centro, BorderLayout.CENTER);

        JPanel pie = new JPanel(new BorderLayout(0, 10));
        JLabel configuracion = new JLabel("<html><span style='color:#777777'>Base: "
                + escapar(config.get("db.url", "(sin configurar)"))
                + "<br>Configuracion: " + escapar(config.getOrigen())
                + "</span></html>");
        configuracion.setFont(configuracion.getFont().deriveFont(33f));
        pie.add(configuracion, BorderLayout.NORTH);

        JPanel botones = new JPanel(new java.awt.FlowLayout(java.awt.FlowLayout.RIGHT, 0, 0));
        botones.add(ingresarButton);
        pie.add(botones, BorderLayout.SOUTH);
        contenedor.add(pie, BorderLayout.SOUTH);

        return contenedor;
    }

    private void ingresar() {
        String usuario = usuarioField.getText().trim();
        String password = new String(passwordField.getPassword());

        if (usuario.isEmpty() || password.isEmpty()) {
            estadoLabel.setText("Ingrese usuario y contrasena.");
            return;
        }

        ingresarButton.setEnabled(false);
        estadoLabel.setForeground(new Color(70, 70, 70));
        estadoLabel.setText("Verificando credenciales...");

        new SwingWorker<List<String>, Void>() {
            @Override
            protected List<String> doInBackground() {
                IdmIdentityService idm = engines.idmIdentityService();
                if (!idm.checkPassword(usuario, password)) {
                    return null;
                }
                return idm.createGroupQuery().groupMember(usuario).list()
                        .stream()
                        .map(Group::getId)
                        .sorted()
                        .toList();
            }

            @Override
            protected void done() {
                try {
                    List<String> grupos = get();
                    if (grupos == null) {
                        estadoLabel.setForeground(new Color(160, 40, 40));
                        estadoLabel.setText("Usuario o contrasena incorrectos.");
                        ingresarButton.setEnabled(true);
                        passwordField.selectAll();
                        passwordField.requestFocusInWindow();
                        return;
                    }
                    MainFrame principal = new MainFrame(config, engines, usuario, grupos);
                    principal.setVisible(true);
                    dispose();
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    estadoLabel.setText("Operacion interrumpida.");
                    ingresarButton.setEnabled(true);
                } catch (ExecutionException e) {
                    estadoLabel.setForeground(new Color(160, 40, 40));
                    estadoLabel.setText("Error al validar el usuario: " + mensajeDe(e.getCause()));
                    ingresarButton.setEnabled(true);
                }
            }
        }.execute();
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
