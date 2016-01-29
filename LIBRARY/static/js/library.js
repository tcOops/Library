function getBookBySerial() {
    url = "ajax.aspx"
    data = new Object()
    data.serialCode = $("#bookSerialCode").val();
    data.requestMethod = "getBookByAjax";
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: url,
        async: true,
        data: data,

        success: function (response) {
            //Construct Data 
            console.log("ok")
            b = response
            JsonOfBook(response)
        },

        error: function (response) {
            console.log(response)
            console.log("Oops,  some errors!")
        }
    })
}


function JsonOfBook(response) {
    if (response.Id == 0) {
        $("#bookContent").html("");
        return;
    }

    book = response
    var tmp = '<table style="border-width:0px;border-collapse:collapse;width:100%"><tr style="background-color:#E0E0E0;height:40px;border-width:0px">'
        +  ' <td style="width:9%;border-width:0px;font-weight:bold;text-align:center">标号</td>'
		+  '<td style="width:19%; border-width:0px;font-weight:bold;text-align:center"> 标识码 </td>'
	    +  '<td style="width:29%; border-width:0px;font-weight:bold;text-align:center"> 书名</td>'
		+  '<td style="width:11%; border-width:0px;font-weight:bold;text-align:center">作者</td>'
        +  '<td style="width:11%;border-width:0px;font-weight:bold;text-align:center">价格</td>'
        +  '<td style="width:11%;border-width:0px;font-weight:bold;text-align:center">是否借出</td>'
        +  '<td style="width:10%;border-width:0px;font-weight:bold;text-align:center">操作</td></tr>'


    tmp += '<tr style="height:40px;border-width:0px"><td style="width:9%;border-width:0px;text-align:center">' + book.Id + '</td>'
    tmp += '<td style="width:19%; border-width:0px;text-align:center">' + book.Serial_code + '</td>'
    tmp += '<td style="width:29%; border-width:0px;text-align:center">' + book.Name + '</td>'
    tmp += '<td style="width:11%; border-width:0px;text-align:center">' + book.Author + '</td>'
    tmp += '<td style="width:11%;border-width:0px;text-align:center">' + book.Price + '</td>'
    tmp += '<td style="width:11%;border-width:0px;text-align:center">' + book.Status + '</td>'
    tmp += '<td style="width:10%;border-width:0px;text-align:center"> <button class="btn btn-sm" data-toggle="modal" data-target="#bookSign" onclick=' + '\'showBookInfo('
      + book.Id.toString() + ',\"' + book.Name + '\",\"' + book.Author + '\",\"' + book.Serial_code + '\",\"' + book.Publisher_name
      + '\")\'>标识图书</button></td></tr></table>'
    $("#bookContent").html(tmp);
}


function showBookInfo(bookId, bookName, bookAuthor, bookSerialCode, bookPublisher) {
    url = "ajax.aspx"
    data = new Object()
    $("#bookSerialCodes").html(bookSerialCode)
    $("#bookName").html(bookName)
    $("#bookAuthor").html(bookAuthor)
    $("#bookPublisher").html(bookPublisher)
    $("#bookIdRes").val(bookId)
    data.requestMethod = "getSNCodeById";
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: url,
        async: true,
        data: data,

        success: function (response) {
            //Construct Data 
            console.log("ok")
            if (response.sn_code == -1) {
                $("#bookSN").val("")
            }
            else {
                var code = parseInt(response.sn_code) + 1
                $("#bookSN").val(code.toString())
               // $('#bookSN').attr("readonly", "true")
            }
        },

        error: function (response) {
            console.log(response)
            console.log("Oops,  some errors!")
        }
    })
}

function getBookInfoBySNRange() {
    url = "ajax.aspx"
    data = new Object()
    data.begSN = $("#snCodeBeg").val();
    data.endSN = $("#snCodeEnd").val();
    data.requestMethod = "getBookInfoBySNRange";
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: url,
        async: true,
        data: data,

        success: function (response) {
            //Construct Data 
            d = response
            JsonOfBookList(response)
        },

        error: function (response) {
            console.log(response)
            console.log("Oops,  some errors!")
        }
    })
}



