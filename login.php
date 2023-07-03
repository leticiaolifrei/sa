<?php
include 'conexao.php';

session_start();

// if($_SERVER["REQUEST_METHOD"] === 'POST'){
     $email = $_POST['email'];
     $senha = $_POST['senha'];

    $sql = "SELECT * FROM user where email = ? AND senha = ?";

    $stmt = $conexao->prepare($sql);
    $stmt->bind_param('ss', $email, $senha);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if($resultado->num_rows === 1){
        //login foi efetuado com sucesso.
        $_SESSION['email'] = $email;
        header("Location: site.html");
        exit();
    }else{
        echo "Credenciais invalidas. Verifique seu email e senha ";
    }


$conexao->close();
?>