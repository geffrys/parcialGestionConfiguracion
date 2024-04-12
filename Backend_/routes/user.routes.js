import { Router } from "express";
import {  newUser, LogIn, logOut, verifyToken, edit, changePassword, getUserById  } from "../controllers/users.controllers.js";


const router = Router();

router.post("/", newUser);
router.post("/login", LogIn)
router.post("/logout", logOut)
router.post("/change", changePassword)
router.get("/verifytoken", verifyToken);
router.put("/edit/:user_id", edit);
router.delete("/");
router.get("/:id", getUserById);

export default router;
