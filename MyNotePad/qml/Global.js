var glob = {
    weekDay: [
        "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
    ],
    init: function() {
        var td = new Date();
        todayLab.text = td.getDate();
        tadayDetailLab.text = (td.getMonth() + 1) + " / " + todayLab.text + "\n"
                              + this.getWeekString(td.getDay())

    },

    changeMonth: function(def) {
        var currendMonth = grid.month + def;
        if (currendMonth > 11)
        {
            grid.year += 1;
            grid.month = Calendar.January;
        }
        else if (currendMonth < 0)
        {
            grid.year -= 1;
            grid.month = Calendar.November;
        }
        else
        {
            grid.month = currendMonth;
        }
    },

    getWeekString: function(idx) {
        return this.weekDay[idx];
    }
}
