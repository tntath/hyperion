require('dotenv').config();
const {REST, Routes, ApplicationCommandOptionType} = require('discord.js');
const { type } = require('os');

const commands = [
    {
      name: 'christmas',
      description : 'Replies saying the days until Christmas',
    },
    {
        name: 'ask-ai',
        description: 'Replies with the answer of an AI.',
        options: [
            {
                name: 'question',
                description: 'This is the question that the AI will respond to.',
                type: ApplicationCommandOptionType.String,
                required: true,
            },
        ],
    },
    {
        name: 'countdown',
        description: 'Replies with the days until the Date.',
        options: [
            {
                name: 'date_ask',
                description: 'Please the date like this format! | ex. 10 June 2023 |',
                type: ApplicationCommandOptionType.String,
                required: true,
            },
        ],
    },
    {
        name: 'help',
        description: "Shows Chistmas Bot's help menu.",
    }
];

const rest = new REST({ version: '10' }).setToken(process.env.DISC_TOKEN);

(async () => {
    try {
        console.log('Registering slash commands...')
        await rest.put(
            Routes.applicationGuildCommands(process.env.APP_ID, process.env.GUILD_ID),
            {body: commands }
        )
        console.log('Slash commands were registered successfuly!')
    } catch (error) {
        console.log(`There was an error: ${error}`);

    }
})();