class Company {
  constructor(id, name, description, authorId) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.authorId = authorId;
  }

  listItem () {
    return `<li> <a href=/companies/${this.id}>${this.name}</a></li>`
  }
}
