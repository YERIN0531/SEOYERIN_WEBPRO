// JavaScript source code(intervalDay.js)
//Date라는 객체타입 안에다가, 프로토타입안에다가 intervalDay라는 함수 생성
//매개변수를 넣어야됨 - 밀리세컨 차이 구하기 위해 
Date.prototype.intervalDay = function (that) {
    if (this > that) { //크다는건 날짜가 더 나중이라는 말 
        intervalMili = this.getTime() - that.getTime();
    } else {
        intervalMili = that.getTime() - this.getTime();
    }
    var day = intervalMili / (1000 * 60 * 60 * 24);
    return Math.trunc(day);
};
