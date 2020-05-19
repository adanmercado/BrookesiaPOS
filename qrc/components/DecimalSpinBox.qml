import QtQuick 2.14
import QtQuick.Controls 2.14

SpinBox{
    id: decimalSpinbox
    stepSize: realStepSize *factor
    value: realValue *factor
    to : realTo *factor
    from : realFrom *factor

    property int decimals: 2
    property real realValue: 0.0
    property real realFrom: 0.0
    property real realTo: 10000.0
    property real realStepSize: 0.1


    property real factor: Math.pow(10, decimals)

    validator: DoubleValidator {
        bottom: Math.min(decimalSpinbox.from, decimalSpinbox.to) * decimalSpinbox.factor
        top:  Math.max(decimalSpinbox.from, decimalSpinbox.to) * decimalSpinbox.factor
    }

    textFromValue: function(value, locale) {
        return parseFloat(value * 1.0 / factor).toFixed(decimals);
    }

}
