import fs from 'fs';
const root = import.meta.dirname;

const files = [
    // Required Files
    `${root}/System/Constants.xs`,
    `${root}/System/IntArray.xs`,
    `${root}/System/FloatArray.xs`,
    `${root}/System/DefineUnitTechConstants.xs`,
    `${root}/System/Utils.xs`,

    // For Units, Buildings and Another Objects
    `${root}/Standard/TechnologyOperations.xs`,
    `${root}/Standard/ObjectAttributeModifiers.xs`,
    `${root}/Standard/ObjectGraphicsModifiers.xs`,
    `${root}/Standard/Mutable.xs`,

    // Interactive APIs
    `${root}/Api/Timer.xs`,
    `${root}/Api/Technology.xs`,
    // Start
    `${root}/System/Rule.xs`,
    `${root}/index.xs`
];

let source = '';
let min = '';
for(const val of files) {
    let file = fs.readFileSync(val, 'utf8');
    source += file+"\r\n\r\n";
    let lines = file.split("\r\n");

    for(const line of lines) {
        if(line.startsWith("//")) {
            continue;
        } else {
            min += line.replace(/\/\*[\s\S]*?\*\/|(?<=[^:])\/\/.*|^\/\/.*/g,"").replaceAll(/\r\n/g, "").replaceAll(/\t+/g, "").replace(/ +(?= )/g,'') + " ";
        }
    }
}


fs.writeFileSync(`${root}/RsLib.xs`, source);
fs.writeFileSync(`${root}/RsLib.min.xs`, min);
