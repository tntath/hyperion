require('dotenv').config();
const {
   Client,
   Intents,
   IntentsBitField,
   SlashCommandBuilder,
   REST,
   Routes,
   EmbedBuilder,
   ActivityType,
   GatewayIntentBits
   } = require('discord.js');
const ALL_INTENTS = 
    (1 << 0) +  // GUILDS
    (1 << 1) +  // GUILD_MEMBERS
    (1 << 2) +  // GUILD_BANS
    (1 << 3) +  // GUILD_EMOJIS_AND_STICKERS
    (1 << 4) +  // GUILD_INTEGRATIONS
    (1 << 5) +  // GUILD_WEBHOOKS
    (1 << 6) +  // GUILD_INVITES
    (1 << 7) +  // GUILD_VOICE_STATES
    (1 << 8) +  // GUILD_PRESENCES
    (1 << 9) +  // GUILD_MESSAGES
    (1 << 10) + // GUILD_MESSAGE_REACTIONS
    (1 << 11) + // GUILD_MESSAGE_TYPING
    (1 << 12) + // DIRECT_MESSAGES
    (1 << 13) + // DIRECT_MESSAGE_REACTIONS
    (1 << 14);  // DIRECT_MESSAGE_TYPING

const client = new Client({ intents: ALL_INTENTS });

///
const date = require('date-and-time');
const fs = require('fs');
const express = require("express");
const wait = require('node:timers/promises').setTimeout;


// //Configuration of OpenAi
const { OpenAI } = require('openai');
const config_openai = new OpenAI({
  apiKey: process.env.OpenAi_API, 
});

// - On Start 
client.once('ready', () =>{

    // - Status and Conlole log Message
    client.user.setPresence({
      activities: [{ name: `Nasa Space Apps Challenge`, type: ActivityType.Playing }],
      status: 'idle',
    });
    setTimeout(function(){
        console.log("🧑‍🚀I'm ready |Space Maverics🧑‍🚀");
    }, 2000);

    // - Channel Message => Ready 
    client.channels.cache.get('1160128877201473576').send(`**HYPERION Bot** is awake✅`) 
});


// --------------Christmas Countdown--------------

// - Calculates the Days until Christmas (25/12/2022)
const newYears = "25 Dec 2023";
//Convert string to dates
const newYearsDate = new Date(newYears);
const currentDate = new Date();

//Math to get Days
const totalSeconds = (newYearsDate - currentDate) / 1000;
const days = Math.floor(totalSeconds / 3600 / 24);


// - Days Until. Christmas Embed
const Days_Embed = new EmbedBuilder() 
Days_Embed.setColor(0x7c1111);
Days_Embed.setTitle(`🎄Days Until Christmas🎄`)
Days_Embed.addFields(
  { 
    name: `There are **${days}** days until Christmas`,
    value: '\u200B',
    inline: true
  },
)
Days_Embed.setURL('https://christmas-countdown-nick-s.netlify.app/')
Days_Embed.setThumbnail('https://cdn4.iconfinder.com/data/icons/christmas-random/64/17-santa_hat-256.png')
Days_Embed.setFooter ({
  text: `Christmas Countdown Bot`,
  iconURL: `https://cdn4.iconfinder.com/data/icons/christmas-random/64/27-cat-256.png`,
})

//Slash Christmas Reply
client.on('interactionCreate', (interaction) => {
    if (!interaction.isChatInputCommand()) return;
    
    if (interaction.commandName === 'christmas') {
        interaction.reply({ embeds: [Days_Embed] });
    }
})

//--------------End of Christmas Countdown--------------


//----------------------------Ask AI----------------------------
// const openai = new OpenAIApi(config);

