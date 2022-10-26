
$(document).ready(function () {
    $('#myTable').DataTable({

        "order": [[0, "desc"]]

    });

});

//$(document).ready(function () {
    //$('#myTable').DataTable();
    //"pageLength": 50
    //$('#myTable').dataTable({
    //    "lengthMenu": [[2, 4, 8, -1], [2, 4, 8, "All"]],
    //    "pageLength": 4
    //});
    
//});


function editdata(object) {
    
    var staff_id = $(object).attr('staff_id');

    //debugger;
    $.ajax({

        type: "POST",   
        dataType: "json",
        url: "Index.aspx/edit_staff_id",
        contentType: "application/json;charset=utf-8",
        //data: "{'staff_id:'" + staff_id + "'}",
        //data: '{staff_id: "' + staff_id + '" }',
        data: '{staff_id: "' + staff_id + '" }',

        success: function (result) {

            //debugger;
            if (result.d != '') {
                //alert(result.d);
                var res = JSON.parse(result.d);
                //console.log(res);
            
                $(res).each(function (key, value) {
                    //debugger;
                    $('#staffid').val(value.id);
                    $('#staffid').attr('disabled','disabled');
                    $('#staffname').val(value.staffname);
                    $('#phone').val(value.phone);
                    $('#email').val(value.email);
                    $('#status').val(value.status).trigger();
                    $('#btn_save').text("Update");

                });


            }
           
        },

    });

}

function reset() {
   
   
    $('#staffname').val("");
    $('#phone').val("");
    $('#email').val("");
    $('#btn_save').text("Save");
    $('#staffid').removeAttr('disabled', 'disabled');
    $('#staffid').val("");
    $('#status').val("").trigger();
}

function deletedata(object) {
   /* alert($(object).attr('staff_id'));*/
    var staff_id = $(object).attr('staff_id');

    //debugger;
    $.ajax({

        type: "POST",
        dataType: "json",
        url: "Index.aspx/delete_data",
        contentType: "application/json;charset=utf-8",
        data: '{staff_id: "' + staff_id + '" }',

        success: function (result) {

            location.reload();
            //debugger;
            if (result.d != '') {
                alert("Deleted");
                //alert(result.d);
                //var res = JSON.parse(result.d);
                //alert(res);
            }         
        },
        error: function (errMsg) {
            console.log(errMsg);
            alert('Ooppss.. some error');
        }

    });
    

}

function check_validation() {
    var checkValidation = true;
    $(".req_control").each(function() {
        if ($(this).val() == "") {
            $(this).addClass("has-error");
            checkValidation = false;
        }
    });

    if (checkValidation == false) {
        alert("All fields are mandatory");
    }
    return checkValidation;
    
}


function email_validation(object) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9])+\.)+([a-zA-Z0-9]{2,4})+$/;

    var isok = regex.test($(object).val())
    if (!isok) {
        $(object).val('');
        alert("Please enter valid email id");
    }
}

function savedata() {
    //debugger;
    if (check_validation() == false) {
        return;

    }
   
    var staffid = $.trim($('#staffid').val());
    var staffname = $.trim($('#staffname').val());
    var phone = $.trim($('#phone').val());
    var email = $.trim($('#email').val());
    var status = $.trim($('#status').val());

    var data = {};
    data.staffid = staffid;
    data.staffname = staffname;
    data.phone = phone;
    data.email = email;
    data.status = status;


    $.ajax({

        type: "POST",
        dataType: "json",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        url: "Index.aspx/Showdata",
        success: function (Record) {

            location.reload();
            $("#message").text(Record.d);
            $("#message").fadeIn('normal', function () {
                $(this).delay(2500).fadeOut();
            });
            reset();

        },

    });



   
}



