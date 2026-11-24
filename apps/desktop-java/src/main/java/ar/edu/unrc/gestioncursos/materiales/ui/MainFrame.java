package ar.edu.unrc.gestioncursos.materiales.ui;

import ar.edu.unrc.gestioncursos.materiales.config.AppConfig;
import ar.edu.unrc.gestioncursos.materiales.engine.FlowableEngines;
import ar.edu.unrc.gestioncursos.materiales.model.TareaMaterial;
import ar.edu.unrc.gestioncursos.materiales.service.TareasMateriales;

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
import javax.swing.ListSelectionModel;
import javax.swing.SwingWorker;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableColumnModel;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * Ventana principal del Paso 2: lista las tareas "Preparar materiales"
 * asignadas al usuario o disponibles para reclamar por su grupo, y permite
 * reclamarlas y completarlas.
 */
public final class MainFrame extends JFrame {

    private static final Color TEXTO_NORMAL = new Color(70, 70, 70);
    private static final Color TEXTO_ERROR = new Color(160, 40, 40);
    private static final Color TEXTO_EXITO = new Color(30, 110, 50);

    private final String usuario;
    private final List<String> grupos;
    private final TareasMateriales tareas;

    private final TareaTableModel modelo = new TareaTableModel();
    private final JTable tabla = new JTable(modelo);
    private final JButton actualizarButton = new JButton("Actualizar");
    private final JButton reclamarButton = new JButton("Reclamar");
    private final JButton completarButton = new JButton("Completar tarea");
    private final JButton salirButton = new JButton("Salir");
    private final JLabel estadoLabel = new JLabel(" ");
    private final JTextArea detalle = new JTextArea();

    public MainFrame(AppConfig config, FlowableEngines engines, String usuario, List<String> grupos) {
        super("Preparacion de materiales");
        this.usuario = usuario;
        this.grupos = grupos;
        this.tareas = new TareasMateriales(
                engines.taskService(),
                config.get("task.definitionKey", "Material"));

        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setContentPane(crearContenido());
        configurarTabla();
        conectarEventos();

        setPreferredSize(new Dimension(2100, 1400));
        pack();
        setLocationRelativeTo(null);
        actualizar();
    }

    private JPanel crearContenido() {
        JPanel contenido = new JPanel(new BorderLayout(0, 12));
        contenido.setBorder(BorderFactory.createEmptyBorder(18, 22, 16, 22));

        JLabel titulo = new JLabel("Preparacion de materiales");
        titulo.setFont(titulo.getFont().deriveFont(Font.BOLD, 33f));

        JLabel sesion = new JLabel("Usuario: " + usuario
                + "   |   Grupos: " + (grupos.isEmpty() ? "(sin grupos)" : String.join(", ", grupos)));
        sesion.setForeground(new Color(80, 80, 80));

        JPanel textos = new JPanel();
        textos.setLayout(new BoxLayout(textos, BoxLayout.Y_AXIS));
        textos.add(titulo);
        textos.add(Box.createVerticalStrut(4));
        textos.add(sesion);

        JPanel acciones = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        acciones.add(actualizarButton);

        JPanel encabezado = new JPanel(new BorderLayout());
        encabezado.add(textos, BorderLayout.WEST);
        encabezado.add(acciones, BorderLayout.EAST);
        contenido.add(encabezado, BorderLayout.NORTH);

        JScrollPane scrollTabla = new JScrollPane(tabla);
        scrollTabla.setBorder(BorderFactory.createTitledBorder(
                "Tareas \"Preparar materiales\" disponibles o asignadas"));

        detalle.setEditable(false);
        detalle.setLineWrap(true);
        detalle.setWrapStyleWord(true);
        detalle.setFont(new Font(Font.MONOSPACED, Font.PLAIN, 33));
        detalle.setBackground(new Color(249, 249, 249));
        detalle.setBorder(BorderFactory.createEmptyBorder(8, 10, 8, 10));
        JScrollPane scrollDetalle = new JScrollPane(detalle);
        scrollDetalle.setBorder(BorderFactory.createTitledBorder("Detalle de la solicitud"));

        JSplitPane division = new JSplitPane(JSplitPane.VERTICAL_SPLIT, scrollTabla, scrollDetalle);
        division.setResizeWeight(0.62);
        division.setDividerLocation(330);
        contenido.add(division, BorderLayout.CENTER);

        JPanel pie = new JPanel(new BorderLayout(0, 8));
        estadoLabel.setForeground(TEXTO_NORMAL);
        pie.add(estadoLabel, BorderLayout.CENTER);

        JPanel botones = new JPanel(new FlowLayout(FlowLayout.RIGHT, 8, 0));
        botones.add(reclamarButton);
        botones.add(completarButton);
        botones.add(salirButton);
        pie.add(botones, BorderLayout.EAST);
        contenido.add(pie, BorderLayout.SOUTH);

        return contenido;
    }

