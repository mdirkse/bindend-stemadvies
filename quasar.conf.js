module.exports = function() {
  return {
    supportTS: false,

    boot: ["axios"],
    css: ["app.scss"],
    extras: ["roboto-font", "material-icons"],

    build: {
      vueRouterMode: "history",
      extendWebpack(cfg) {
        cfg.module.rules.push({
          enforce: "pre",
          test: /\.(js|vue)$/,
          loader: "eslint-loader",
          exclude: /node_modules/
        });
      }
    },

    devServer: {
      https: false,
      port: 8080,
      open: false
    },

    framework: {
      iconSet: "material-icons", // Quasar icon set
      lang: "en-us", // Quasar language pack
      config: {},
      importStrategy: "auto",
      plugins: []
    },

    animations: []
  };
};
