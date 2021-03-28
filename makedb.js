
const fs = require('fs');
const path = require('path');
const root = 'build/profiles/';

const files = fs.readdirSync(root);
const acc = [];
files.forEach((curr) => {
    console.log(curr);
    if (curr.includes('.json')) {
        const file = JSON.parse(fs.readFileSync(path.join(root, curr), 'utf8'));
        acc.push(file);
    }

}, {});
console.log(acc);

module.exports = {
    profiles: acc
}