// JavaScript source code(intervalDay.js)
//Date��� ��üŸ�� �ȿ��ٰ�, ������Ÿ�Ծȿ��ٰ� intervalDay��� �Լ� ����
//�Ű������� �־�ߵ� - �и����� ���� ���ϱ� ���� 
Date.prototype.intervalDay = function (that) {
    if (this > that) { //ũ�ٴ°� ��¥�� �� �����̶�� �� 
        intervalMili = this.getTime() - that.getTime();
    } else {
        intervalMili = that.getTime() - this.getTime();
    }
    var day = intervalMili / (1000 * 60 * 60 * 24);
    return Math.trunc(day);
};
