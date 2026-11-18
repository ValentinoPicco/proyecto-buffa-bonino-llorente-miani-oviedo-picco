package ar.edu.unrc.gestioncursos.simulador;

import ar.edu.unrc.gestioncursos.simulador.config.AppConfig;
import ar.edu.unrc.gestioncursos.simulador.ui.LoginFrame;

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
            e.printStackTrace();
            SwingUtilities.invokeLater(() -> JOptionPane.showMessageDialog(
                    null,
                    "No se pudo cargar la configuracion.\n\nDetalle: " + e.getMessage(),
                    "Error al iniciar la aplicacion",
                    JOptionPane.ERROR_MESSAGE));
            return;
        }

        SwingUtilities.invokeLater(() -> {
            LoginFrame login = new LoginFrame(config);
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
}
