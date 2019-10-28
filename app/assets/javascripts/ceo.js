class Ceo {
  constructor (:id, :name) {
    this.id = id;
    this.name = name;
  }

  showPageListItem () {
    return `<li> <a href=/ceos/${this.id}>${this.name}</a></li>`
  }
}
