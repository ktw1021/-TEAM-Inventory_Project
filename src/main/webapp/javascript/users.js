document.addEventListener("DOMContentLoaded", function () {
    const urlParams = new URLSearchParams(window.location.search);
    const errorParam = urlParams.get('error');
    if (errorParam) {
        alert('아이디 또는 비밀번호가 잘못 되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.');
    }
});

function validateLoginForm(event) {
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;

    if (username === '' || password === '') {
        alert('아이디와 패스워드를 모두 입력해주세요.');
        return false; // 폼 제출을 막음
    }

    return true; // 폼 제출을 허용
}

function checkName(event) {
    console.log("작동 함!");
    const obj = event.target; // button#check-email
    const target = obj.getAttribute("data-target"); // API 호출 위치
    const frm = obj.form; // 폼 

    const name = frm.name.value.trim();

    if (name.length === 0) {
        alert("이름을 입력하세요!");
        return;
    }
    if (name.length > 10){
		alert("길어!");
        return;
	}

    console.log(`${target}?name=${name}`);
    fetch(`${target}?name=${name}`)
        .then(response => {
            console.log(response);
            return response.json();
        })
        .then(json => {
            console.log(json);
            if (json.exists) {
                alert('이미 사용중인 아이디입니다.');
                throw new Error('중복된 아이디입니다.');
            } else {
                alert('사용 가능한 아이디입니다.');
                frm.checkedName.value = "y";
            }
        })
        .catch(error => console.error(error));
}

window.addEventListener("load", event => {
    document.getElementById("checkName")
        .addEventListener("click", checkName);

    document.getElementById("joinForm")
        .addEventListener("submit", event => {
            const frm = event.target;

            event.preventDefault();

            if (frm.name.value.trim().length === 0) {
                alert("이름을 입력하세요");
                frm.name.focus();
                return;
            }

            if (frm.password.value.trim().length === 0) {
                alert("비밀번호를 입력하세요");
                frm.password.focus();
                return;
            }

            if (frm.branchId.value.trim().length === 0) {
                frm.email.focus();
                return;
            }

            if (frm.checkedName.value !== "y") {
                alert("이름 중복 여부를 확인을 해주세요");
                return;
            }
            if (frm.checkPass.value !== "y"){
				alert ('비밀번호가 일치하지 않습니다');
				return;
			}

            frm.submit();
        });
});

function checkPasswordStrength(password) {
    var strengthText = document.getElementById("strengthText");
    var strengthSegments = document.getElementsByClassName("strengthBarSegment");
    var strength = 0;
    if (password.length >= 8) strength += 1;
    if (password.match(/[a-z]+/)) strength += 1;
    if (password.match(/[A-Z]+/)) strength += 1;
    if (password.match(/[0-9]+/)) strength += 1;
    if (password.match(/[\W]+/)) strength += 1;

    for (var i = 0; i < strengthSegments.length; i++) {
        strengthSegments[i].style.backgroundColor = "white";
    }

    switch (strength) {
        case 0:
        case 1:
            strengthText.textContent = "매우 약함";
            strengthText.style.color = "red";
            for (var i = 0; i < 1; i++) {
                strengthSegments[i].style.backgroundColor = "red";
            }
            break;
        case 2:
            strengthText.textContent = "약함";
            strengthText.style.color = "red";
            for (var i = 0; i < 2; i++) {
                strengthSegments[i].style.backgroundColor = "red";
            }
            break;
        case 3:
            strengthText.textContent = "보통";
            strengthText.style.color = "blue";
            for (var i = 0; i < 3; i++) {
                strengthSegments[i].style.backgroundColor = "blue";
            }
            break;
        case 4:
            strengthText.textContent = "강함";
            strengthText.style.color = "#32CD32"; // 밝은 초록색
            for (var i = 0; i < 4; i++) {
                strengthSegments[i].style.backgroundColor = "#32CD32"; // 밝은 초록색
            }
            break;
        case 5:
            strengthText.textContent = "매우 강함";
            strengthText.style.color = "#32CD32"; // 밝은 초록색
            for (var i = 0; i < 5; i++) {
                strengthSegments[i].style.backgroundColor = "#32CD32"; // 밝은 초록색
            }
            break;
        default:
            strengthText.textContent = "";
            strengthText.style.color = "black";
    }
}

function checkPasswordMatch() {
    var password = document.getElementById("newPassword").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var mismatchMessage = document.getElementById("passwordMismatch");
    var checkPassInput = document.querySelector("input[name='checkPass']");

    if (password !== confirmPassword) {
        mismatchMessage.style.display = "block";
        checkPassInput.value = "n";
    } else {
        mismatchMessage.style.display = "none";
        checkPassInput.value = "y";
    }
}

document.addEventListener("DOMContentLoaded", function () {
    var passwordInput = document.getElementById("newPassword");
    var confirmPasswordInput = document.getElementById("confirmPassword");

    passwordInput.addEventListener("input", function () {
        checkPasswordStrength(passwordInput.value);
        checkPasswordMatch();
    });

    confirmPasswordInput.addEventListener("input", checkPasswordMatch);
});
