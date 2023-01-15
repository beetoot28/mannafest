<?php $results  = mysqli_query($con, " SELECT *,transaction.status as stat FROM `transaction`
    LEFT JOIN accounts ON transaction.user_id = accounts.user_id 
    WHERE transaction.status='delivered' "); ?>
<table id="production_table" class="table table-hover" style="width:100%;">
    <thead class="table-warning">
        <tr style='font-size:14px'>
            <th>Order Code</th>
            <th>Date</th>
            <th>Customer</th>
            <th>Total Price</th>
            <th>Status</th>
            <th>Action</th>


        </tr>
    </thead>
    <tbody style='font-size:15px'>
        <?php while ($row = mysqli_fetch_array($results)) {
                    $tid=  $row['tid'];
                    $gettrans_records = "select sum(total) as total_pay from trans_record where transaction_id = '$tid'  ";
                    $gettingtrans = mysqli_query($con,$gettrans_records); 
                    $gtrans = mysqli_fetch_array($gettingtrans)
                ?>
        <tr>
            <td>MN_<?php echo $row['tid']; ?></td>
            <td><?php echo $row['datecreated']; ?></td>
            <td><?php echo $row['name'].' '.$row['lastname']; ?></td>
            <td>₱ <?php echo $gtrans['total_pay']; ?></td>
            <td>
                <i class="fa-solid fa-truck"></i> Status : <b>Delivered </b>
            </td>
            <td><button class="btn btn-dark text-light btnView" data-od="<?php echo $tid ?>"
                    data-date="<?php echo $row['datecreated'] ?>" data-userid="<?php echo $row['user_id']  ?>"
                    style="font-size: 14px;font-weight: bolder;">VIEW</button></td>

        </tr>

        <?php } ?>
    </tbody>
</table>


<div class="modal fade" id="v_orderDetails" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Order Details</h5>
                <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- <form method='POST' action='functions/orders_action.php'> -->
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" name='trans_id' id="m_trans_id" hidden>                   <div class="form-group">
                            <label for="exampleInputEmail1">Order Number</label>
                            <input type="email" class="form-control" id="v_order_code" aria-describedby="emailHelp"
                                readonly style='text-align:center;font-size:20px;font-weight:bold;'>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Order Date</label>
                            <input type="email" class="form-control" id="v_date_order" aria-describedby="emailHelp"
                                readonly style='text-align:center;font-size:20px;font-weight:bold;'>
                        </div>
                    </div>
                </div>
                <hr>
                <div id='v_address_customer'> </div>
                <hr>
                <h6>Product Order List</h6>
                <div id='v_list_purchased_prod'> </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    
            </div>
            <!-- </form> -->
        </div>
    </div>
</div>



<script>
$('.btnView').click(function() {
    //
    var od = $(this).data('od');
    var date = $(this).data('date');
    var userid = $(this).data('userid');

    console.log(userid);
    $('#v_orderDetails').modal('show')
    $('#v_date_order').val(date)
    $('#v_order_code').val('MN_' + od)


    function fetch_table() {

        var trans_id = (od);
        $.ajax({
            url: "fetch/view_order_details.php",
            method: "POST",
            data: {
                trans_id: trans_id,
            },
            success: function(data) {
                $('#v_list_purchased_prod').html(data);
            }
        });
    }
    fetch_table();


    function fetchAddress() {

        var trans_id = (od);
        $.ajax({
            url: "fetch/order_shipping.php",
            method: "POST",
            data: {
                trans_id: trans_id,
                userid: userid,
            },
            success: function(data) {
                $('#v_address_customer').html(data);
            }
        });
    }
    fetchAddress();


})

</script>