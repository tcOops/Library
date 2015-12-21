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
            showRTMsg(response);
        },

        error: function (response) {
            console.log(response)
            console.log("Oops,  some errors!")
        }
    })
}


function showRTMsg(response) {
    // $('#rtcontent').html(response.status)
    console.log(response)
    var content = ""
    for (var i = 0; i < response.length; i += 1) {
        if ('reader_name' in response[i]) {
            content += "读者： " + response[i].reader_name + "</br>"
        }
        if ('action' in response[i]) {
            if(response[i].action == 'open'){
                content += "操作： " + "开门</br>"
            }
            else {
                content += "操作： " + "关门</br>"
            }
        }
        if ('generate_date' in response[i]) {
            content += "操作时间： " + response[i].generate_date + "</br></br>"
        }
      //  if ('door_ip' in response[i]) {
      //      content += "门禁地址（ip地址）： " + response[i].door_ip + "</br>"
      //  }



        //if ('signal_code' in response[i]) {
          //  content += "书籍条形码： " + response[i].signal_code + "</br>"
       // }
        if ('book_name' in response[i]) {
            content += "书籍名称： " + response[i].book_name + "</br>"
        }
        if ('action_date' in response[i]) {
            content += "操作时间： " + response[i].action_date + "</br></br>"
        }
      //  if ('ip' in response[i]) {
      //      content += "RFID地址（ip地址）： " + response[i].ip + "</br></br></br>"
      //  }
    }
    console.log(content)
    if(content != "")
        $('#rtcontent').html(content)
    console.log("ok!!!")
}


function testRTF(response)
{
    var myDate = new Date();
    var mytime = myDate.toLocaleTimeString();
    $('#rtcontent').html(mytime)
    console.log("ok")
}

$(function (){
    setInterval(refreshOnTime, 1400);
    //refreshOnTime();
})