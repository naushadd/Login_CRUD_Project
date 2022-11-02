function EvaluateScore() {

    var count = 0;
    var attr_autoId;
    $(".chk").each(function () {
        if ($(this).prop('checked')) {

            count = count + 1;
        }
    })
    //alert(count);
    if (count > 1) {

        alert("Please Select Only 1");

        //return false;
        return;
    }

    if (count == 0) {


        alert("Please Select Atleast 1");
        //return false;
        return;
    }

    if (count == 1) {

        var attr_autoId;
        var Assign;
        $('.chk').each(function () {
            
            if ($(this).prop('checked') && $(this).attr('IsAssign')=="1") {
                attr_autoId = $(this).attr('attr_autoid');
                Assign = $(this).attr('IsAssign');
                //alert(attr_autoId);
            }
        });

        if (Assign == "1") {

            jQuery.noConflict();
            $('#ModalPopUp').modal('show');
            $("#hid_Id").val(attr_autoId);
        }
        else {
            alert("Not Allowed");
        }
        
    }
    




}




function AssignReader() {

    var count = 0;
    var attr_autoId;
    $(".chk").each(function () {
        if ($(this).prop('checked')) {
            
            count = count + 1;
        }
    })
    //alert(count);
    if (count > 1) {
        
        alert("Please Select Only 1");
       
        //return false;
        return;
    }

    if (count == 0) {
 
       
        alert("Please Select Atleast 1");
        //return false;
        return;
    }

    if (count == 1) {
        debugger;   
        //$('#AssignReaderPopUp').modal('show');

        jQuery.noConflict();
        $('#AssignReaderPopUp').modal('show');

        var attr_autoId;
        $('.chk').each(function () {
            //alert($(this).prop('checked'))
            if ($(this).prop('checked')) {
                attr_autoId = $(this).attr('attr_autoid');
                alert(attr_autoId);
            }
        });
            
        $("#hid_Id").val(attr_autoId);

    }
    
}

