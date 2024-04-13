package stepdefinitions;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.After;
import io.cucumber.java.DataTableType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import models.User;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.lang.annotation.Target;
import java.util.List;
import java.util.Map;

public class formSteps {

    private WebDriver driver;


    @Given("Usuario esta en el formulario de registro")
    public void usuario_esta_en_el_formulario_de_registro() {
        this.driver = new ChromeDriver();
        driver.manage().window().maximize();
        this.driver.get("http://localhost:5173/");
        WebElement registerOption = this.driver.findElement(new By.ByXPath("//*/a"));
        registerOption.click();
    }
    @When("Usuario diligencia el formulario")
    public void usuario_diligencia_el_formulario(List<List<String>> table) {
        User user=usersObject(table);
        WebElement userNit = this.driver.findElement(new By.ByXPath("//*[@name='user_nit']"));
        WebElement userName = this.driver.findElement(new By.ByXPath("//*[@name='user_name']"));
        WebElement userMiddleName = this.driver.findElement(new By.ByXPath("//*[@name='user_middle_name']"));
        WebElement userlastname = this.driver.findElement(new By.ByXPath("//*[@name='user_last_name']"));
        WebElement usersecondlastname = this.driver.findElement(new By.ByXPath("//*[@name='user_second_last_name']"));
        WebElement userBirthDate = this.driver.findElement(new By.ByXPath("//*[@name='user_birth_date']"));
        WebElement userPhone = this.driver.findElement(new By.ByXPath("//*[@name='user_phone']"));
        WebElement usermail = this.driver.findElement(new By.ByXPath("//*[@name='user_mail']"));
        WebElement userusername = this.driver.findElement(new By.ByXPath("//*[@name='user_username']"));
        WebElement userpassword = this.driver.findElement(new By.ByXPath("//*[@name='user_password']"));
        WebElement register = this.driver.findElement(new By.ByXPath("//*/button"));

        userNit.sendKeys(user.getNit());
        userName.sendKeys(user.getName());
        userMiddleName.sendKeys(user.getMiddleName());
        userlastname.sendKeys(user.getLastName());
        usersecondlastname.sendKeys(user.getSecondLastName());
        userBirthDate.sendKeys(user.getBirthDate());
        userPhone.sendKeys(user.getPhone());
        usermail.sendKeys(user.getMail());
        userusername.sendKeys(user.getUserName());
        userpassword.sendKeys(user.getPassword());
        register.click();



    }
    @Then("deberia ver que se registro correctamente")
    public void deberia_ver_que_se_registro_correctamente() {

        WebElement loginButton = this.driver.findElement(new By.ByXPath("//*[@class='submit_button']"));
        Assert.assertEquals("Login",loginButton.getText());
    }

    @Then("^deberia ver que el mensaje de error (.*)$")
    public void deberia_ver_que_el_mensaje_de_error(String messageError) {

        WebElement formError = this.driver.findElement(new By.ByXPath("//*[contains(text(),'"+messageError+"')]"));
        String capturedMessage= formError.getText();

        Assert.assertEquals(messageError,capturedMessage);
    }


    public User usersObject (List<List<String>> table){
        User user = new User();

       user.setNit(table.get(1).get(0));
       user.setName(table.get(1).get(1));
       user.setMiddleName(table.get(1).get(2));
       user.setLastName(table.get(1).get(3));
       user.setSecondLastName(table.get(1).get(4));
       user.setBirthDate(table.get(1).get(5));
       user.setPhone(table.get(1).get(6));
       user.setMail(table.get(1).get(7));
       user.setUserName(table.get(1).get(8));
       user.setPassword(table.get(1).get(9));
        return user;
    }

    @After
    public void quit(){
        this.driver.quit();
    }


}
