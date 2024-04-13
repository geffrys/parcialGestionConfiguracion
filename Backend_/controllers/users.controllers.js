import { pool } from "../db.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { CreateAccesToken } from "../libs/jwt.js";

import dotenv from "dotenv";
dotenv.config();

const TOKEN_SECRET = process.env.TOKEN_SECRET;
const SALT_ROUNDS = parseInt(process.env.SALT_ROUNDS);

const MENSAJES = {
  NO_AUTORIZADO: "No autorizado",
  NO_TOKEN: "No se proporciono token",
  NO_ENCONTRADO: "Usuario no encontrado",
  CONTRASENA_INVALIDA: "Contraseña invalida",
  ERROR: "Error",
  USUARIO_ACTUALIZADO: "Usuario actualizado correctamente",
  USUARIO_NO_ENCONTRADO: "Usuario no encontrado",
  PASSWORD_ACTUALIZADO: "Contraseña actualizada correctamente",
  USUARIO_CREADO: "Usuario creado correctamente",
  USUARIO_EXISTENTE: "Usuario ya existente",
  USUARIO_ENCONTRADO: "Usuario encontrado",
  USUARIO_NO_CREADO: "Usuario no creado",
  USUARIO_NO_ACTUALIZADO: "Usuario no actualizado",
  USUARIO_NO_ELIMINADO: "Usuario no eliminado",
  USUARIO_ELIMINADO: "Usuario eliminado",
  USUARIO_NO_REGISTRADO: "Usuario no registrado",
  USUARIO_REGISTRADO: "Usuario registrado",
  USUARIO_NO_EDITADO: "Usuario no editado",
  USUARIO_EDITADO: "Usuario editado",
  USUARIO_NO_LOGUEADO: "Usuario no logueado",
  USUARIO_LOGUEADO: "Usuario logueado",
  USUARIO_NO_CERRAR_SESION: "Usuario no cerro sesion",
  USUARIO_CERRAR_SESION: "Usuario cerro sesion",
  REGISTRO_EXITOSO: "Registro exitoso",
}

export const newUser = async (req, res) => {
  try {
    const {
      user_name,
      user_middle_name,
      user_last_name,
      user_second_last_name,
      user_mail,
      user_phone,
      user_password,
      user_username,
      user_birth_date,
      user_nit
    } = req.body;

    const birth = new Date(user_birth_date);

    const finalPass = await bcrypt.hash(user_password, SALT_ROUNDS);

    const [result] = await pool.query(
      "insert into users (user_name, user_middle_name, user_last_name, user_second_last_name, user_mail, user_phone, user_password, user_username, user_birth_date, user_nit) values (?,?,?,?,?,?,?,?,?,?)",
      [
        user_name,
        user_middle_name,
        user_last_name,
        user_second_last_name,
        user_mail,
        user_phone,
        finalPass,
        user_username,
        birth,
        user_nit
      ]
    );
    let ids = result.insertId;
    const [user] = await pool.query("select * from users where user_id = ?", [
      ids,
    ]);
    user[0].password = "";
    res.status(200).json({ message: MENSAJES.USUARIO_CREADO, user: user[0] });
  } catch (error) {
    return res.status(404).json({ message: error.message });
  }
};

export const LogIn = async (req, res) => {
  try {
    const { user_username, user_password } = req.body;
    const [result] = await pool.query(
      "select * from users where user_username = ?",
      [user_username]
    );

    if (result.length === 0) {
      return res.status(404).json({ message: MENSAJES.USUARIO_NO_ENCONTRADO });
    }
    const isMatch = await bcrypt.compare(
      user_password,
      result[0].user_password
    );

    if (!isMatch)
      return res.status(400).json({ message: MENSAJES.CONTRASENA_INVALIDA });

    const token = await CreateAccesToken({ id: result[0].user_id });
    res.cookie("token", token);
    res.json(result[0]);
  } catch (error) {
    res.status(500).json({ message: MENSAJES.ERROR });
  }
};

export const logOut = (req, res) => {
  res.cookie("token", "", { expires: new Date(0) });
  return res.sendStatus(200);
};



export const changePassword = async (req, res) => {
  try {
    const { user_id, user_password } = req.body;
    const [result] = await pool.query("select * from users where user_id = ?", [
      user_id,
    ]);

    if (result.length === 0)
      return res.status(404).json({ message: MENSAJES.USUARIO_NO_ENCONTRADO });

    const hashedPassword = bcrypt.hashSync(user_password, 10);
    await pool.query(
      "UPDATE users SET user_password = ?, token = NULL WHERE user_id = ?",
      [hashedPassword, user_id]
    );
    res.json({ message: MENSAJES.PASSWORD_ACTUALIZADO });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const verifyToken = async (req, res) => {
  const { token } = req.cookies;

  if (!token) return res.status(401).json({ message: MENSAJES.NO_TOKEN });

  jwt.verify(token, TOKEN_SECRET, async (err, decoded) => {
    if (err) return res.status(401).json({ message: MENSAJES.NO_AUTORIZADO});
    const [userFound] = await pool.query(
      "select * from users where user_id = ?",
      [decoded.id]
    );
    if (!userFound) return res.status(401).json({ message: MENSAJES.NO_AUTORIZADO});
    return res.json({
      id: userFound[0].user_id,
      user_name: userFound[0].user_name,
      user_last_name: userFound[0].user_last_name,
      user_type: userFound[0].user_type_id,
    });
  });
};

export async function getUserById(req, res) {
  const { id } = req.params;
  const [result] = await pool.query("SELECT * FROM users WHERE user_id = ?", [
    id,
  ]);
  if (result.length > 0) {
    res.json(result[0]).status(200);
  } else {
    res.json({ message: MENSAJES.USUARIO_NO_ENCONTRADO }).status(404);
  }
}

export const edit = async (req, res) => {
  try {
    const { user_id } = req.params;

    const {
      user_name,
      user_middle_name,
      user_last_name,
      user_second_last_name,
      user_mail,
      user_phone,
      user_username,
      user_nit,
      user_birth_date
    } = req.body;

    const [results] = await pool.query(
      "UPDATE users SET user_name = ?, user_middle_name = ?, user_last_name = ?, user_second_last_name = ?, user_mail = ?, user_phone = ?, user_username = ?, user_nit = ? ,user_birth_date = ? WHERE user_id = ?",
      [
        user_name,
        user_middle_name,
        user_last_name,
        user_second_last_name,
        user_mail,
        user_phone,
        user_username,
        user_nit,        
        user_id,
        user_birth_date
      ]
    );

    res.status(200).send({ message: MENSAJES.USUARIO_ACTUALIZADO });
  } catch (error) {
    return res.status(404).json({ message: error.message });
  }
};
