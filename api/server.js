import fetch from 'node-fetch'

export default async function handler(req, res) {
  const user_agent = (req.headers['user-agent'] || '').toLowerCase()
  const loadstring_header = req.headers['x-loadstring']

  if (!user_agent.includes('roblox') && !loadstring_header) {
    res.writeHead(302, { Location: '/' })
    res.end()
    return
  }

  const script_name = req.query.name
  if (!script_name || !/^[a-z0-9]{10,}$/.test(script_name)) {
    res.status(400).end('invalid script name')
    return
  }

  const raw_url = `https://raw.githubusercontent.com/${process.env.blabla2}/${process.env.blabla3}/main/scripts/${script_name}.lua`

  try {
    const response = await fetch(raw_url)
    if (!response.ok) {
      res.status(404).end('script not found')
      return
    }

    const script = await response.text()

    const ip = req.headers['x-forwarded-for'] || req.socket.remoteAddress || 'unknown'

    console.log(`script ${script_name} fetched ip: ${ip}`)

    res.setHeader('content-type', 'text/plain')
    res.end(script)
  } catch {
    res.status(500).end('internal error')
  }
}
