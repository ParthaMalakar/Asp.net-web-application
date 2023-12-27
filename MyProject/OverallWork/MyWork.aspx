<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyWork.aspx.cs" Inherits="MyProject.OverallWork.MyWork" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>My Work Page</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="StyleSheet1.css" />
    </form>
</head>

<body>
<form class=" ">
    <section class="body">

        <h4 class="pl-4 pt-2">Meeting Minutes</h4>
  
    <div class="bg-info1 ml-2 rowpadding mr-2">
                <label>
                    <input type="radio" class="mr-2 fs-4" name="customerType" value="Corporate" onclick="loadNames('Corporate')" /> Corporate
                </label>
                <label class="ml-3">
                    <input type="radio" class="fs-4" name="customerType" value="Individual" onclick="loadNames('Individual')" /> Individual
                </label>
            </div>

            <div class="row bg-info2 ml-2 pt-3">
                <div class="col-md-6">
                    <div>
                        <div id="corporateContainer">
                            <div class="form-group row">
                                <label for="selectedNameCorporate" class="col-md-3 col-form-label">Customer Name:</label>
                                <div class="col-md-7">
                                    <select class="form-control" id="customerSelect" runat="server"></select>
                                </div>
                            </div>
                        </div>

                        <div id="individualContainer">
                            <div class="form-group row">
                                <label for="selectedNameIndividual" class="col-md-3 col-form-label">Customer Name:</label>
                                <div class="col-md-7">
                                     <select class="form-control" id="InSelect" runat="server"></select>
                                </div>
                            </div>
                        </div>

         <div class="form-group row">
            <label for="meetingDate" class="col-md-3 col-form-label">Date:</label>
            <div class="col-md-3">
                <input type="date" class="form-control" name="meetingDate" />
            </div>

            <label for="meetingTime" class="col-md-1 col-form-label">Time:</label>
            <div class="col-md-3">
                <input type="time" class="form-control" name="meetingTime" />
            </div>
        </div>

       <div class="form-group row">
    <label for="meetingPlace" class="col-md-3 col-form-label">Meeting Place:</label>
    <div class="col-md-7">
        <input placeholder="meeting place" type="text" class="form-control" name="meetingPlace" />
    </div>
</div>

<div class="form-group row">
    <label for="clientAttends" class="col-md-3 col-form-label">Attends from client side:</label>
    <div class="col-md-7">
        <textarea placeholder="Present Client side" class="form-control" name="clientAttends"></textarea>
    </div>
</div>


        <div class="form-group row">
    <label for="hostAttends" class="col-md-3 col-form-label">Attends from Host side:</label>
    <div class="col-md-7">
        <textarea placeholder="Present Server Side" class="form-control" name="hostAttends"></textarea>
    </div>
</div>

        <div class="form-group row">
            <label for="hostAttends" class="col-md-3 col-form-label">Attends from Host side:</label>
        <div class="col-md-7">
        <textarea placeholder="Present Server Side" class="form-control" name="hostAttends"></textarea>
        </div>
        </div>

        
    </div>
</div>


        <div class="col-md-6">
            <div class="">
               <div class="form-group row">
    <label for="meetingAgenda" class="col-md-3 col-form-label">Meeting Agenda:</label>
    <div class="col-md-7">
        <textarea placeholder="Meeting Agenda" class="form-control" name="meetingAgenda"></textarea>
    </div>
</div>
<div class="form-group row">
    <label for="meetingDiscussion" class="col-md-3 col-form-label">Meeting Discussion:</label>
    <div class="col-md-7">
        <textarea placeholder="Meeting Discussion" class="form-control" name="meetingDiscussion"></textarea>
    </div>
</div>
<div class="form-group row">
    <label for="meetingDecision" class="col-md-3 col-form-label">Meeting Decision:</label>
    <div class="col-md-7">
        <textarea placeholder="Meeting Decision" class="form-control" name="meetingDecision"></textarea>
    </div>
</div>

            </div>
        </div>
    </div>
    
   
   <div class="ml-2 mt-3 bg-info2 pb-4">
       <div class="form-group row mt-2">
    <label for="selected" class="col-md-2 col-form-label pl-4">Interested Product/Service:</label>
    <div class="col-md-4">
   <select class="form-control" id="product" runat="server"></select>

    </div>
