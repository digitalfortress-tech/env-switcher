import { boot } from 'quasar/wrappers';

const i18n = (name) => chrome.i18n.getMessage(name);

export default boot(({ app }) => {
  app.config.globalProperties.$i18n = i18n;
  // ^ ^ ^ this allows us to use this.$i18n (for Vue Options API form)
  //       so we won't necessarily have to import it in each vue file
});

export { i18n };
