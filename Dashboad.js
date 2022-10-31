
function SubmitDetails() {
    //debugger;
    
    var App_Name = $.trim($('#txt_AppName').val());
    var Reader = $.trim($('#txt_Reader').val());
    var Resume_Score = $.trim($('#txt_ResumeScore').val());
    var Video_Score = $.trim($('#txt_VideoScore').val());
    var H_V_Status = $.trim($('#txt_HVStatus').val());
    var Reading_Score = $.trim($('#txt_ReadingScore').val());
    var Reading_Status = $.trim($('#txt_ReadingStatus').val());


    var data = {};

    data.txt_AppName = App_Name;
    data.txt_Reader = Reader;
    data.txt_ResumeScore = Resume_Score;
    data.txt_VideoScore = Video_Score;
    data.txt_HVStatus = H_V_Status;
    data.txt_ReadingScore = Reading_Score;
    data.txt_ReadingStatus = Reading_Status;

    //debugger;
    $.ajax({
        type: "POST",
        dataType: "json",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        url: "DashBoard.aspx/AddDetail",
        success: function (Result) {
            if (Result != "") {

                alert(Result.d);
                location.reload();
            }

        },

    });

}
//Email_Template Save End.


function AssignReader() {

    var count = 0;
    $(".chk").each(function () {
        if ($(this).prop('checked')) {
            count = count + 1;
        }
    })
    //alert(count);
    if (count > 1) {

        alert("Please select only 1");
        $('#AssignReaderPopUp').modal('hide');
        //return false;
        return;
    }

    if (count == 0) {

        alert("Please select atleast 1");
        $('#AssignReaderPopUp').modal('hide');

        //return false;
        return;
    }


    //var attr_autoId;
    $('.chk').each(function () {
        //alert($(this).prop('checked'))
        if ($(this).prop('checked')) {
            attr_autoId = $(this).attr('attr_autoid');
            alert(attr_autoId);
        }

    });

}

