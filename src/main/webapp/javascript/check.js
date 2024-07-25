function submitWithChecked(checked) {
    var url = new URL(window.location.href);
    if (checked === null) {
        url.searchParams.delete('checked');
    } else {
        url.searchParams.set('checked', checked);
    }
    window.location.href = url.toString();
}

function submitWithBranchId(branchId) {
    var url = new URL(window.location.href);
    if (branchId === null) {
        url.searchParams.delete('branchId');
    } else {
        url.searchParams.set('branchId', branchId);
    }
    window.location.href = url.toString();
}
function redirectToUrl(url) {
    window.location.href = url;
}
function downloadCSV() {
    var csvContent = "data:text/csv;charset=utf-8,";

    // Add table headers to CSV content
    var headers = [];
    var table = document.getElementById("orderTable");
    var headerRow = table.rows[0];
    for (var i = 0; i < headerRow.cells.length; i++) {
        headers.push(headerRow.cells[i].innerText);
    }
    csvContent += headers.join(",") + "\n";

    // Add table rows to CSV content
    for (var i = 1; i < table.rows.length; i++) {
        var row = [];
        var cells = table.rows[i].cells;
        for (var j = 0; j < cells.length; j++) {
            row.push(cells[j].innerText);
        }
        csvContent += row.join(",") + "\n";
    }

    // Create download link and trigger download
    var encodedUri = encodeURI(csvContent);
    var link = document.createElement("a");
    link.setAttribute("href", encodedUri);
    link.setAttribute("download", "order.csv");
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}