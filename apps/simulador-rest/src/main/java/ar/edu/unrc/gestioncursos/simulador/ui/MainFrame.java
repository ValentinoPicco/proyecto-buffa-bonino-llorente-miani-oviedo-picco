package ar.edu.unrc.gestioncursos.simulador.ui;

import ar.edu.unrc.gestioncursos.simulador.api.FlowableRestClient;
import ar.edu.unrc.gestioncursos.simulador.config.AppConfig;
import ar.edu.unrc.gestioncursos.simulador.model.SolicitudActiva;
import ar.edu.unrc.gestioncursos.simulador.service.SimuladorSolicitudes;

import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.SwingWorker;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableColumnModel;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * Ventana principal del simulador 4.2.2.
 *
 * Lista las instancias activas de Process_Curso y habilita solo las
 * comunicaciones que el estado real de la instancia permite: aceptar, rechazar
 * o pedir modificaciones sobre la propuesta, enviar la nomina y cancelar la
 * preparacion.
 */
public final class MainFrame extends JFrame {

    private static final Color TEXTO_NORMAL = new Color(70, 70, 70);
    private static final Color TEXTO_ERROR = new Color(160, 40, 40);
    private static final Color TEXTO_EXITO = new Color(30, 110, 50);

    private final String usuario;
    private final String processDefinitionKey;
    private final SimuladorSolicitudes simulador;

    private final SolicitudTableModel modelo = new SolicitudTableModel();
    private final JTable tabla = new JTable(modelo);
    private final JButton actualizarButton = new JButton("Actualizar");
    private final JButton aceptarButton = new JButton("Aceptar propuesta");
    private final JButton rechazarButton = new JButton("Rechazar");
    private final JButton modificarButton = new JButton("Solicitar modificaciones");
    private final JButton nominaButton = new JButton("Enviar nómina");
    private final JButton cancelarButton = new JButton("Cancelar preparación");
    private final JButton salirButton = new JButton("Salir");
    private final JLabel estadoLabel = new JLabel(" ");
    private final JTextArea detalle = new JTextArea();

    private boolean ocupado;

    public MainFrame(AppConfig config, FlowableRestClient cliente, String usuario) {
        super("Simulador de comunicaciones");
        this.usuario = usuario;
        this.processDefinitionKey = config.get("process.definitionKey", "Process_Curso");
        this.simulador = new SimuladorSolicitudes(cliente, config);

        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setContentPane(crearContenido());
        configurarTabla();
        conectarEventos();

        setPreferredSize(new Dimension(1120, 700));
        pack();
        setLocationRelativeTo(null);
        cargar(null);
    }

    private JPanel crearContenido() {
        JPanel contenido = new JPanel(new BorderLayout(0, 12));
        contenido.setBorder(BorderFactory.createEmptyBorder(18, 22, 16, 22));

        JLabel titulo = new JLabel("Simulación de comunicaciones");
        titulo.setFont(titulo.getFont().deriveFont(Font.BOLD, 20f));

        JLabel sesion = new JLabel("Usuario REST: " + usuario + "   |   Proceso: " + processDefinitionKey);
        sesion.setForeground(new Color(80, 80, 80));

        JPanel textos = new JPanel();
        textos.setLayout(new BoxLayout(textos, BoxLayout.Y_AXIS));
        textos.add(titulo);
        textos.add(Box.createVerticalStrut(4));
        textos.add(sesion);

        JPanel accionesEncabezado = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        accionesEncabezado.add(actualizarButton);

        JPanel encabezado = new JPanel(new BorderLayout());
        encabezado.add(textos, BorderLayout.WEST);
        encabezado.add(accionesEncabezado, BorderLayout.EAST);
        contenido.add(encabezado, BorderLayout.NORTH);

        JScrollPane scrollTabla = new JScrollPane(tabla);
        scrollTabla.setBorder(BorderFactory.createTitledBorder(
                "Solicitudes activas del proceso " + processDefinitionKey));

        detalle.setEditable(false);
        detalle.setLineWrap(true);
        detalle.setWrapStyleWord(true);
        detalle.setFont(new Font(Font.MONOSPACED, Font.PLAIN, 12));
        detalle.setBackground(new Color(249, 249, 249));
        detalle.setBorder(BorderFactory.createEmptyBorder(8, 10, 8, 10));
        JScrollPane scrollDetalle = new JScrollPane(detalle);
        scrollDetalle.setBorder(BorderFactory.createTitledBorder("Detalle y comunicaciones habilitadas"));

        JSplitPane division = new JSplitPane(JSplitPane.VERTICAL_SPLIT, scrollTabla, scrollDetalle);
        division.setResizeWeight(0.55);
        division.setDividerLocation(300);
        contenido.add(division, BorderLayout.CENTER);

        JPanel pie = new JPanel(new BorderLayout(0, 8));
        estadoLabel.setForeground(TEXTO_NORMAL);
        pie.add(estadoLabel, BorderLayout.CENTER);

        JPanel botones = new JPanel(new FlowLayout(FlowLayout.RIGHT, 6, 0));
        botones.add(aceptarButton);
        botones.add(rechazarButton);
        botones.add(modificarButton);
        botones.add(nominaButton);
        botones.add(cancelarButton);
        botones.add(salirButton);
        pie.add(botones, BorderLayout.EAST);
        contenido.add(pie, BorderLayout.SOUTH);

        return contenido;
    }

