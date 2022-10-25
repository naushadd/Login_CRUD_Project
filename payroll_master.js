

$(document).ready(function () {
    get_payroll($('#ddlStaff').val())
})
function get_data_by_user_id(obj) {
    get_payroll($(obj).val())
}

function get_payroll(StaffName) {
    //debugger;

    $.ajax({

        type: "POST",
        dataType: "json",
        url: "Payroll.aspx/payroll_define",
        contentType: "application/json;charset=utf-8",
        data: '{StaffName: "' + StaffName + '" }',

        success: function (result) {

          
            //debugger;
            if (result.d != '') {
                var res = JSON.parse(result.d);

                $(res).each(function (key, value) {
                    $('#txt_basic').val(value.Basicsalary);
                    $('#txt_house').val(value.Houserent);
                    $('#txt_medical').val(value.Medicalallowances);
                    $('#txt_special').val(value.Specialallowances);
                    $('#txt_total').val(value.Totalsalary);
                    $('#btn_add').text("Update Salary Structure");
                });

            }
        },


        });

}

function check_validation() {
    var checkValidation = true;
    $(".req_control").each(function () {
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



function AddPayroll() {

    if (check_validation() == false) {
        return;

    }

    //debugger;
    var Staff_Name = $.trim($('#ddlStaff').val());
    var Basic_Salary = $.trim($('#txt_basic').val());
    var House_Rent = $.trim($('#txt_house').val());
    var Medical = $.trim($('#txt_medical').val());
    var Special = $.trim($('#txt_special').val());
    var Total  = $.trim($('#txt_total').val());


    //debugger;
    var data = {};  
    data.ddlStaff = Staff_Name;
    data.txt_basic = Basic_Salary;
    data.txt_house = House_Rent;
    data.txt_medical = Medical;
    data.txt_special = Special;
    data.txt_total = Total;


    $.ajax({

        type: "POST",
        dataType: "json",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        url: "Payroll.aspx/Add_data",
        success: function (Record) {
            //debugger;
            $("#message").text(Record.d);
            $("#message").fadeIn('normal', function () {
                $(this).delay(2500).fadeOut();
            });
        },

    });

}


