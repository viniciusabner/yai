const fs = require('fs');
const path = require('path');

const readDir = 'c:/Users/Vida/Documents/yai/src/database/seeds';
// The output file is where we will append the clean data
const outputFile = path.join(readDir, '103_consolidated_clean_data.sql');

// Range of files to process (Painter to Metalworker)
const startFile = 47;
const endFile = 88;

function processFile(filePath) {
    const content = fs.readFileSync(filePath, 'utf8');
    const lines = content.split('\n');
    let realLines = [];
    let foundSimulated = false;

    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        // Check for the marker where simulated data begins
        if (line.includes('Complementares para atingir a meta') || line.includes('DADOS SIMULADOS')) {
            foundSimulated = true;
            break;
        }
        realLines.push(line);
    }

    // Remove empty lines from the end of the real data block
    while (realLines.length > 0 && realLines[realLines.length - 1].trim() === '') {
        realLines.pop();
    }

    if (realLines.length > 0) {
        let lastLine = realLines[realLines.length - 1];
        // The last line likely ends with a comma if it was part of a list
        const lastCommaIndex = lastLine.lastIndexOf(',');
        if (lastCommaIndex !== -1) {
             // Remove the comma so we can close the statement
             lastLine = lastLine.substring(0, lastCommaIndex) + lastLine.substring(lastCommaIndex + 1);
             realLines[realLines.length - 1] = lastLine;
        }
    }
    
    // Append the closing semicolon and conflict resolution
    // Use proper spacing/newlines
    return realLines.join('\n') + '\nON CONFLICT (slug) DO NOTHING;';
}

// Check if output file exists
if (!fs.existsSync(outputFile)) {
    console.error(`Output file ${outputFile} does not exist.`);
    process.exit(1);
}

let consolidatedContent = fs.readFileSync(outputFile, 'utf8');
let appendContent = '';

// Get all files in the directory
const files = fs.readdirSync(readDir).filter(f => {
    const match = f.match(/^(\d+)_/);
    if (match) {
        const num = parseInt(match[1]);
        return num >= startFile && num <= endFile;
    }
    return false;
});

// Sort files numerically to preserve order
files.sort((a, b) => {
    const numA = parseInt(a.split('_')[0]);
    const numB = parseInt(b.split('_')[0]);
    return numA - numB;
});

files.forEach(file => {
    // Check if this file's content (by prefix) is already in the output
    // This is a simple check to avoid duplication if run multiple times
    const filePrefix = file.split('_')[0];
    if (consolidatedContent.includes(`-- ${filePrefix}.`)) {
        console.log(`Skipping ${file} as it seems to be already in the consolidated file (found "-- ${filePrefix}.").`);
        return;
    }
    
    console.log(`Processing ${file}...`);
    const processed = processFile(path.join(readDir, file));
    appendContent += '\n' + processed + '\n';
});

if (appendContent) {
    fs.appendFileSync(outputFile, appendContent);
    console.log('Successfully appended clean data to ' + outputFile);
} else {
    console.log('No new data to append.');
}