    private void configurarTabla() {
        tabla.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tabla.setRowHeight(24);
        tabla.setFillsViewportHeight(true);
        tabla.getTableHeader().setReorderingAllowed(false);
        tabla.setAutoCreateRowSorter(false);

        TableColumnModel columnas = tabla.getColumnModel();
        columnas.getColumn(0).setPreferredWidth(230);
        columnas.getColumn(1).setPreferredWidth(180);
        columnas.getColumn(2).setPreferredWidth(210);
        columnas.getColumn(3).setPreferredWidth(80);
        columnas.getColumn(4).setPreferredWidth(95);
        columnas.getColumn(5).setPreferredWidth(135);
    }

    private void conectarEventos() {
        actualizarButton.addActionListener(evento -> cargar(null));
        aceptarButton.addActionListener(evento -> aceptar());
        rechazarButton.addActionListener(evento -> rechazar());
        modificarButton.addActionListener(evento -> solicitarModificaciones());
        nominaButton.addActionListener(evento -> enviarNomina());
        cancelarButton.addActionListener(evento -> cancelar());
        salirButton.addActionListener(evento -> dispose());
        tabla.getSelectionModel().addListSelectionListener(evento -> {
            if (!evento.getValueIsAdjusting()) {
                mostrarSeleccion();
            }
        });
    }

    private void cargar(String mensajeExito) {
        ocupado = true;
        bloquear();
        String idSeleccionado = seleccionada() == null ? null : seleccionada().id();
        estado("Consultando solicitudes activas...", TEXTO_NORMAL);

        new SwingWorker<List<SolicitudActiva>, Void>() {
            @Override
            protected List<SolicitudActiva> doInBackground() {
                return simulador.listar();
            }

            @Override
            protected void done() {
                ocupado = false;
                actualizarButton.setEnabled(true);
                try {
                    List<SolicitudActiva> solicitudes = get();
                    modelo.setSolicitudes(solicitudes);

                    if (idSeleccionado != null) {
                        int fila = modelo.indiceDe(idSeleccionado);
                        if (fila >= 0) {
                            tabla.setRowSelectionInterval(fila, fila);
                        }
                    }

                    if (solicitudes.isEmpty()) {
                        limpiarDetalle();
                        estado("No hay solicitudes activas del proceso "
                                + processDefinitionKey + "." + sufijo(mensajeExito), TEXTO_NORMAL);
                        return;
                    }

                    if (tabla.getSelectedRow() < 0) {
                        tabla.setRowSelectionInterval(0, 0);
                    }
                    estado(solicitudes.size() + " solicitud(es) activa(s)." + sufijo(mensajeExito), TEXTO_NORMAL);
                    mostrarSeleccion();
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    estado("Operación interrumpida.", TEXTO_ERROR);
                } catch (ExecutionException e) {
                    estado("No se pudieron consultar las solicitudes: " + mensajeDe(e.getCause()), TEXTO_ERROR);
                    mostrarError("No se pudieron consultar las solicitudes.", e.getCause());
                }
            }
        }.execute();
    }

    private void aceptar() {
        SolicitudActiva solicitud = seleccionada();
        if (solicitud == null) {
            return;
        }
        String fecha = pedirFecha(solicitud);
        if (fecha == null) {
            return;
        }
        ejecutar("Enviando aceptación de la propuesta...",
                () -> simulador.aceptar(solicitud, fecha),
                "Aceptación enviada. La empresa aceptó la propuesta.");
    }

