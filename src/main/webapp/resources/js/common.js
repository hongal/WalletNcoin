function timestampToDateTime(timestamp) {
	var date = new Date(timestamp);

	var chgTimestamp = date.getFullYear().toString() + "-"
			+ addZero((date.getMonth() + 1).toString()) + "-"
			+ addZero(date.getDate().toString()) + " "
			+ addZero(date.getHours().toString()) + ":"
			+ addZero(date.getMinutes().toString()) + ":"
			+ addZero(date.getSeconds().toString());

	return chgTimestamp;
}

function addZero(data) {
	return (data < 10) ? "0" + data : data;
}

//================================================================================
//- 숫자에 3자리마다 ','처리, 소수 내림 올림 반올림 처리
//- args)
//getNumber   : [string || integer || float]   => 변환 할 수 (필수)
//setComma    : ['Y' || 'N']                   => 3자리마다 ',' 입력여부 (디폴트: 'Y')
//fixedOption : ['floor' || 'ceil' || 'round'] => 소수 내림, 올림, 반올림 처리 (디폴트: 반올림)
//fixedCnt    : [integer]                      => 소수 표현할 자리수 (-1 : 제한하지 않고 원래대로)
//- ex)
//Number_Format(getNumber, setComma, fixedOption, fixedCnt);
//Number_Format(getNumber, setComma, fixedCnt);
//Number_Format(getNumber, setComma);
//Number_Format(getNumber, fixedOption, fixedCnt);
//Number_Format(getNumber, fixedCnt);
//Number_Format(getNumber);
//================================================================================
function Number_Format(getNumber, option1, option2, option3) {

    option1 = option1 || option1 + 0 == option1 ? option1 : 'Y';
    option2 = option2 || option2 + 0 == option2 ? option2 : 'round';
    option3 = option3 || option3 + 0 == option3 ? option3 : -1;

    var setComma = option1 == 'Y' || option1 == 'N'
        ? option1
        : 'Y';

    var fixedOption = option1 == 'floor' || option1 == 'ceil' || option1 == 'round'
        ? option1
        : option2 == 'floor' || option2 == 'ceil' || option2 == 'round'
            ? option2
            : 'round';

    var fixedCnt = option1 + 0 == option1
        ? option1
        : option2 + 0 == option2
            ? option2
            : option3;

    // string or integer or float => string
    var numberString = getNumber + 0 == getNumber
        ? getNumber.toString()
        : getNumber.replace(/[^0-9\.]/g, '');

    // positive or negative
    var sign = parseInt(numberString) < 0
        ? '-'
        : '';

    // decimal part
    var decimalPartString = "";
    var integerPartAdd = 0;
    if (numberString.split('.').length >= 2) {
        if (fixedCnt < 0) {
            decimalPartString = '.' + numberString.split('.')[1];
        }
        else if (fixedCnt == 0) {
            if (fixedOption == 'ceil') {
                integerPartAdd = Math.ceil(parseFloat('0.' + numberString.split('.')[1]));
            }
            else if (fixedOption == 'floor') {
                integerPartAdd = Math.floor(parseFloat('0.' + numberString.split('.')[1]));
            }
            else {
                integerPartAdd = Math.round(parseFloat('0.' + numberString.split('.')[1]));
            }
        }
        else {
            if (fixedOption == 'ceil') {
                decimalPartString = Math.ceil(numberString.split('.')[1].substr(0, fixedCnt + 1) / 10);
            }
            else if (fixedOption == 'floor') {
                decimalPartString = numberString.split('.')[1].substr(0, fixedCnt);
            }
            else {
                decimalPartString = Math.round(numberString.split('.')[1].substr(0, fixedCnt + 1) / 10);
            }

            decimalPartString = parseFloat('0.' + decimalPartString).toFixed(fixedCnt).toString().substr(1);
        }
    }

    // integer part
    var integerPartString = (numberString.split('.').length >= 2)
        ? numberString.split('.')[0].replace(/[^0-9]/g, '')
        : numberString.replace(/[^0-9]/g, '');

    if (integerPartAdd > 0) {
        if (integerPartString.length <= 15) {
            integerPartString = (parseFloat(integerPartString) + integerPartAdd).toString();
        }
        else {
            var integerPartAdd = parseFloat(integerPartString.substr(15)) + integerPartAdd;

            if (integerPartAdd < 10) {
                integerPartString = integerPartString.substr(0, 15) + integerPartAdd.toString();
            }
            else {
                integerPartString = (parseFloat(integerPartString.substr(0, 15)) + 1).toString() + (integerPartAdd - 10).toString();
            }
        }
    }

    if (setComma == 'Y') {
        var ReN = /(-?[0-9]+)([0-9]{3})/;

        while (ReN.test(integerPartString)) {
            integerPartString = integerPartString.replace(ReN, "$1,$2");
        }
    }

    return sign + integerPartString + decimalPartString;
}