module.exports = {
  // !!! 监控组件库 selphi_daisy 的 class
  content: [
    '../lib/selphi_cms_web/live/**/*.{heex,ex,sface}',
    '../lib/selphi_cms_web/components/**/*.{heex,ex,sface}',
    '../lib/selphi_cms_web/controls/**/*.{heex,ex,sface}',
    '../lib/selphi_cms_web/templates/**/*.{heex,ex,sface}',
    //  监控 selphi_daisy 的 class 进行pruge
    '../deps/selphi_daisy/lib/selphi_daisy/**/*.{heex,ex,sface}',
    '../deps/selphi_daisy/priv/catalogue/**/*.{heex,ex,sface}',
    '../priv/catalogue/**/*.{heex,ex,sface}',
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/typography"),
    require('daisyui'),
  ],
}