    private void rechazar() {
        SolicitudActiva solicitud = seleccionada();
        if (solicitud == null) {
            return;
        }
        int opcion = JOptionPane.showConfirmDialog(
                this,
                "¿Rechazar la propuesta del curso \"" + valor(solicitud.texto("cursoNombre")) + "\"?\n\n"
                        + "La solicitud se cerrará sin curso.",
                "Rechazar propuesta",
                JOptionPane.YES_NO_OPTION,
                JOptionPane.WARNING_MESSAGE);
        if (opcion == JOptionPane.YES_OPTION) {
            ejecutar("Enviando rechazo de la propuesta...",
                    () -> simulador.rechazar(solicitud),
                    "Rechazo enviado. La solicitud se cerrará.");
        }
    }

    private void solicitarModificaciones() {
        SolicitudActiva solicitud = seleccionada();
        if (solicitud == null) {
            return;
        }
        String observaciones = pedirTexto(
                "Solicitar modificaciones",
                "Indique las modificaciones solicitadas por la empresa:",
                solicitud.texto("observacionesEmpresa"),
                6);
        if (observaciones == null) {
            return;
        }
        ejecutar("Enviando solicitud de modificaciones...",
                () -> simulador.solicitarModificaciones(solicitud, observaciones),
                "Solicitud de modificaciones enviada.");
    }

    private void enviarNomina() {
        SolicitudActiva solicitud = seleccionada();
        if (solicitud == null) {
            return;
        }
        String nomina = pedirTexto(
                "Enviar nómina",
                "Ingrese la nómina de participantes (un participante por línea):",
                solicitud.texto("nominaParticipantes"),
                8);
        if (nomina == null) {
            return;
        }
        ejecutar("Enviando nómina de participantes...",
                () -> simulador.enviarNomina(solicitud, nomina),
                "Nómina enviada. La recepción de nómina quedó completada.");
    }

    private void cancelar() {
        SolicitudActiva solicitud = seleccionada();
        if (solicitud == null) {
            return;
        }
        int opcion = JOptionPane.showConfirmDialog(
                this,
                "¿Cancelar la preparación del curso \"" + valor(solicitud.texto("cursoNombre")) + "\"?\n\n"
                        + "Se disparará el evento de cancelación y se liberarán los recursos.",
                "Cancelar preparación",
                JOptionPane.YES_NO_OPTION,
                JOptionPane.WARNING_MESSAGE);
        if (opcion == JOptionPane.YES_OPTION) {
            ejecutar("Enviando cancelación...",
                    () -> simulador.cancelar(solicitud),
                    "Cancelación enviada. La solicitud quedó cancelada.");
        }
    }

    private void ejecutar(String descripcion, Runnable accion, String mensajeExito) {
        ocupado = true;
        bloquear();
        estado(descripcion, TEXTO_NORMAL);

        new SwingWorker<Void, Void>() {
            @Override
            protected Void doInBackground() {
                accion.run();
                return null;
            }

            @Override
            protected void done() {
                try {
                    get();
                    ocupado = false;
                    cargar(mensajeExito);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    ocupado = false;
                    cargar(null);
                } catch (ExecutionException e) {
                    ocupado = false;
                    estado("No se pudo completar la acción: " + mensajeDe(e.getCause()), TEXTO_ERROR);
                    mostrarError("No se pudo completar la acción.", e.getCause());
                    cargar(null);
                }
            }
        }.execute();
    }

    private String pedirFecha(SolicitudActiva solicitud) {
        JTextField campo = new JTextField(fechaSugerida(solicitud), 26);
        JPanel panel = new JPanel(new BorderLayout(0, 8));
        panel.add(new JLabel("<html>Fecha y hora acordada en formato ISO-8601:"
                + "<br><span style='color:#777777'>Ejemplo: 2026-11-18T15:30:00Z</span></html>"),
                BorderLayout.NORTH);
        panel.add(campo, BorderLayout.CENTER);

        while (true) {
            int opcion = JOptionPane.showConfirmDialog(
                    this,
                    panel,
                    "Aceptar propuesta",
                    JOptionPane.OK_CANCEL_OPTION,
                    JOptionPane.QUESTION_MESSAGE);
            if (opcion != JOptionPane.OK_OPTION) {
                return null;
            }

            String valor = campo.getText().trim();
            try {
                OffsetDateTime.parse(valor);
                return valor;
            } catch (DateTimeParseException e) {
                JOptionPane.showMessageDialog(
                        this,
                        "La fecha no es válida.\n\nUse el formato ISO-8601, por ejemplo:\n2026-11-18T15:30:00Z",
                        "Fecha inválida",
                        JOptionPane.ERROR_MESSAGE);
                campo.requestFocusInWindow();
                campo.selectAll();
            }
        }
    }

