document.addEventListener('DOMContentLoaded', function() {
	//	일단 토큰 넣기
	const csrfToken = document.querySelector('meta[name="_csrf"]').getAttribute('content');
    const csrfHeader = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');
        
    // 입력 날짜 저장하는 변수
    let rememberedStartDate = '';
    let rememberedEndDate = '';
    
    //	초기 페이지 로드를 위한 리스트 받기
    fetch('/Inventory/branch/initialList')
    .then(response => response.json())
    .then(data => {
		createTable(data);
	}).catch(error => console.error(error));
	
    // orderBy 설정 로직
    let orderByInput = document.getElementById('orderBy');
    let orderBy = orderByInput.value || '';
    window.updateOrderBy = function(field) {
        let orderByArray = orderBy.split(',').map(s => s.trim()).filter(s => s);
        let fieldIndex = orderByArray.findIndex(s => s.startsWith(field + ' '));

        if (fieldIndex > -1) {
            let currentOrder = orderByArray[fieldIndex].split(' ')[1];
            if (currentOrder === 'asc') {
                orderByArray[fieldIndex] = field + ' desc';
            } else {
                orderByArray.splice(fieldIndex, 1);
            }
        } else {
            orderByArray.push(field + ' asc');
        }

        orderBy = orderByArray.join(', ');
        document.getElementById('orderBy').value = orderBy;
        document.getElementById('search-form').dispatchEvent(new Event('submit'));
    }
    // 정렬 초기화 버튼 이벤트
    document.getElementById('resetOrderBy').addEventListener('click', function() {
        orderByInput.value = '';
        orderBy = '';
        document.getElementById('search-form').dispatchEvent(new Event('submit'));
    });
    
    	
	let kindCodeInput = document.getElementById('kindCode');
    let kindCode = kindCodeInput.value || '';
    window.selectListKindCode = function(e, event) {
		event.stopPropagation();
        if (e === null) {
            kindCode = "";
        } else {
            kindCode = e;
        }
        kindCodeInput.value = kindCode;
        document.getElementById('search-form').dispatchEvent(new Event('submit'));
    }
    
	// Ajax요청 List 받기 함수
	document.getElementById('search-form').addEventListener('submit', function(event) {
		event.preventDefault();
		
		let form = document.getElementById('search-form');
		let formData = new FormData(form);
		
		let startDateValue = document.getElementById('startDate').value;
		if (startDateValue) {
		    formData.append('startDate', startDateValue);
		    rememberedStartDate = startDateValue; // 값을 기억
		} else {
		    formData.append('startDate', ''); // 날짜가 없으면 빈 문자열을 서버에 전송
		    rememberedStartDate = ''; // 값을 초기화
		}
		let endDateValue = document.getElementById('endDate').value;
		if(endDateValue){
		    formData.append('endDate', endDateValue);
		    rememberedEndDate = endDateValue;
		} else {
		    formData.append('endDate', '');
		    rememberedEndDate = '';
		}
		
		fetch('/Inventory/branch/search', {
		    method: 'POST',
		    headers: {
		        'Content-Type': 'application/x-www-form-urlencoded',
		        [csrfHeader]: csrfToken
		    },
		    body: new URLSearchParams(formData).toString()
		})
		.then(response => response.json())
		.then(data => createTable(data))
		.catch(error => console.error(error));
	})
	
	// 검색어 초기화 로직
    window.resetKeyword = function() {
        document.querySelector('input[name="keyword"]').value = '';
        document.getElementById('search-form').dispatchEvent(new Event('submit')); // 폼 제출 이벤트를 강제로 발생
    };
	
	// Table toggle 버튼 이벤트 추가
    document.getElementById('toggleTable').addEventListener('click', function() {
        let table1 = document.getElementById('inventory-table1');
        let table2 = document.getElementById('inventory-table2');
        if (table1.style.display === 'none') {
            table1.style.display = '';
            table2.style.display = 'none';
        } else {
            table1.style.display = 'none';
            table2.style.display = '';
        }
    });
	
	// List로 table 만들어주는 함수
	function createTable(data){
		const table1 = document.getElementById('inventory-table1');
        const table2 = document.getElementById('inventory-table2');
        table1.innerHTML = '';
        table2.innerHTML = '';

        table1.innerHTML = `
            <thead>
                <tr>
                    <th rowspan="2" class = "mordan">번호</th>
                    <th class="mordan-dropdown" onclick="updateOrderBy('kindcode')">
    					${getKindCode(kindCode)} ${orderBy.includes('kindcode asc') ? '▲' : orderBy.includes('kindcode desc') ? '▼' : ''}
    					<div class="dropdown-content">
					       	<p onclick="selectListKindCode(null, event)">모두 보기</p>
					        <p onclick="selectListKindCode('4', event)">수능</p>
					        <p onclick="selectListKindCode('3', event)">고등</p>
					        <p onclick="selectListKindCode('2', event)">중등</p>
					        <p onclick="selectListKindCode('1', event)">초등</p>
					    </div>
					</th>
                    <th onclick="updateOrderBy('bookName')" rowspan="2" class = "mordan2">책 이름
                        ${orderBy.includes('bookName asc') ? '▲' : orderBy.includes('bookName desc') ? '▼' : ''}
                    </th>
                    <th onclick="updateOrderBy('price')" rowspan="2" class = "mordan2">가격
                        ${orderBy.includes('price asc') ? '▲' : orderBy.includes('price desc') ? '▼' : ''}
                    </th>
                    <th onclick="updateOrderBy('inventory')" rowspan="2" class = "mordan2">현재 재고
                        ${orderBy.includes('inventory asc') ? '▲' : orderBy.includes('inventory desc') ? '▼' : ''}
                    </th>
                    <th rowspan="2" class = "mordan">재고*가격</th>
                    <th onclick="updateOrderBy('inDate')" rowspan="2" class = "mordan2">최근 입고일
                        ${orderBy.includes('inDate asc') ? '▲' : orderBy.includes('inDate desc') ? '▼' : ''}
                    </th>
                    <th onclick="updateOrderBy('outDate')" rowspan="2" class = "mordan2">최근 출고일
                        ${orderBy.includes('outDate asc') ? '▲' : orderBy.includes('outDate desc') ? '▼' : ''}
                    </th>
                </tr>
            </thead>
            <tbody id="table-body1">
            </tbody>
        `;
        
        table2.innerHTML = `
            <thead>
                <tr>
                    <th rowspan="2" class = "mordan">번호</th>
                    <th rowspan = "2" class="mordan-dropdown" onclick="updateOrderBy('kindcode')">
    					${getKindCode(kindCode)} ${orderBy.includes('kindcode asc') ? '▲' : orderBy.includes('kindcode desc') ? '▼' : ''}
    					<div class="dropdown-content">
					       	<p onclick="selectListKindCode(null, event)">모두 보기</p>
					        <p onclick="selectListKindCode('4', event)">수능</p>
					        <p onclick="selectListKindCode('3', event)">고등</p>
					        <p onclick="selectListKindCode('2', event)">중등</p>
					        <p onclick="selectListKindCode('1', event)">초등</p>
					    </div>
					</th>
                    <th onclick="updateOrderBy('bookName')" rowspan="2" class = "mordan2">책 이름
                        ${orderBy.includes('bookName asc') ? '▲' : orderBy.includes('bookName desc') ? '▼' : ''}
                    </th>
                    <th onclick="updateOrderBy('price')" rowspan="2" class = "mordan2">가격
                        ${orderBy.includes('price asc') ? '▲' : orderBy.includes('price desc') ? '▼' : ''}
                    </th>
                    <th onclick="updateOrderBy('inventory')" rowspan="2" class = "mordan2">현재 재고
                        ${orderBy.includes('inventory asc') ? '▲' : orderBy.includes('inventory desc') ? '▼' : ''}
                    </th>
                    <th class="mordan" colspan="2">
                        <input type="date" id="startDate" />
                    </th>
                    <th class="mordan" colspan="2">
                        <input type="date" id="endDate" />
                    </th>
                </tr>
                <tr>
                    <th class = "sita">시작 재고</th>
                    <th class = "sita">입고 총합</th>
                    <th class = "sita">출고 총합</th>
                    <th class = "sita">예상 재고</th>
                </tr>
            </thead>
            <tbody id="table-body2">
            </tbody>
        `;

        const tbody1 = table1.querySelector('#table-body1');
        const tbody2 = table2.querySelector('#table-body2');
        tbody1.innerHTML = '';
        tbody2.innerHTML = '';
        const numberFormatter = new Intl.NumberFormat('ko-KR', { style: 'decimal', minimumFractionDigits: 0 });
        data.forEach((item, index) => {
            let row1 = document.createElement('tr');
            let row2 = document.createElement('tr');
            row1.innerHTML = `
                <td>${index + 1}</td>
                <td>${getKindCode(item.kindCode)}</td>
                <td>${item.bookName}</td>
                <td>${numberFormatter.format(item.price)}</td>
                <td><strong>${numberFormatter.format(item.inventory)}</strong></td>
                <td>${numberFormatter.format(item.inventory * item.price)}</td>
                <td>${item.inDate}</td>
                <td>${item.outDate}</td>
            `;

            row2.innerHTML = `
                <td>${index + 1}</td>
                <td>${getKindCode(item.kindCode)}</td>
                <td>${item.bookName}</td>
                <td>${numberFormatter.format(item.price)}</td>
                <td><strong>${numberFormatter.format(item.inventory)}</strong></td>
                <td>${numberFormatter.format(item.startInventory)}</td>
                <td>${numberFormatter.format(item.sumInInventory)}</td>
                <td>${numberFormatter.format(item.sumOutInventory)}</td>
                <td>${numberFormatter.format(item.startInventory + item.sumInInventory - item.sumOutInventory)}</td>
            `;

            tbody1.appendChild(row1);
            tbody2.appendChild(row2);
        });
	
		document.getElementById('startDate').value = rememberedStartDate;
		document.getElementById('endDate').value = rememberedEndDate;
	
		document.getElementById('startDate').addEventListener('change', function() {
			document.getElementById('search-form').dispatchEvent(new Event('submit'));
		});
		document.getElementById('endDate').addEventListener('change', function(){
			document.getElementById('search-form').dispatchEvent(new Event('submit'));
		})
	
	}
	document.getElementById('inventory-table2').style.display = 'none';
	
		// 드래그 가능하도록 설정
	let dragItem = document.querySelector("#search-form");
	let active = false;
	let currentX;
	let currentY;
	let initialX;
	let initialY;
	let xOffset = 0;
	let yOffset = 0;
	
	dragItem.addEventListener("mousedown", dragStart);
	document.addEventListener("mouseup", dragEnd);
	document.addEventListener("mousemove", drag);
	
	function dragStart(e) {
	    if (e.type === "touchstart") {
	        initialX = e.touches[0].clientX - xOffset;
	        initialY = e.touches[0].clientY - yOffset;
	    } else {
	        initialX = e.clientX - xOffset;
	        initialY = e.clientY - yOffset;
	    }
	
	    if (e.target === dragItem) {
	        active = true;
	    }
	}
	
	function dragEnd(e) {
	    initialX = currentX;
	    initialY = currentY;
	
	    active = false;
	}
	
	function drag(e) {
	    if (active) {
	      
	        e.preventDefault();
	      
	        if (e.type === "touchmove") {
	            currentX = e.touches[0].clientX - initialX;
	            currentY = e.touches[0].clientY - initialY;
	        } else {
	            currentX = e.clientX - initialX;
	            currentY = e.clientY - initialY;
	        }
	
	        xOffset = currentX;
	        yOffset = currentY;
	
	        setTranslate(currentX, currentY, dragItem);
	    }
	}
	
	function setTranslate(xPos, yPos, el) {
	    el.style.transform = "translate3d(" + xPos + "px, " + yPos + "px, 0)";
	}
	
	// CSV 문자열 생성 함수
	function generateCSV(data) {
	    let csv = '번호,분류,교재명,가격,현재 재고,재고*가격,최근 입고일,최근 출고일\n';
	    data.forEach((item, index) => {
	        csv += [
	            index + 1,
	            getKindCode(item.kindCode),
	            '"' + item.bookName.replace(/"/g, '""') + '"',
	            item.price,
	            item.inventory,
	            item.inventory * item.price,
	            item.inDate,
	            item.outDate
	        ].join(',') + '\n';
	    });
	    return csv;
	}

	// CSV 다운로드 함수
	function downloadCSV(csv, filename) {
	    const blob = new Blob(['\ufeff' + csv], { type: 'text/csv;charset=utf-8;' });
	    const link = document.createElement('a');
	    if (link.download !== undefined) {
	        const url = URL.createObjectURL(blob);
	        link.setAttribute('href', url);
	        link.setAttribute('download', filename);
	        link.style.visibility = 'hidden';
	        document.body.appendChild(link);
	        link.click();
	        document.body.removeChild(link);
	    }
	}

	// 다운로드 버튼 클릭 이벤트
	document.getElementById('downloadCSV').addEventListener('click', function() {
	    fetch('http://localhost:8080/Inventory/branch/initialList')
	    .then(response => response.json())
	    .then(data => {
	        const csv = generateCSV(data);
	        downloadCSV(csv, 'inventory_data.csv');
	    })
	    .catch(error => console.error('Error:', error));
	});
})

function getKindCode(kindCode) {
    switch (parseInt(kindCode, 10)) {
        case 1: return '초등';
        case 2: return '중등';
        case 3: return '고등';
        case 4: return '수능';
        default: return '분류';
    }
}