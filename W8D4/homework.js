function titleize(arr, cb) {
    const newarr = arr.map(el => el = `Mx ${el} Jingleheimer Schmidt`)
    return newarr.forEach(el => cb(el))
}

function printCallback(el){
    console.log(el)
}

// titleize(['Mary', 'Brian', 'Leo'], printCallback)

function Elephant (name, height) {
    this.name = name;
    this.height = height; 
    this.tricks = [];
}

Elephant.prototype.trumpet = function(){
    console.log(`${this.name} phrRRRRRRRRRRR!!!!!!!`)
}

Elephant.prototype.grow = function(){
    this.height += 12; 
}

Elephant.prototype.addTrick = function (trick) {
    this.tricks.push(trick)
}

Elephant.prototype.play = function () {
    const ranTrick = this.tricks[Math.floor(Math.random()*this.tricks.length)]
    console.log(`${this.name} plays ${ranTrick}`)
}
e = new Elephant('Yong', 123)
e.grow()
e.addTrick("jump")
console.log(e)
e.play()