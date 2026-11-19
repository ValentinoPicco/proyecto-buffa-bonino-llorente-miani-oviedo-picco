package ar.edu.unrc.gestioncursos.materiales;

import ar.edu.unrc.gestioncursos.materiales.config.AppConfig;
import ar.edu.unrc.gestioncursos.materiales.engine.FlowableEngines;
import ar.edu.unrc.gestioncursos.materiales.ui.LoginFrame;

import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import java.awt.Font;

public final class Main {

    private Main() {
    }

    public static void main(String[] args) {
        configurarLookAndFeel();

        AppConfig config;
        try {
            config = AppConfig.load();
        } catch (RuntimeException e) {
            mostrarErrorFatal("No se pudo cargar la configuracion.", e);
            return;
        }

        FlowableEngines engines;
        try {
            engines = FlowableEngines.create(config);
        } catch (RuntimeException e) {
            mostrarErrorFatal(
                    "No se pudo conectar con el motor Flowable.\n"
                            + "Verifique que Docker este levantado y que la configuracion JDBC sea correcta.\n\n"
                            + "Configuracion usada: " + config.getOrigen(),
                    e);
            return;
        }

        Runtime.getRuntime().addShutdownHook(new Thread(engines::close, "cierre-motores-flowable"));

        SwingUtilities.invokeLater(() -> {
            LoginFrame login = new LoginFrame(config, engines);
            login.setVisible(true);
        });
    }

    private static void configurarLookAndFeel() {
        try {
            for (UIManager.LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (Exception ignored) {
            // Se usa el look and feel por defecto.
        }
        Font base = UIManager.getFont("Label.font");
        if (base != null) {
            UIManager.put("Label.font", base.deriveFont(base.getSize2D() + 1f));
        }
    }

    private static void mostrarErrorFatal(String mensaje, Throwable error) {
        error.printStackTrace();
        SwingUtilities.invokeLater(() -> JOptionPane.showMessageDialog(
                null,
                mensaje + "\n\nDetalle: " + mensajeDe(error),
                "Error al iniciar la aplicacion",
                JOptionPane.ERROR_MESSAGE));
    }

    private static String mensajeDe(Throwable error) {
        Throwable actual = error;
        while (actual.getCause() != null && actual.getCause() != actual) {
            actual = actual.getCause();
        }
        return actual.getMessage() != null ? actual.getMessage() : actual.getClass().getSimpleName();
    }
}
