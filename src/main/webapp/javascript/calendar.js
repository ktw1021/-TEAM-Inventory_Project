function createCalendar(year, month) {
    const calendar = document.getElementById('calendar');

    // Create header
    const header = document.createElement('div');
    header.className = 'header';
    header.textContent = `${monthNames[month]} ${year}`;
    calendar.appendChild(header);

    // Create grid
    const grid = document.createElement('div');
    grid.className = 'grid';
    calendar.appendChild(grid);

    // Add day headers
    const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    daysOfWeek.forEach(day => {
        const cell = document.createElement('div');
        cell.className = 'cell';
        cell.textContent = day;
        grid.appendChild(cell);
    });

    // Calculate the first day of the month and the number of days in the month
    const firstDay = new Date(year, month, 1).getDay();
    const daysInMonth = new Date(year, month + 1, 0).getDate();

    // Create empty cells for days before the first day of the month
    for (let i = 0; i < firstDay; i++) {
        const cell = document.createElement('div');
        cell.className = 'cell empty';
        grid.appendChild(cell);
    }

    // Create cells for each day in the month
    for (let day = 1; day <= daysInMonth; day++) {
        const cell = document.createElement('a');
        cell.className = 'cell';
        cell.href = '#';
        cell.textContent = day;
        cell.onclick = () => showAlert(day);
        grid.appendChild(cell);
    }

    // Fill remaining cells to ensure a 5x7 grid
    const totalCells = 35; // 5 rows * 7 columns
    const remainingCells = totalCells - (firstDay + daysInMonth);
    for (let i = 0; i < remainingCells; i++) {
        const cell = document.createElement('div');
        cell.className = 'cell empty';
        grid.appendChild(cell);
    }
}

function showAlert(day) {
    alert('You clicked on day ' + day);
}

const monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
const year = 2024;
const month = 6; // July is month index 6 (0-based index)
createCalendar(year, month);
