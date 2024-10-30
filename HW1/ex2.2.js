const path = require("path");
const fs = require("fs");
const util = require("util");


// const findJS = fileToRead => {
//     fs.readdir(fileToRead, (err, files) => {
//         files.forEach((file) => { // use forEach instead of for of loop
//             fs.stat(fileToRead + "\\" + file, (err, cur) => {
//                 if (cur.isDirectory()) {
//                     findJS(fileToRead + "\\" + file);
//                 } else if (file.endsWith(".js")) {
//                     console.log(fileToRead + "\\" + file);
//                 }
//             });
//         });
//     })
// };
// findJS("./test");

const getDirList = util.promisify(fs.readdir);
const getFileStat = util.promisify(fs.stat);
const PATH = './test';

const searchDirectory = async directory => {
    const files = await getDirList(directory);
    files.forEach(async file => {
        const filePath = path.join(directory, file);
        const stat = await getFileStat(filePath);
        
        if (stat.isDirectory()) await searchDirectory(filePath);
        else if (path.extname(filePath) === '.js') console.log(filePath);
    });
};

searchDirectory(PATH);