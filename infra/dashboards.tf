resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.candidate_id
## Jim; seriously! we can use any word here.. How cool is that?
  dashboard_body = <<DASHBOARD
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_id}",
            "cart_count.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total number of carts"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_id}",
            "cart_sum.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total sum in carts"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_id}",
            "checkout.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total number of checkouts"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_id}",
            "checkout_latency.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Checkout latency"
      }
    },
  ]
}
DASHBOARD
}