
const fs = require('fs')
const crypto = require('crypto')

const filePath = 'painters_santo_andre.json'

try {
  const content = fs.readFileSync(filePath, 'utf8')
  const data = JSON.parse(content)

  let fixedCount = 0
  const fixedData = data.map(item => {
    // Generate a new valid UUID
    item.id = crypto.randomUUID()
    fixedCount++
    return item
  })

  fs.writeFileSync(filePath, JSON.stringify(fixedData, null, 2))
  console.log(`Fixed ${fixedCount} UUIDs in ${filePath}`)

} catch (err) {
  console.error('Error fixing JSON:', err)
}
