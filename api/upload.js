import { Octokit } from 'octokit'

const octokit = new Octokit({ auth: process.env.blabla })

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    res.status(405).json({ error: 'method not allowed' })
    return
  }

  const { name, script } = req.body
  if (!name || !script) {
    res.status(400).json({ error: 'missing name or script' })
    return
  }

  try {
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

    await octokit.rest.repos.createOrUpdateFileContents({
      owner: process.env.blabla2,
      repo: process.env.blabla3,
      path,
      message: `upload script ${name}`,
      content: Buffer.from(script).toString('base64'),
      sha
    })

    const raw_url = `https://raw.githubusercontent.com/${process.env.blabla2}/${process.env.blabla3}/main/${path}`

    res.status(200).json({ success: true, url: raw_url })
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
}