    private String pedirTexto(String titulo, String mensaje, String valorInicial, int filas) {
        JTextArea area = new JTextArea(valorInicial == null ? "" : valorInicial, filas, 48);
        area.setLineWrap(true);
        area.setWrapStyleWord(true);
        JScrollPane scroll = new JScrollPane(area);

        JPanel panel = new JPanel(new BorderLayout(0, 8));
        panel.add(new JLabel("<html>" + escapar(mensaje) + "</html>"), BorderLayout.NORTH);
        panel.add(scroll, BorderLayout.CENTER);

        while (true) {
            int opcion = JOptionPane.showConfirmDialog(
                    this,
                    panel,
                    titulo,
                    JOptionPane.OK_CANCEL_OPTION,
                    JOptionPane.QUESTION_MESSAGE);
            if (opcion != JOptionPane.OK_OPTION) {
                return null;
            }

            String texto = area.getText().trim();
            if (!texto.isEmpty()) {
                return texto;
            }
            JOptionPane.showMessageDialog(
                    this,
                    "Debe completar este campo.",
                    "Dato requerido",
                    JOptionPane.WARNING_MESSAGE);
            area.requestFocusInWindow();
        }
    }

    private static String fechaSugerida(SolicitudActiva solicitud) {
        String acordada = solicitud.texto("fechaCurso");
        if (!acordada.isBlank()) {
            return acordada;
        }

        String fechas = solicitud.texto("fechasPosibles");
        if (fechas.isBlank()) {
            fechas = solicitud.texto("fechasPreferidas");
        }
        if (fechas.isBlank()) {
            return "";
        }

        String primera = fechas.split(",")[0].trim();
        return primera.matches("\\d{4}-\\d{2}-\\d{2}") ? primera + "T13:00:00Z" : "";
    }

    private void mostrarSeleccion() {
        SolicitudActiva solicitud = seleccionada();
        if (solicitud == null) {
            limpiarDetalle();
            return;
        }

        detalle.setText(formatear(solicitud));
        detalle.setCaretPosition(0);

        if (ocupado) {
            deshabilitarAcciones();
            return;
        }

        aceptarButton.setEnabled(simulador.puedeAceptar(solicitud));
        rechazarButton.setEnabled(simulador.puedeRechazar(solicitud));
        modificarButton.setEnabled(simulador.puedeModificar(solicitud));
        nominaButton.setEnabled(simulador.puedeEnviarNomina(solicitud));
        cancelarButton.setEnabled(simulador.puedeCancelar(solicitud));
    }

    private void limpiarDetalle() {
        detalle.setText("Seleccione una solicitud para ver el detalle y las comunicaciones habilitadas.");
        detalle.setCaretPosition(0);
        deshabilitarAcciones();
    }

    private String formatear(SolicitudActiva solicitud) {
        StringBuilder texto = new StringBuilder();
        texto.append("Estado:               ").append(simulador.estado(solicitud)).append('\n');
        texto.append("Comunicaciones:       ");
        List<String> acciones = simulador.accionesHabilitadas(solicitud);
        texto.append(acciones.isEmpty() ? "ninguna en este estado" : String.join(", ", acciones));
        texto.append('\n');
        texto.append("Actividades activas:  ")
                .append(solicitud.nombresActividadesActivas().isEmpty()
                        ? "—"
                        : String.join(", ", solicitud.nombresActividadesActivas()))
                .append('\n');
        texto.append('\n');

        agregarLinea(texto, "Solicitud", solicitud.texto("solicitudId").isBlank()
                ? solicitud.businessKey()
                : solicitud.texto("solicitudId"));
        agregarLinea(texto, "Empresa", solicitud.texto("empresaNombre"));
        agregarLinea(texto, "Contacto", solicitud.texto("empresaContacto"));
        agregarLinea(texto, "Curso", solicitud.texto("cursoNombre"));
        agregarLinea(texto, "Descripción", solicitud.texto("cursoDescripcion"));
        agregarLinea(texto, "Participantes", solicitud.texto("cantidadParticipantes"));
        agregarLinea(texto, "Fechas preferidas", solicitud.texto("fechasPreferidas"));
        agregarLinea(texto, "Fechas posibles", solicitud.texto("fechasPosibles"));
        agregarLinea(texto, "Fecha acordada", solicitud.texto("fechaCurso"));
        agregarLinea(texto, "Programa propuesto", solicitud.texto("programaPropuesto"));
        agregarLinea(texto, "Presupuesto", solicitud.texto("presupuesto"));
        agregarLinea(texto, "Versión propuesta", solicitud.texto("versionPropuesta"));
        agregarLinea(texto, "Observaciones", solicitud.texto("observacionesEmpresa"));
        agregarLinea(texto, "Nómina", solicitud.texto("nominaParticipantes"));
        agregarLinea(texto, "Estado del curso", solicitud.texto("estadoCurso"));
        agregarLinea(texto, "Resultado", solicitud.texto("resultadoProceso"));
        agregarLinea(texto, "Otras instancias", solicitud.texto("otrasInstancias"));
        agregarLinea(texto, "Inicio", formatearInicio(solicitud.inicio()));
        agregarLinea(texto, "Definición", version(solicitud));
        agregarLinea(texto, "Instancia", solicitud.id());

        return texto.toString();
    }

