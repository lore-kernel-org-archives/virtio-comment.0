Return-Path: <virtio-comment-return-6075-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEB3C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0EE7B190902
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E72139867C9
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D67E99867C5; Thu,  1 Jun 2023 22:03:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C21D69867C4;
	Thu,  1 Jun 2023 22:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cz7ELwAKWwYDunxy7ABA4B+E5dFwoAxZZg4tmCwAbkfNNp+O8fmwaXUzyx+IL0pKuBrLBiEdwPRrhZ7K2D7V8FUsxG/1v0tmpNLOGda/+N0SvqQyEKFA44oLWSzV/VpaxPR4/1JNcRngnfOYq9rzMRwm2eCVtqxHtDE2U9NTr2Q03CTFaLNnd2jF4NdKPpaP77/dvKMA8zsEBWiJBKgf/NLNp3DHr/C9s7J5FbIM1BYrWiR+BtZBuOwjZQwP1ZkeZMvjJou2INlTZHjshZvJ08TrlH9ySZs/+XKKHbINGG+DhEvXkgeP0VNxMEzOStpwwf9fnTZy5pLxwFcu1i6PEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWt7pX+OynIrx3etHs8ckh1UYqWqvwDD8vRl+nr5CI4=;
 b=NcrMXDSzO9rpq3pZGxQJmAhfd6WwWcwpDs0HJHPyAuHWyniNR1+PvhaEtl/cx16lEqf//Mc5La3//Jxi/z8PaUfTJPdtjm0nU+XTJmKY8Me5M3bkO7TxRrKW1+efVlIa5BQwU3utJBn2H+BjB2XQovGXVRobkYZR8E6Hk5ToAVkh3BdaIp0uvr2h8C+1Cx/VnL+ownUadYYe6x/3WJikF58X9IpcpgVapbo6hHfsK60ov3t8Qn4/KjYzruJN9QBNgbJC9bR4a0uj0YmZ4REZPEQxzVIROTyctLRHN0xRO5qBFTv+6hkez7pmFXL8jVQebgmiCs/7Qm5h+KFSIVW5Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 2 Jun 2023 01:02:58 +0300
Message-ID: <20230601220305.587034-1-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT068:EE_|SN7PR12MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 31eb4c35-b6e0-4099-0aa9-08db62ec0857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cH/WffNA4/+2hjcDOlSOfGcY2dKKqNpowK4vfFIgrORpIBzDZBHMe3rvfFvOceP2BPFxCtTpjvxZ16ykqio5D0jnYm7hKuOboVPVlvecoTj0WY95l03kx1cI4uZLXjn1Y+t7G+YrPzLEK1SWx2zVgIoJIpapM9NzuTbG//o6cx2r6ZSQx0UuVfjLx7h8W1gYZtcoNOQCI+sK6KwoJ3m8hCO/iaJ8ne6gKyOPXoTdycd1GvFVRiJ2a8+JxKDk16oiiJjx4iWXmhvDk9Wdhq8yd2rFOODIfKJPoplt9VSH0GRxaLJajO8GQYLIKZxBcz3drIkTqLyNNPK2IebkpBhslq76hOunklRXyWh9MRthSYXz/d6bWO77Y5IEKlKhWDUWwtC2553t1mIB+orkmnw/nD6C5341VygUHUl+J+678uESJezPxpPMu4Ldwl1SIWRQPuuT8J0dIk6NnlYdNcIDEQLR5zE1dRMsGKIaaRbKu3jEB4z59WSuQt8sDLQCPwSLAKZFEmdtTbu7/LKzOPu0O5b9rzz9Ii1bsdjSxWiVEdQcrCh1AjEUed8cnZp8L3BWanWqKEv8zc0dWReFRqA0/zFwCF0Aq/an/GILKOC4ZzlLBBMrer11psZVB3H3Uddgf5TVyt/fr7ub2PYnJNkP9vj0dtWE12XU2CYVfPQXZ5ZUq2FQhQwkinkvdwnrKfeeYeFltUlHESccGhpHQdPXRrwMJYi75UWo9iPEyc0mBbQ3MB/5FqnpuXcpSqY72qeU
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(36756003)(356005)(40480700001)(7636003)(86362001)(82740400003)(82310400005)(40460700003)(8676002)(41300700001)(107886003)(8936002)(26005)(1076003)(5660300002)(54906003)(16526019)(83380400001)(426003)(2616005)(186003)(6666004)(336012)(47076005)(70586007)(450100002)(316002)(478600001)(36860700001)(6916009)(2906002)(4326008)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 22:03:29.3845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31eb4c35-b6e0-4099-0aa9-08db62ec0857
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7935
Subject: [virtio-comment] [PATCH requirements 0/7] virtio net new features requirements

Hi All,

This document captures the virtio net device requirements for the upcoming
release 1.4 that some of us are currently working on.

I would like to capture if there are any other requirements linked to the
features captured in this document to consider in the interface design.

The objectives are:
1. to consider these requirements in introducing new features
listed in the document and work towards the interface design followed
by drafting the specification changes.

2. Define practical list of requirements that can be achieved in 1.4
timeframe incrementally and also have the ability to implement them.

This is not a specification document. It is a pre-work document
that helps to understand the draft specification addressing these
requirements.

Please review.

Parav Pandit (7):
  net-features: Add requirements document for release 1.4
  net-features: Add low latency transmit queue requirements
  net-features: Add low latency receive queue requirements
  net-features: Add notification coalescing requirements
  net-features: Add n-tuple receive flow steering requirements
  net-features: Add packet timestamp requirements
  net-features: Add header data split requirements

 net-workstream/features-1.4.md | 224 +++++++++++++++++++++++++++++++++
 1 file changed, 224 insertions(+)
 create mode 100644 net-workstream/features-1.4.md

-- 
2.26.2


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