</div>

       <div class="form-group row col-md-6">
            <label for="quantity" class="col-md-4 col-form-label">Quantity:</label>
            <div class="col-md-3">
                <input type="text" class="form-control" id="Quantity" name="quantity" />
            </div>

            <label for="unit" class="col-md-1 col-form-label">Unit:</label>
            <div class="col-md-4">
                <input type="text" readonly class="form-control" name="unit" />
            </div>
        </div>
    <button type="button" class="btn btncol ml-3" onclick="addRow();" >Add to table</button>
   
   </div>
<div class="ml-2 mt-3 bg-info2 pb-4">
     <table class="table" id="productTable">
        <thead>
            <tr>
                <th>SL#</th>
                <th>Product/Service</th>
                <th>Unit</th>
                <th>Quantity</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    
</div>
   

    <button type="button" class="btn btncol ml-3 mt-4" id="saveButton">Save</button>
            <button type="button" class="btn btncol ml-3 mt-4" id="saveButton">Refresh</button>

</section>
 <script src="Scripts/bootstrap.bundle.min.js"></script>
        <script>
            var serialCounter = 1;
            function addRow() {
                var selectedOption = $("#product");
                var product = selectedOption.val();
                var quantity = $("#Quantity").val();
                var serial = serialCounter++;
                $.ajax({
                    type: "POST",
                    url: "Backend.asmx/GetUnit",
                    data: JSON.stringify({ productName: product }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var unit = data.d;


                        var newRow = "<tr>seral<td>" + serial + "</td><td>" + product + "</td><td>" + unit + "</td><td>" + quantity + "</td>" +
                            "<td><button type='button' class='btn btn-info btn-sm' onclick='editRow(this);'>Edit</button></td>" +
                            "<td><button type='button' class='btn btn-danger btn-sm' onclick='deleteRow(this);'>Delete</button></td></tr>";
                        $("#productTable tbody").append(newRow);

                        selectedOption.val('');
                        $("#Unit").val('');
                        $("#Quantity").val('');
                    },
                    error: function (error) {
                        console.log("Error fetching unit information: " + error.responseText);
                    }
                });
            }

            function editRow(button) {
                var row = $(button).closest('tr');
                var serial = row.find('td:eq(0)').text(); 
                var product = row.find('td:eq(1)').text();
                var unit = row.find('td:eq(2)').text();
                var quantity = row.find('td:eq(3)').text();
                $("#product").val(product);
                $("#Unit").val(unit);
                $("#Quantity").val(quantity);
                
                console.log("Serial: " + serial);
                console.log("Product: " + product);
                console.log("Unit: " + unit);
                console.log("Quantity: " + quantity);

            

                row.remove();
            }

            function deleteRow(button) {
                var row = $(button).closest('tr');
                row.remove();
            }

            function loadNames(customerType) {
                if (customerType === 'Corporate') {
                    $('#corporateContainer').removeClass('hidden');
                    $('#individualContainer').addClass('hidden');
                } else if (customerType === 'Individual') {
                    $('#corporateContainer').addClass('hidden');
                    $('#individualContainer').removeClass('hidden');
                }
            }

            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    url: "Backend.asmx/GetDatabaseData",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var select = $("#customerSelect");
                        $.each(data.d, function (index, item) {
                            select.append($("<option>").val(item).text(item));
                        });
                    },
                    error: function (error) {
                        console.log("Error loading customers: " + error.responseText);
                    }
                });
            });
            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    url: "Backend.asmx/GetIndividualData",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var select = $("#InSelect");
                        $.each(data.d, function (index, item) {
                            select.append($("<option>").val(item).text(item));
                        });
                    },
                    error: function (error) {
                        console.log("Error loading customers: " + error.responseText);
                    }
                });
            });
            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    url: "Backend.asmx/GetProduct",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var select = $("#product");
                        $.each(data.d, function (index, item) {
                            select.append($("<option>").val(item).text(item));
                        });
                    },
                    error: function (error) {
                        console.log("Error loading customers: " + error.responseText);
                    }
                });
            });
        </script>

</form>
      
</body>
</html>
