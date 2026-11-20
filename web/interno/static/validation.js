// Validación accesible sincronizada con :user-invalid, soporte de mostrar/ocultar contraseña
// y validación de grupos de checkboxes ("Evaluar Recursos") sin atributos inline.

(() => {
  const linkError = (el, shown) => {
    const errorId = el.dataset?.error;
    if (!errorId) return;
    const ids = (el.getAttribute("aria-describedby") || "")
      .split(/\s+/)
      .filter((id) => id && id !== errorId);
    if (shown) ids.push(errorId);
    if (ids.length) el.setAttribute("aria-describedby", ids.join(" "));
    else el.removeAttribute("aria-describedby");
  };

  // Región viva cortés única para anunciar errores tras interacción
  const announcer = document.createElement("div");
  announcer.setAttribute("aria-live", "polite");
  announcer.classList.add("visually-hidden");
  document.body.append(announcer);
  let announceTimer;
  let announcedField;

  const spokenText = (node) => {
    const copy = node.cloneNode(true);
    copy.querySelectorAll('[aria-hidden="true"]').forEach((n) => n.remove());
    copy
      .querySelectorAll('[role="img"][aria-label]')
      .forEach((n) => n.replaceWith(`${n.getAttribute("aria-label")}: `));
    return copy.textContent.replace(/\s+/g, " ").trim();
  };

  const announceError = (el) => {
    const error = document.getElementById(el.dataset.error);
    if (!error) return;
    const label = el.labels?.[0] ? `${spokenText(el.labels[0])}: ` : "";
    clearTimeout(announceTimer);
    announcer.textContent = "";
    announcedField = el;
    announceTimer = setTimeout(() => {
      announcer.textContent = label + spokenText(error);
    }, 500);
  };

  const flagged = new WeakSet();
  const announced = new WeakSet();

  const syncAria = (el, announce = false) => {
    if (!el.matches?.("input, select, textarea")) return;
    const invalid =
      (CSS.supports("selector(:user-invalid)") && el.matches(":user-invalid")) ||
      el.classList.contains("user-invalid-fallback");

    if (invalid) {
      if (announce && !announced.has(el)) {
        announceError(el);
        announced.add(el);
      }
      el.setAttribute("aria-invalid", "true");
      linkError(el, true);
      flagged.add(el);
    } else if (flagged.has(el) || el.getAttribute("aria-invalid") !== "true") {
      el.setAttribute("aria-invalid", "false");
      linkError(el, false);
      flagged.delete(el);
      announced.delete(el);
      if (announcedField === el) {
        clearTimeout(announceTimer);
        announcer.textContent = "";
      }
    }
  };

  // Fallback para navegadores sin :user-invalid
  const UserInvalidFallback = (() => {
    const dirtyState = new WeakMap();
    const updateState = (input) => {
      const isValid = input.validity.valid;
      input.classList.toggle("user-invalid-fallback", !isValid);
      input.classList.toggle("user-valid-fallback", isValid);
      input.setAttribute("aria-invalid", isValid ? "false" : "true");
      linkError(input, !isValid);
    };

    const handleEvent = (event) => {
      const input = event.target;
      if (!input.checkValidity) return;
      if (event.type === "invalid") {
        dirtyState.set(input, { hasInteracted: true, hasBlurred: true });
        updateState(input);
        return;
      }
      if (event.type === "input" || event.type === "change") {
        const state = dirtyState.get(input) || { hasInteracted: false, hasBlurred: false };
        state.hasInteracted = true;
        dirtyState.set(input, state);
        if (state.hasBlurred) updateState(input);
      } else if (event.type === "blur") {
        const state = dirtyState.get(input) || { hasInteracted: false, hasBlurred: false };
        state.hasBlurred = true;
        dirtyState.set(input, state);
        if (state.hasInteracted) updateState(input);
      }
    };

    const init = (root = document) => {
      if (CSS.supports("selector(:user-invalid)")) return;
      root.addEventListener("blur", handleEvent, true);
      root.addEventListener("input", handleEvent);
      root.addEventListener("change", handleEvent);
      root.addEventListener("invalid", handleEvent, true);
    };

    return { init };
  })();

  // Inicializar estado aria-invalid="false"
  document.querySelectorAll("input, select, textarea").forEach((el) => syncAria(el));
  UserInvalidFallback.init(document);

  document.addEventListener("blur", (e) => syncAria(e.target, true), true);
  document.addEventListener("input", (e) => {
    if (e.target.hasAttribute?.("aria-invalid")) syncAria(e.target);
  });
  document.addEventListener("change", (e) => syncAria(e.target, true), true);
  document.addEventListener(
    "invalid",
    (e) => {
      announced.add(e.target);
      syncAria(e.target);
    },
    true
  );

  // Botón mostrar/ocultar contraseña accesible
  const toggleBtn = document.getElementById("toggle-password");
  const pwdInput = document.getElementById("password");
  if (toggleBtn && pwdInput) {
    toggleBtn.addEventListener("click", () => {
      const showing = pwdInput.type === "text";
      pwdInput.type = showing ? "password" : "text";
      toggleBtn.setAttribute("aria-pressed", showing ? "false" : "true");
      toggleBtn.textContent = showing ? "Mostrar contraseña" : "Ocultar contraseña";
    });
  }

  // Validación de "Al menos un recurso seleccionado" en Evaluar Recursos (Activity_12i2hpf)
  const recursosForm = document.getElementById("form-evaluar-recursos");
  if (recursosForm) {
    const checkboxes = Array.from(
      recursosForm.querySelectorAll('input[type="checkbox"][data-resource-check]')
    );
    const errorBox = document.getElementById("recursos-group-error");

    const validateGroup = () => {
      const anyChecked = checkboxes.some((cb) => cb.checked);
      if (checkboxes[0]) {
        checkboxes[0].setCustomValidity(
          anyChecked
            ? ""
            : "Selecciona al menos un recurso (Aula física, Aula virtual o Equipamiento especial)."
        );
      }
      if (errorBox) {
        errorBox.style.display = anyChecked ? "none" : "block";
      }
      return anyChecked;
    };

    checkboxes.forEach((cb) => {
      cb.addEventListener("change", validateGroup);
    });

    recursosForm.addEventListener("submit", (e) => {
      if (!validateGroup()) {
        e.preventDefault();
        checkboxes[0]?.focus();
      }
    });
  }

  // Deshabilitar botón de submit luego de un envío válido para evitar doble POST
  document.querySelectorAll("form").forEach((form) => {
    form.addEventListener("submit", (e) => {
      if (!form.checkValidity()) {
        e.preventDefault();
        const firstInvalid = form.querySelector(":invalid");
        firstInvalid?.focus();
        return;
      }
      const submitBtn = form.querySelector('button[type="submit"]');
      if (submitBtn && !e.defaultPrevented) {
        setTimeout(() => {
          submitBtn.disabled = true;
        }, 0);
      }
    });
  });
})();
