// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

new TomSelect("#ingredient_categories", {
  persist: false,
  onItemAdd: function () {
    this.setTextboxValue("");
  },
  plugins: {
    remove_button: {
      title: "Remove this ingredient",
    },
  },
});
