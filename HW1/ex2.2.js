const path = require("path");
const fs = require("fs");


const findJS = fileToRead => {
    fs.readdir(fileToRead, (err, files) => {
        for (const file of files) {
            fs.stat(fileToRead + '\\' + file, (err, cur) => {
                if (cur.isDirectory()) {
                    findJS(fileToRead + '\\' + file);
                }
                else if (file.endsWith(".js")) {
                    console.log(fileToRead + '\\' + file);
                }
            })

        }
    })
};

findJS("test");