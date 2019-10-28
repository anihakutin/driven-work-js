class Company {
  constructor(id, name, description, authorId,  authorName, numOfBreakthroughs) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.authorId = authorId;
    this.authorName = authorName;
    this.numOfBreakthroughs = numOfBreakthroughs;
  }

  indexPageListItem () {
    let html = "";

     html += `<li> <a href=/companies/${this.id}>${this.name} - Major Breakthroughs: ${this.numOfBreakthroughs}</a></li>`
     if (this.authorId !== null) {
      html += `<p>by <a href=/users/${this.authorId}>${this.authorName}</a></p>`
     } else {
       html += "<p>by N/A</p>"
     }
    return html;
  }

  showPageListItem () {
    return `<li> <a href=/companies/${this.id}>${this.name}</a></li>`
  }
}
