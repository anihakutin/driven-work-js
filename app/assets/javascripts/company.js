class Company {
  constructor(id, name, description, authorId,  authorName, numOfBreakthroughs) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.authorId = authorId;
    this.authorName = authorName;
    this.numOfBreakthroughs = numOfBreakthroughs;
  }

  listItem () {
    return `<li> <a href=/companies/${this.id}>${this.name} - Major Breakthroughs: ${this.numOfBreakthroughs}</a></li>
            <p>by <a href=/users/${this.authorId}>${this.authorName}</a></p>`
  }
}
