
<?php 
session_start();
 include('../connections/connect.php');
                        if (isset($_POST['add'])) {


                            $selected_items = implode(",", $_POST["product_select"]);

                        
                             $user_id = $_POST['user_id'];
                             $tid = $_POST['tid'];
                             $reason = $_POST['reason'];


                             $date = $_POST['date'];
                             $payment = $_POST['payment'];


                            $image_name = $_FILES['image']['name'];
                            $tmp_name   = $_FILES['image']['tmp_name'];
                       
                                                                                                                                                                       
                            echo $fileName =basename($_FILES['image']['name']);
                           
                            $uploads_dir = '../img/return_proof';
                            move_uploaded_file($tmp_name , $uploads_dir .'/'.$fileName);



                                $query = "INSERT INTO return_request (user_id,transaction_id,selected_prod,proof_img,reason,status,date_ordered,payment_type) 
                                        VALUES ('$user_id','$tid','$selected_items','$fileName','$reason','Pending','$date','$payment')";
                                $results = mysqli_query($con, $query);
                                   
                                    if ($results) {
                                        header("Location: ../orders.php?p=$tid");
                                        $_SESSION['new_address']= "successful";
                                        
                                        exit();
                                    } else {
                                        echo "ERROR: Could not be able to execute $query. ".mysqli_error($con);
                                    }
                                exit();
                                }
 ?>