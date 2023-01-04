# Stateful Inspection for denying access to a domain
resource "aws_networkfirewall_rule_group" "domain_rule_group" {
  capacity = 100
  name     = "domain-allow-anfw-centralized"
  type     = "STATEFUL"
  rule_group {
    rules_source {
      rules_source_list {
        generated_rules_type = "ALLOWLIST"
        target_types         = ["HTTP_HOST"]
        targets              = [".google.com"]
      }
    }
  }

  tags = {
    Tag1 = "domain-allow-anfw-centralized"
  }
}

# Stateful Inspection for permitting packets from a source IP address
resource "aws_networkfirewall_rule_group" "icmp_alert" {
  capacity    = 100
  description = "Permits ICMP traffic from source"
  name        = "icmp_alert_anfw"
  type        = "STATEFUL"
  rule_group {
    rules_source {
        stateful_rule {
        action = "PASS"
          header {
            destination      = "ANY"
            destination_port = "ANY"
            protocol         = "ICMP"
            direction        = "ANY"
            source_port      = "ANY"
            source           = "ANY"
          }
          rule_option {
            keyword = "sid:1"
          }
        }
      }
    }
    tags = {
    Name = "permit ICMP from source"
  }
}

resource "aws_networkfirewall_firewall_policy" "inspection-firewall-policy" {
  name = "inspection-firewall-policy-anfw"

  firewall_policy {
    stateless_default_actions          = ["aws:forward_to_sfe"]
    stateless_fragment_default_actions = ["aws:drop"]
    stateless_rule_group_reference {
      priority     = 1
      resource_arn = aws_networkfirewall_rule_group.domain_rule_group.arn
    }
    stateless_rule_group_reference {
      priority     = 1
      resource_arn = aws_networkfirewall_rule_group.icmp_alert.arn
    }
  }

  tags = {
    Tag = "inspection-firewall-policy-anfw"
  }
}

resource "aws_networkfirewall_firewall" "inspection-firewall-anfw" {
  name                = "inspection-firewall-anfw"
  firewall_policy_arn = aws_networkfirewall_firewall_policy.inspection-firewall-policy.arn
  vpc_id              = aws_vpc.net_fw_poc_vpc["inspection-vpc"].id
   subnet_mapping {
    subnet_id = aws_subnet.inspection-subnets["inspection-fw-az-a-ep"].id
  }
  subnet_mapping {
    subnet_id = aws_subnet.inspection-subnets["inspection-fw-az-b-ep"].id
 }
  tags                = {
    Tag              = "inspection-firewall-anfw"
  }
}