//Slash ask-ai
client.on('interactionCreate', async (interaction) => {
  if (!interaction.isChatInputCommand()) return;

  if (interaction.commandName === 'ask-ai') {
    const prompt = interaction.options.getString('question');
    //Waiting for OpenAI to reply
    await interaction.deferReply();
    //OpenAI respond
    async function main() {
      const chatCompletion = await config_openai.chat.completions.create({
        messages: [{ role: 'user', content: `Answer to this question: ${prompt}, by ONLY if its about enviromental issues and the response must be below 100 words characters! IF NOT dont answer!!!ex.Question: "Whats my name?" Answer: "This is not an enviromental based question!"` }],
        model: 'gpt-3.5-turbo',
      });
    
      const response = chatCompletion.choices[0].message.content;

      console.log(response);
      return response;  
    }
    
    main();

    const response = await main();
    //Waits for the Ai to respond
    await wait(9000);

    //Embed Build
    const ask_ai_embed = new EmbedBuilder();
    ask_ai_embed.setColor('#B7E1D7');
    ask_ai_embed.setTitle('AI Bot Response');
    ask_ai_embed.setURL('https://www.google.com');
    ask_ai_embed.setThumbnail('https://cdn-icons-png.flaticon.com/512/4616/4616271.png');
    ask_ai_embed.addFields(
      {name: `Question:`,value: `${prompt}`},
      {name: `Answer:`, value: `${response}`},
    );
    ask_ai_embed.setFooter ({
      text: `HYPERION Bot | Ask AI `,
      iconURL: `https://t3.ftcdn.net/jpg/03/22/38/32/360_F_322383277_xcXz1I9vOFtdk7plhsRQyjODj08iNSwB.jpg`,
    });


    //Replies to the message
		await interaction.editReply({ embeds: [ask_ai_embed] });

  }
})

//----------------------------End of Ask AI----------------------------

//----------------------------Countdown----------------------------
client.on('interactionCreate', async (interaction) => {
  if (!interaction.isChatInputCommand()) return;


  if (interaction.commandName === 'countdown') {

    //Get date from slash command
    const command_date = interaction.options.getString('date_ask');
    //Waits to do all the Maths so the bot can reply after them
    await interaction.deferReply();

    //Convert to string to date  
    const date_input = new Date(command_date);
    const currentDate_rn = new Date();

    //Math for days
    const sec_total = (date_input - currentDate_rn) / 1000;
    const days_from_date = Math.floor(sec_total / 3600 / 24);
    //Build embed
    const Date_countdown_embed = new EmbedBuilder();
    Date_countdown_embed.setColor('#EEFFC1');
    Date_countdown_embed.setTitle(`⏱️Days Until --${command_date}--⏱️`)
    Date_countdown_embed.addFields(
      { 
        name: `There are **${days_from_date}** days until ${command_date}`,
        value: '\u200B',
        inline: true
     },
    )
    Date_countdown_embed.setThumbnail('https://icon-library.com/images/clock-png-icon/clock-png-icon-0.jpg')
    Date_countdown_embed.setFooter ({
      text: `Countdown Bot`,
      iconURL: `https://cdn-icons-png.flaticon.com/512/4712/4712100.png`,
    })

    //The bot waits and then responds to slash command
    await wait(300);
	  await interaction.editReply({ embeds: [Date_countdown_embed] });
}
})
//----------------------------End of Countdown----------------------------


//----------------------------Help Command----------------------------

const help_embed = new EmbedBuilder();
help_embed.setColor('#CDE7F4')
help_embed.setTitle('Help List')
help_embed.setDescription('**Commands:**')
help_embed.addFields(
  {name:'**•/help**', value: 'Sends this help embed.'},
  {name: '**•/ask-ai**', value: "The AI Bot answers the question that you've entered"},
  {name: '**•/christmas**', value: 'The Christmas Bot replies with an embed saying how many days are left until Christmas.'},
  {name: '**•/countdown**', value:"The Bot replies with an embed saying how many days until the date you've entered."}
);
help_embed.setAuthor({name: 'The Meme Vault Bot', iconURL: 'https://cdn.discordapp.com/icons/1097871171057369240/2f47bedf8e86a179c8abca080176f2da.png?size=1024'});

client.on('interactionCreate', async (interaction) => {
  if (!interaction.isChatInputCommand()) return;

  if (interaction.commandName === 'help') {
    await interaction.deferReply();
    await wait(300);
    await interaction.editReply({embeds: [help_embed]});
    
  }
})
//----------------------------End of Help Command----------------------------

//Errors Message
client.on('error', (err) => {
  console.log(err.message)
});

//Login
client.login(process.env.DISC_TOKEN)