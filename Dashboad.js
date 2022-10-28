////function OpenEvaluatePopUp() {
////    debugger;

////    $("#ModalPopUp").modal({ backdrop: 'static', keyboard: false });
////    $("#ModalPopUp").show();
////}

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

