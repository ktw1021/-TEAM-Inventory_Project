
function addToCart() {
	var bookSelect = document.getElementById("bookSelect");
	var quantity = document.getElementById("quantity").value;

	// 교재 선택 여부 확인
	if (bookSelect.value === "") {
		alert("교재를 선택해주세요.");
		return; // 교재를 선택하지 않으면 함수 종료
	}

	// 장바구니 추가 알림
	alert("장바구니에 상품이 추가되었습니다.");

	// 폼을 제출하지 않도록 preventDefault() 호출
	event.preventDefault(); // 폼 제출 방지

	// 추가 로직 (필요하면 추가)

	// 폼을 제출하는 방식으로 변경
	var form = document.getElementById("addToCartForm");
	form.submit();
}

/* function filterBooks() {
	var input, filter, select, options, option, i, txtValue;
	input = document.getElementById("bookSearch");
	filter = input.value.toUpperCase();
	select = document.getElementById("bookSelect");
	options = select.getElementsByTagName("option");

	for (i = 0; i < options.length; i++) {
		option = options[i];
		txtValue = option.textContent || option.innerText;
		if (txtValue.toUpperCase().indexOf(filter) > -1) {
			option.style.display = "";
		} else {
			option.style.display = "none";
		}
	}
} */

function confirmSubmit() {
	var confirmed = confirm('정말로 제출하시겠습니까?');
	return confirmed;
}

function updateExpectedStock(input, inventory) {
	var quantity = parseInt(input.value);
	var row = input.parentNode.parentNode; // 해당 input 태그가 속한 tr 요소
	var expectedStockCell = row
		.querySelector(".expected-stock");

	if (!isNaN(quantity) && quantity >= 0) {
		expectedStockCell.textContent = (inventory + quantity)
			.toString();
	} else {
		expectedStockCell.textContent = inventory.toString();
	}
}

function addToCart2() {
	var form = document.getElementById("addToCartForm2");
	var quantities = document
		.querySelectorAll(".quantity-input");

	var anyQuantitySelected = false;
	for (var i = 0; i < quantities.length; i++) {
		if (quantities[i].value > 0) {
			anyQuantitySelected = true;
			break;
		}
	}

	if (!anyQuantitySelected) {
		alert("최소 한 권 이상의 교재를 선택해야 합니다.");
		return;
	}
	// 장바구니 추가 알림
	alert("장바구니에 상품이 추가되었습니다.");

	form.submit();
}

// 검색 필드에 입력이 들어올 때마다 호출되도록 이벤트 핸들러 설정
document.getElementById("bookSearch").addEventListener("input",
	filterBooks);