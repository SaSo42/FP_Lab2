document.getElementById("footer").innerText = 'My footer Text';

const node = document.getElementById('main');
const app = Elm.App.init({
    node: node,
    flags: 5
});
const randomArray = ["Hello World", "Foo", "Bar", "Spring", "Paragraph", "I still hate elm", "Random text", "lorem ipsum dolor sit amet"];
const ELM_ARRAY_NAME = "ELM_ARRAY_NAME";

app.ports.cache.subscribe( (data) => {
    const randomTextString = getRandomText();
    //localStorage.setItem('cache', JSON.stringify(data));

    app.ports.randomExampleTextToElm.send(randomTextString);
});

app.ports.persistNotes.subscribe( (data) => {
    localStorage.setItem(ELM_ARRAY_NAME, JSON.stringify(data));

    //console.log("data: ");
    //console.log(data);
    //app.ports.randomExampleTextToElm.send(randomTextString);
});

app.ports.getNotes.subscribe( (data) => {
    const elmArray = JSON.parse(localStorage.getItem(ELM_ARRAY_NAME));

    //console.log("elmArray: ");
    //console.log(elmArray);
    //console.log(JSON.stringify(elmArray));

    app.ports.receiveNotes.send(elmArray);
});

function getRandomText(){
    const length = randomArray.length;
    const randomNumber = getRandomInteger(0, length);

    return randomArray[randomNumber];
}

/*
* Int getRandomInteger (Int min, Int max)
* get random Integer between min and max
* */
function getRandomInteger(min, max) {
    return Math.floor(Math.random() * (max - min) ) + min;
}
