// Safari WebExtensions expose the standard `browser` namespace. The shared
// Glasswing scripts use the Promise-based subset of the Chrome namespace.
// Bridge that name without changing the API objects or widening permissions.
(() => {
  if (typeof globalThis.browser !== 'undefined') {
    globalThis.chrome = globalThis.browser;
  }
})();
