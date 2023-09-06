const express = require('express');
const app = express();
const Sequelize = require('sequelize');
const sequelize = new Sequelize('efk', 'root', '', {
  host: 'localhost',
  dialect: 'mysql',
});

const cors = require('cors');
const bcrypt = require('bcrypt'); // Pour hacher le mot de passe

// Modèle User
const User = sequelize.define('User', {
  username: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  email: {
    type: Sequelize.STRING,
    allowNull: false,
    unique: true, // L'e-mail doit être unique
  },
  password_hash: {
    type: Sequelize.STRING,
    allowNull: false,
  },
});

app.use(cors());
app.use(express.json()); // Middleware pour analyser les données JSON de la demande

// Définir le modèle pour la table Courses
const Course = sequelize.define('Course', {
  course_name: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  description: {
    type: Sequelize.TEXT,
    allowNull: false,
  },
});

// Synchroniser le modèle avec la base de données
sequelize.sync().then(() => {
  console.log('La base de données est prête.');
});

app.get('/', (req, res) => {
  res.send('Bienvenue sur le serveur Node.js !');
});

// Endpoint GET pour récupérer les informations de la table Courses
app.get('/courses', async (req, res) => {
  try {
    const courses = await Course.findAll({
      attributes: ['course_name', 'description'],
    });
    res.json(courses);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erreur serveur' });
  }
});

// Route POST pour l'inscription des utilisateurs
app.post('/register', async (req, res) => {
  try {
    const { username, email, password } = req.body;

    // Vérifiez si l'utilisateur existe déjà
    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) {
      console.log(email + " is already used.")
      return res.status(400).json({ message: 'Cet e-mail est déjà utilisé.' });
    }

    // Hachez le mot de passe
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);

    // Créez un nouvel utilisateur
    const newUser = await User.create({
      username,
      email,
      password_hash: hashedPassword,
    });

    res.status(201).json({ message: 'Inscription réussie' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erreur serveur' });
  }
});

// Lancer le serveur sur le port 3000
app.listen(3000, () => {
  console.log('Le serveur est en écoute sur le port 3000');
});
