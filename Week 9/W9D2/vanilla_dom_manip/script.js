document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  const placeForm = document.getElementById('place-form');

  placeForm.addEventListener('submit', event => {
    // *cancel default behavior for this event*
    // if we don't include this line, the browser will do what it normally does
    // when you submit a form: make an HTTP request, causing a full page refresh
    event.preventDefault();

    // Get the name input element, get the value, and clear it.
    const placeNameInput = document.getElementById('favorite-input');
    const placeName = placeNameInput.value;
    placeNameInput.value = '';

    // Add a new li with the sheep's name to the sheep ul.
    const ul = document.getElementById('sf-places');
    const li = document.createElement('li');
    li.textContent = placeName;
    ul.appendChild(li);
  });



  // adding new photos

  // --- your code here!



});
