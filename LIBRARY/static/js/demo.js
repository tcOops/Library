function refreshOnTime() {
    url = "ajax.aspx"
	data = new Object()
	data.requestMethod = "getDemoInfo";
    $.ajax({
        type : 'post',
        dataType : 'json',
        url : url,
        async : true,
        data :  data,

        success: function (response) {
            //Construct Data 
            //testRTF();
        },

        error : function(response){
            console.log("Oops,  some errors!")
        }
    })
}

function testRTF()
{
    var myDate = new Date();
    var mytime = myDate.toLocaleTimeString();
    $('#rtcontent').html(mytime)
    console.log("ok")
}

$(function (){
    setInterval(refreshOnTime, 1000);
})