    private static void agregarLinea(StringBuilder texto, String etiqueta, String valor) {
        if (valor != null && !valor.isBlank()) {
            texto.append(String.format("%-21s%s%n", etiqueta + ":", valor));
        }
    }

    private static String version(SolicitudActiva solicitud) {
        String[] partes = solicitud.processDefinitionId().split(":");
        return partes.length >= 2 ? "v" + partes[1] : valor(solicitud.processDefinitionId());
    }

    private static String formatearInicio(OffsetDateTime inicio) {
        if (inicio == null) {
            return "";
        }
        return DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")
                .format(inicio.atZoneSameInstant(ZoneId.systemDefault()));
    }

    private SolicitudActiva seleccionada() {
        int fila = tabla.getSelectedRow();
        return fila < 0 ? null : modelo.get(fila);
    }

    private void bloquear() {
        actualizarButton.setEnabled(false);
        deshabilitarAcciones();
    }

    private void deshabilitarAcciones() {
        aceptarButton.setEnabled(false);
        rechazarButton.setEnabled(false);
        modificarButton.setEnabled(false);
        nominaButton.setEnabled(false);
        cancelarButton.setEnabled(false);
    }

    private void estado(String mensaje, Color color) {
        estadoLabel.setForeground(color);
        estadoLabel.setText(mensaje);
    }

    private void mostrarError(String contexto, Throwable error) {
        JOptionPane.showMessageDialog(
                this,
                contexto + "\n\nDetalle: " + mensajeDe(error),
                "Error",
                JOptionPane.ERROR_MESSAGE);
    }

    private static String sufijo(String mensaje) {
        return mensaje == null || mensaje.isBlank() ? "" : " " + mensaje;
    }

    private static String mensajeDe(Throwable error) {
        Throwable actual = error;
        while (actual.getCause() != null && actual.getCause() != actual) {
            actual = actual.getCause();
        }
        return actual.getMessage() != null ? actual.getMessage() : actual.getClass().getSimpleName();
    }

    private static String valor(String texto) {
        return texto == null || texto.isBlank() ? "—" : texto;
    }

    private static String escapar(String texto) {
        return texto.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    }

    private final class SolicitudTableModel extends AbstractTableModel {

        private static final String[] COLUMNAS = {
                "Estado", "Empresa", "Curso", "Solicitud", "Participantes", "Inicio"
        };

        private List<SolicitudActiva> solicitudes = List.of();

        void setSolicitudes(List<SolicitudActiva> solicitudes) {
            this.solicitudes = solicitudes;
            fireTableDataChanged();
        }

        SolicitudActiva get(int fila) {
            return solicitudes.get(fila);
        }

        int indiceDe(String id) {
            for (int i = 0; i < solicitudes.size(); i++) {
                if (solicitudes.get(i).id().equals(id)) {
                    return i;
                }
            }
            return -1;
        }

        @Override
        public int getRowCount() {
            return solicitudes.size();
        }

        @Override
        public int getColumnCount() {
            return COLUMNAS.length;
        }

        @Override
        public String getColumnName(int columna) {
            return COLUMNAS[columna];
        }

        @Override
        public Object getValueAt(int fila, int columna) {
            SolicitudActiva solicitud = solicitudes.get(fila);
            return switch (columna) {
                case 0 -> simulador.estado(solicitud);
                case 1 -> valor(solicitud.texto("empresaNombre"));
                case 2 -> valor(solicitud.texto("cursoNombre"));
                case 3 -> valor(solicitud.texto("solicitudId").isBlank()
                        ? solicitud.businessKey()
                        : solicitud.texto("solicitudId"));
                case 4 -> valor(solicitud.texto("cantidadParticipantes"));
                case 5 -> valor(formatearInicio(solicitud.inicio()));
                default -> "";
            };
        }
    }
}