    private void configurarTabla() {
        tabla.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tabla.setFont(tabla.getFont().deriveFont(33f));
        tabla.getTableHeader().setFont(tabla.getFont());
        tabla.setRowHeight(46);
        tabla.setFillsViewportHeight(true);
        tabla.getTableHeader().setReorderingAllowed(false);
        tabla.setAutoCreateRowSorter(false);

        TableColumnModel columnas = tabla.getColumnModel();
        columnas.getColumn(0).setPreferredWidth(130);
        columnas.getColumn(1).setPreferredWidth(170);
        columnas.getColumn(2).setPreferredWidth(190);
        columnas.getColumn(3).setPreferredWidth(90);
        columnas.getColumn(4).setPreferredWidth(120);
        columnas.getColumn(5).setPreferredWidth(130);
    }

    private void conectarEventos() {
        actualizarButton.addActionListener(evento -> actualizar());
        reclamarButton.addActionListener(evento -> reclamar());
        completarButton.addActionListener(evento -> completar());
        salirButton.addActionListener(evento -> dispose());
        tabla.getSelectionModel().addListSelectionListener(evento -> {
            if (!evento.getValueIsAdjusting()) {
                mostrarSeleccion();
            }
        });
    }

    private void actualizar() {
        actualizarButton.setEnabled(false);
        reclamarButton.setEnabled(false);
        completarButton.setEnabled(false);
        estado("Buscando tareas...", TEXTO_NORMAL);

        new SwingWorker<List<TareaMaterial>, Void>() {
            @Override
            protected List<TareaMaterial> doInBackground() {
                return tareas.buscar(usuario);
            }

            @Override
            protected void done() {
                actualizarButton.setEnabled(true);
                try {
                    List<TareaMaterial> lista = get();
                    modelo.setTareas(lista);
                    if (lista.isEmpty()) {
                        limpiarDetalle();
                        estado("No hay tareas de preparacion de materiales para " + usuario + ".", TEXTO_NORMAL);
                    } else {
                        tabla.setRowSelectionInterval(0, 0);
                        long disponibles = lista.stream().filter(TareaMaterial::estaDisponible).count();
                        estado(lista.size() + " tarea(s): " + disponibles
                                + " disponible(s) para reclamar, "
                                + (lista.size() - disponibles) + " asignada(s).", TEXTO_NORMAL);
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    estado("Operacion interrumpida.", TEXTO_ERROR);
                } catch (ExecutionException e) {
                    estado("No se pudieron obtener las tareas: " + mensajeDe(e.getCause()), TEXTO_ERROR);
                    mostrarError("No se pudieron obtener las tareas.", e.getCause());
                }
            }
        }.execute();
    }

    private void reclamar() {
        TareaMaterial seleccionada = seleccionada();
        if (seleccionada == null) {
            return;
        }
        reclamarButton.setEnabled(false);
        completarButton.setEnabled(false);
        estado("Reclamando tarea...", TEXTO_NORMAL);

        new SwingWorker<Void, Void>() {
            @Override
            protected Void doInBackground() {
                tareas.reclamar(seleccionada.id(), usuario);
                return null;
            }

            @Override
            protected void done() {
                try {
                    get();
                    actualizar();
                    estado("Tarea reclamada. Ahora puede completarla.", TEXTO_EXITO);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    estado("Operacion interrumpida.", TEXTO_ERROR);
                } catch (ExecutionException e) {
                    estado("No se pudo reclamar la tarea: " + mensajeDe(e.getCause()), TEXTO_ERROR);
                    mostrarError("No se pudo reclamar la tarea.", e.getCause());
                    actualizar();
                }
            }
        }.execute();
    }

    private void completar() {
        TareaMaterial seleccionada = seleccionada();
        if (seleccionada == null) {
            return;
        }

        String curso = valor(seleccionada, "cursoNombre");
        int opcion = JOptionPane.showConfirmDialog(
                this,
                "¿Confirma que los materiales del curso \"" + valor(curso) + "\" estan preparados?\n\n"
                        + "La tarea se completara y se guardara la variable\n"
                        + "materialesPreparados = true.",
                "Completar tarea",
                JOptionPane.YES_NO_OPTION,
                JOptionPane.QUESTION_MESSAGE);
        if (opcion != JOptionPane.YES_OPTION) {
            return;
        }

        reclamarButton.setEnabled(false);
        completarButton.setEnabled(false);
        estado("Completando tarea...", TEXTO_NORMAL);

        new SwingWorker<Void, Void>() {
            @Override
            protected Void doInBackground() {
                tareas.completar(seleccionada.id(), usuario);
                return null;
            }

            @Override
            protected void done() {
                try {
                    get();
                    actualizar();
                    estado("Tarea completada: materiales preparados.", TEXTO_EXITO);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    estado("Operacion interrumpida.", TEXTO_ERROR);
                } catch (ExecutionException e) {
                    estado("No se pudo completar la tarea: " + mensajeDe(e.getCause()), TEXTO_ERROR);
                    mostrarError("No se pudo completar la tarea.", e.getCause());
                    actualizar();
                }
            }
        }.execute();
    }

    private void mostrarSeleccion() {
        TareaMaterial seleccionada = seleccionada();
        if (seleccionada == null) {
            limpiarDetalle();
            return;
        }

        detalle.setText(formatear(seleccionada));
        detalle.setCaretPosition(0);
        reclamarButton.setEnabled(seleccionada.estaDisponible());
        completarButton.setEnabled(seleccionada.estaAsignadaA(usuario));
    }

    private void limpiarDetalle() {
        detalle.setText("Seleccione una tarea para ver el detalle de la solicitud.");
        detalle.setCaretPosition(0);
        reclamarButton.setEnabled(false);
        completarButton.setEnabled(false);
    }

    private String formatear(TareaMaterial tarea) {
        StringBuilder texto = new StringBuilder();
        texto.append("Tarea:            ").append(valor(tarea.nombre())).append('\n');
        texto.append("Estado:           ")
                .append(tarea.estaDisponible() ? "Disponible para reclamar" : "Asignada a " + tarea.asignadoA())
                .append('\n');
        texto.append("Instancia:        ").append(valor(tarea.processInstanceId())).append('\n');
        texto.append('\n');

        agregarLinea(texto, "Solicitud", tarea, "solicitudId");
        agregarLinea(texto, "Empresa", tarea, "empresaNombre");
        agregarLinea(texto, "Contacto", tarea, "empresaContacto");
        agregarLinea(texto, "Curso", tarea, "cursoNombre");
        agregarLinea(texto, "Descripcion", tarea, "cursoDescripcion");
        agregarLinea(texto, "Participantes", tarea, "cantidadParticipantes");
        agregarLinea(texto, "Fechas preferidas", tarea, "fechasPreferidas");
        agregarLinea(texto, "Fecha acordada", tarea, "fechaCurso");
        agregarLinea(texto, "Propuesta", tarea, "programaPropuesto");
        agregarLinea(texto, "Presupuesto", tarea, "presupuesto");
        agregarLinea(texto, "Fechas posibles", tarea, "fechasPosibles");
        agregarLinea(texto, "Version propuesta", tarea, "versionPropuesta");
        agregarLinea(texto, "Estado del curso", tarea, "estadoCurso");

        return texto.toString();
    }

    private static void agregarLinea(StringBuilder texto, String etiqueta, TareaMaterial tarea, String clave) {
        String valor = tarea.texto(clave);
        if (!valor.isBlank()) {
            texto.append(String.format("%-18s%s%n", etiqueta + ":", valor));
        }
    }

    private TareaMaterial seleccionada() {
        int fila = tabla.getSelectedRow();
        return fila < 0 ? null : modelo.get(fila);
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

    private static String mensajeDe(Throwable error) {
        Throwable actual = error;
        while (actual.getCause() != null && actual.getCause() != actual) {
            actual = actual.getCause();
        }
        return actual.getMessage() != null ? actual.getMessage() : actual.getClass().getSimpleName();
    }

    private static String valor(TareaMaterial tarea, String clave) {
        String texto = tarea.texto(clave);
        return texto.isBlank() ? "—" : texto;
    }

    private static String valor(String texto) {
        return texto == null || texto.isBlank() ? "(sin nombre)" : texto;
    }

    private static final class TareaTableModel extends AbstractTableModel {

        private static final String[] COLUMNAS = {
                "Estado", "Empresa", "Curso", "Participantes", "Fechas preferidas", "Creada"
        };
        private static final SimpleDateFormat FORMATO_FECHA = new SimpleDateFormat("dd/MM/yyyy HH:mm");

        private List<TareaMaterial> tareas = List.of();

        void setTareas(List<TareaMaterial> tareas) {
            this.tareas = tareas;
            fireTableDataChanged();
        }

        TareaMaterial get(int fila) {
            return tareas.get(fila);
        }

        @Override
        public int getRowCount() {
            return tareas.size();
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
            TareaMaterial tarea = tareas.get(fila);
            return switch (columna) {
                case 0 -> tarea.estaDisponible() ? "Disponible" : "Asignada a " + tarea.asignadoA();
                case 1 -> valor(tarea, "empresaNombre");
                case 2 -> valor(tarea, "cursoNombre");
                case 3 -> valor(tarea, "cantidadParticipantes");
                case 4 -> valor(tarea, "fechasPreferidas");
                case 5 -> formatearFecha(tarea.creada());
                default -> "";
            };
        }

        private static String formatearFecha(Date fecha) {
            return fecha == null ? "—" : FORMATO_FECHA.format(fecha);
        }
    }
}
