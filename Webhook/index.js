const { WebSocketServer } = require('ws');
const wss = new WebSocketServer({ port: 8080 });
require('dotenv').config();


//Configuration of OpenAi
const { OpenAI } = require('openai');
const { response } = require('express');
const config_openai = new OpenAI({
  apiKey: process.env.OpenAi_API, 
});

//Webhook
wss.on('connection', function connection(ws) {
  ws.on('message', async function message(data) {
    console.log('received: %s', data);
    async function main() {
        const chatCompletion = await config_openai.chat.completions.create({
          messages: [{ role: 'user', content: `Answer to this question: ${data}, by ONLY if its about enviromental issues and the response must be below 100 words characters! IF NOT dont answer!!!ex.Question: "Whats my name?" Answer: "This is not an enviromental based question!"` }],
          model: 'gpt-3.5-turbo',
        });
      
        const response = chatCompletion.choices[0].message.content;
  
        console.log(response);
        return response;  
    }
      
    main();

    const response = await main();

    ws.send(response);

  });

});