function JsonOfBookList(response) {
    if (response.length == 0) {
        $("#bookContents").html("");
        return;
    }
    console.log('wocao')
    books = response
    tmp = '<div style="margin:15px 0 10px 5px"><!-- 按钮触发模态框 --><button class="btn btn-sm" onclick="choseAll()">全选'
	    + '</button>&nbsp;&nbsp;<button class="btn btn-sm" onclick="choseReverse()">反选</button></div>'
    tmp += '<table style="border-width:0px;border-collapse:collapse;width:100%"><tr style="background-color:#E0E0E0;height:40px;border-width:0px">'
        + '<td style="width:9%;border-width:0px;font-weight:bold;text-align:center">操作</td>'
        + ' <td style="width:9%;border-width:0px;font-weight:bold;text-align:center">SN Code</td>'
		+ '<td style="width:19%; border-width:0px;font-weight:bold;text-align:center"> 标识码 </td>'
	    + '<td style="width:29%; border-width:0px;font-weight:bold;text-align:center"> 书名</td>'
		+ '<td style="width:11%; border-width:0px;font-weight:bold;text-align:center">作者</td>'
        + '<td style="width:11%;border-width:0px;font-weight:bold;text-align:center">馆藏地</td>'
        + '<td style="width:11%;border-width:0px;font-weight:bold;text-align:center">是否借出</td></tr>'

    for (var i = 0; i < books.length; ++i) {
        if (i & 1) {
            tmp += '<tr class="row2">'
        }
        else {
            tmp += '<tr class="row1">'
        }
        
        tmp += '<td style="width:9%;border-width:0px;font-weight:bold;text-align:center"><input type="checkbox" value="' + books[i].Id + '" class="selectNode"></td>'
        tmp += '<td style="width:9%;border-width:0px;text-align:center">' + books[i].Sn_code + '</td>'
        tmp += '<td style="width:19%; border-width:0px;text-align:center">' + books[i].Serial_code + '</td>'
        tmp += '<td style="width:29%; border-width:0px;text-align:center">' + books[i].Name + '</td>'
        tmp += '<td style="width:11%; border-width:0px;text-align:center">' + books[i].Author + '</td>'
        tmp += '<td style="width:11%;border-width:0px;text-align:center">' + books[i].Location_name + '</td>'
        tmp += '<td style="width:11%;border-width:0px;text-align:center">' + books[i].Status + '</td></tr>'
    }
    tmp += '</table>'

    tmp += '<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addBookLocation" onclick="getLocations()"> 图书上架</button>'
    $("#bookContents").html(tmp);
}


function getLocations() {
    url = "ajax.aspx"
    data = new Object()
    data.requestMethod = "getLocationByAjax";
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: url,
        async: true,
        data: data,

        success: function (response) {
            //Construct Data 
            console.log("okba")
            e = response
            $('#location').html("")
            for (var i = 0; i < response.length; ++i) {
                var option = "<option value=" + response[i].Id + ">" + response[i].Location + "</option>"
                $('#location').append(option)
            }
        },

        error: function (response) {
            console.log(response)
            console.log("Oops,  some errors!")
        }
    })
}


function updateLocation(){
    var checkboxs = $('.selectNode')
    var nodeIds = ""
    var flag = false
    for(var i = 0; i < checkboxs.length; ++i){
        if(checkboxs[i].checked){
            if(flag) nodeIds += ','
            else flag = true
            nodeIds += checkboxs[i].value.toString()
        }
    }
    console.log('abs', nodeIds)
    //$('#reserveData').val(nodeIds)
    url = "ajax.aspx"
    data = new Object()
    data.bookIds = nodeIds;
    data.location = $("#location").val()
    data.locationName = $("#location").find("option:selected").text();
    data.requestMethod = "updateBookLocation";
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: url,
        async: true,
        data: data,

        success: function (response) {
            //Construct Data 
            window.location = "bookOnShelf.aspx"
        },

        error: function (response) {
            console.log(response)
            console.log("Oops,  some errors!")
        }
    })
}