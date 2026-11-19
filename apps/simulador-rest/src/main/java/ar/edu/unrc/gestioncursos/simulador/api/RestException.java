package ar.edu.unrc.gestioncursos.simulador.api;

/**
 * Error devuelto por la API REST de Flowable o por la comunicacion HTTP.
 */
public final class RestException extends RuntimeException {

    private final int statusCode;

    public RestException(int statusCode, String mensaje) {
        super(mensaje);
        this.statusCode = statusCode;
    }

    public RestException(String mensaje, Throwable causa) {
        super(mensaje, causa);
        this.statusCode = -1;
    }

    public int statusCode() {
        return statusCode;
    }
}
