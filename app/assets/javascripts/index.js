document.addEventListener('DOMContentLoaded', () => {
  let sortButton = document.getElementById("sortAlpha").addEventListener('click', getSortedValues);
  fetch('/companies.json')
  .then(response => response.json())
  .then(json => updateList(json));

  let updateList = (json) => {
    const list = document.getElementById("companies");

    json.forEach( company => {
      const companyObj = new Company(company.id, company.name, company.description, (company.user == null ? null : company.user.id), ((company.user == null ? null : company.user.name)), company.numOfBreakthroughs);
      list.innerHTML += (companyObj.indexPageListItem());
    });
  }
})

let getSortedValues = () => {
  fetch('/companies.json')
  .then(response => response.json())
  .then(json => {
    json.sort(function(a, b) {
      var nameA = a.name.toUpperCase(); // ignore upper and lowercase
      var nameB = b.name.toUpperCase(); // ignore upper and lowercase
      if (nameA < nameB) {
        return -1;
      }
      if (nameA > nameB) {
        return 1;
      }

      // names must be equal
      return 0;
    });
    let list = document.getElementById("companies");
    list.innerHTML = "";

    json.forEach( company => {
      const companyObj = new Company(company.id, company.name, company.description,
                                    (company.user == null ? null : company.user.id),
                                    ((company.user == null ? null : company.user.name)),
                                      company.numOfBreakthroughs);
      list.innerHTML += (companyObj.indexPageListItem());
    })
  });
}
