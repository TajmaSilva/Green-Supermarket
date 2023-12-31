<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PayPal Checkout - JSP</title>
    <!-- Add the PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id="PLease add your PaypalSandbox ID"></script>
</head>
<body>

    <h1>PayPal Checkout</h1>

    <div id="paypal-button-container"></div>

    <!-- Add the PayPal Smart Payment Buttons script -->
    <script>
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '10.00', // Replace with your actual amount
                            currency_code: 'USD'
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    // Handle the successful payment
                    alert('Transaction completed by ' + details.payer.name.given_name);
                    // You can redirect the user to a success page or handle further processing here
                });
            }
        }).render('#paypal-button-container');
    </script>

</body>
</html>
