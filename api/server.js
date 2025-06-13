const express = require('express')
const fetch = require('node-fetch')
const { Octokit } = require('octokit')
require('dotenv').config()

const app = express()
app.use(express.json())

const octokit = new Octokit({ auth: process.env.blabla })

app.post('/upload', async (req, res) => {
  const { name, script } = req.body
  if (!name || !script) {
    return res.status(400).json({ error: 'missing name or script' })
  }

  const path = `scripts/${name}.lua`
  let sha

  try {
    const { data } = await octokit.rest.repos.getContent({
      owner: process.env.blabla2,
      repo: process.env.blabla3,
      path
    })
    sha = data.sha
  } catch {}

  try {
    await octokit.rest.repos.createOrUpdateFileContents({
      owner: process.env.blabla2,
      repo: process.env.blabla3,
      path,
      message: `upload script ${name}`,
      content: Buffer.from(script).toString('base64'),
      sha
    })

    const url = `https://raw.githubusercontent.com/${process.env.blabla2}/${process.env.blabla3}/main/${path}`
    return res.json({ success: true, url })
  } catch (e) {
    return res.status(500).json({ error: e.message })
  }
})

app.get('/script/:name', async (req, res) => {
  const name = req.params.name
  const url = `https://raw.githubusercontent.com/${process.env.blabla2}/${process.env.blabla3}/main/scripts/${name}.lua`

  try {
    const response = await fetch(url)
    if (!response.ok) return res.status(404).end()
    const text = await response.text()
    res.set('content-type', 'text/plain')
    return res.send(text)
  } catch {
    return res.status(500).end()
  }
})

const port = process.env.PORT || 3000
app.listen(port)
