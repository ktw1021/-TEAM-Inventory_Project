function redirectToUrl(url) {
    window.location.href = url;
}

function submitWithChecked(checked) {
    var url = new URL(window.location.href);
    if (checked === null) {
        url.searchParams.delete('no');
    } else {
        url.searchParams.set('no', checked);
    }
    window.location.href = url.toString();
}
function submitWithChecke(checked) {
    var url = new URL(window.location.href);
    if (checked === null) {
        url.searchParams.delete('userName');
    } else {
        url.searchParams.set('userName', checked);
    }
    window.location.href = url.toString();
}

function submitWithCh(checked) {
    var url = new URL(window.location.href);
    if (checked === null) {
        url.searchParams.delete('checked');
    } else {
        url.searchParams.set('checked', checked);
    }
    window.location.href = url.toString();
}