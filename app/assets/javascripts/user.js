class User {
  constructor(id, name, email, level, editLink, deleteLink) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.level = level;
    this.editLink = editLink;
    this.deleteLink = deleteLink;
  }

  userProfile () {
    return `<h2>Hello, <strong>${this.name}!</strong></h2>
            <h4>User Level: <strong>${this.level}</strong></h4>
            ${this.editLink !== null ? "<p><a href=" + this.editLink + ">Edit Profile</a></p>" : ""}
            <p><a href=/users/${this.id > 1 ? this.id - 1 : this.id} id="btnPrev">Previous User</a>  |  <a href=/users/${this.id + 1} id="btnNext">Next User</a></p>`
  }
}
