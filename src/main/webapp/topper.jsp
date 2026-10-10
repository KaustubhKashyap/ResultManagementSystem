<%@ page import="java.util.*" %>
<%@ page import="com.rms.model.Topper" %>

<%
List<Topper> list =
    (List<Topper>) request.getAttribute("topperList");

int totalRecords = 0;

if(list != null) {
    totalRecords = list.size();
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Topper List | Result Management System</title>

<style>

*{
    box-sizing:border-box;
}

body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#f4f6f9;
    color:#2c3e50;
}

.header{
    background:#2c3e50;
    color:white;
    padding:22px 35px;
}

.header h1{
    margin:0;
    font-size:25px;
}

.header p{
    margin:6px 0 0;
    color:#dfe6e9;
    font-size:14px;
}

.container{
    width:92%;
    max-width:1100px;
    margin:35px auto;
}

.page-title{
    background:white;
    padding:25px;
    border-radius:14px;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
    margin-bottom:22px;
}

.page-title h2{
    margin:0;
    font-size:25px;
    color:#2c3e50;
}

.page-title p{
    margin:8px 0 0;
    color:#7f8c8d;
}

.summary{
    display:flex;
    gap:18px;
    margin-bottom:22px;
    flex-wrap:wrap;
}

.summary-card{
    flex:1;
    min-width:220px;
    background:white;
    padding:20px;
    border-radius:14px;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
}

.summary-card h3{
    margin:0 0 8px;
    font-size:14px;
    color:#7f8c8d;
    text-transform:uppercase;
}

.summary-card strong{
    font-size:24px;
    color:#2c3e50;
}

.topper-card{
    background:#fff8dc;
    border:1px solid #f1c40f;
}

.topper-card strong{
    color:#b8860b;
}

.table-card{
    background:white;
    padding:25px;
    border-radius:14px;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
    overflow-x:auto;
}

.table-header{
    margin-bottom:18px;
}

.table-header h3{
    margin:0;
    font-size:20px;
}

.table-header p{
    margin:6px 0 0;
    color:#7f8c8d;
    font-size:14px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#2c3e50;
    color:white;
    padding:14px;
    text-align:center;
    font-size:14px;
}

td{
    padding:14px;
    text-align:center;
    border-bottom:1px solid #ecf0f1;
    font-size:14px;
}

tr:hover{
    background:#f8f9fa;
}

.rank{
    font-weight:bold;
}

.rank1{
    background:#fff8dc;
}

.rank1 td{
    font-weight:bold;
}

.medal{
    font-size:20px;
}

.percentage{
    font-weight:bold;
    color:#2980b9;
}

.topper-badge{
    display:inline-block;
    padding:6px 12px;
    border-radius:20px;
    background:#fff3cd;
    color:#9a6700;
    font-size:12px;
    font-weight:bold;
}

.record-count{
    margin-top:18px;
    color:#7f8c8d;
    font-size:14px;
}

.back-btn{
    display:inline-block;
    margin-top:22px;
    padding:12px 22px;
    background:#2c3e50;
    color:white;
    text-decoration:none;
    border-radius:8px;
    font-weight:bold;
}

.back-btn:hover{
    background:#1f2d3a;
}

.empty{
    text-align:center;
    padding:35px;
    color:#7f8c8d;
}

.footer{
    text-align:center;
    padding:25px;
    color:#95a5a6;
    font-size:13px;
}

@media(max-width:700px){

    .header{
        padding:18px;
    }

    .container{
        width:95%;
        margin:20px auto;
    }

    .page-title,
    .table-card{
        padding:18px;
    }

    th,td{
        padding:10px 8px;
    }

}

</style>

</head>

<body>

<div class="header">

    <h1>Result Management System</h1>

    <p>Academic Result & Student Management Portal</p>

</div>


<div class="container">


    <div class="page-title">

        <h2>&#127942; Topper List</h2>

        <p>
            Student ranking based on academic percentage.
        </p>

    </div>


    <div class="summary">


        <div class="summary-card topper-card">

            <h3>Current Topper</h3>

            <strong>

                <%
                if(list != null && !list.isEmpty()){
                    out.print(list.get(0).getStudentName());
                }else{
                    out.print("N/A");
                }
                %>

            </strong>

        </div>


        <div class="summary-card">

            <h3>Highest Percentage</h3>

            <strong>

                <%
                if(list != null && !list.isEmpty()){
                    out.print(
                        String.format(
                            "%.2f",
                            list.get(0).getPercentage()
                        )
                    );
                }else{
                    out.print("0.00");
                }
                %>%

            </strong>

        </div>


        <div class="summary-card">

            <h3>Total Records</h3>

            <strong>
                <%=totalRecords%>
            </strong>

        </div>


    </div>


    <div class="table-card">


        <div class="table-header">

            <h3>Student Ranking</h3>

            <p>
                Complete student-wise academic performance ranking.
            </p>

        </div>


        <%
        if(list != null && !list.isEmpty()){
        %>

        <table>

            <tr>

                <th>Rank</th>

                <th>Roll Number</th>

                <th>Student Name</th>

                <th>Percentage</th>

                <th>Recognition</th>

            </tr>


            <%

            int rank = 1;

            for(Topper t : list){

            %>

            <tr class="<%=rank == 1 ? "rank1" : ""%>">


                <td class="rank">

                    <%
                    if(rank == 1){
                    %>

                    <span class="medal">&#127942;</span>

                    <%
                    }else if(rank == 2){
                    %>

                    <span class="medal">&#129352;</span>

                    <%
                    }else if(rank == 3){
                    %>

                    <span class="medal">&#129353;</span>

                    <%
                    }else{
                    %>

                    <%=rank%>

                    <%
                    }
                    %>

                </td>


                <td>
                    <%=t.getRollNo()%>
                </td>


                <td>

                    <strong>
                        <%=t.getStudentName()%>
                    </strong>

                </td>


                <td class="percentage">

                    <%=String.format(
                        "%.2f",
                        t.getPercentage()
                    )%>%

                </td>


                <td>

                    <%
                    if(rank == 1){
                    %>

                    <span class="topper-badge">
                        TOP PERFORMER
                    </span>

                    <%
                    }else{
                    %>

                    <span style="color:#95a5a6;">
                        -
                    </span>

                    <%
                    }
                    %>

                </td>


            </tr>


            <%

                rank++;

            }

            %>

        </table>


        <div class="record-count">

            Total Records:
            <strong><%=totalRecords%></strong>

        </div>


        <%
        }else{
        %>

        <div class="empty">

            No student result records available.

        </div>

        <%
        }
        %>


        <a
            href="DashboardServlet"
            class="back-btn">

            &#8592; Back To Dashboard

        </a>


    </div>


</div>


<div class="footer">

    &copy; 2026 Result Management System
    &nbsp;|&nbsp;
    Academic Administration Portal

</div>


</body>

</html>