Return-Path: <virtio-comment-return-6884-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5305EB64DD
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 33FA7190903
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 29B219866C6
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1FD4A9866B5; Mon, 24 Jul 2023 03:35:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 04704986429;
	Mon, 24 Jul 2023 03:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+auZUTPX0pSLHuiAaNhxtaJdXpPTO5j06uELSZp+uTScLzoACFioomGb8vffGZk89XPJs+Twb35ftFKC9S4jnOYRHaFDUi8U9ye7g6aKISea4h5hy37afi+hbasZH72hLEJ+VIJbRHiMLzoJTzT5z904uYgdcuQ1VI5iNrhWJ2y9Qtx2cbND3vHeinOZLwS/9yzrAHGRWSWwgV1AVd3dOAVBVxRfu5GkG/lvsLIWjJZgPRvctputv57/nOSQCRAxFqkZhRUghhjUB8Crj+6Wt3mvruJdVEIQ4PHoiKOvQbPWL0mYaZxqw0jFKAWNkKy3a2heIw21kTiLRsMj5a4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MvEZJJbttDKwQIQYmWtGdWaYLQgJBGmH+rGKvZld38=;
 b=JW5e+FUShSjrZzFJW8+gKL+9DVYH8kMwNJNijI6p3VxZQlCMEEHtKusy4HswMW24ZyPY0qW/329A1OsEa7FO8UugUvR3W7wQs8FeFd8bL0MdtB2k0UHWOrdKyYv7TM0UR7G5UP+URWVw37tpcGgQ9tU/degZHoLRLI822HxaGfPg04/3X1qjOWrnAFG1lPa3UHARdd2GTX5Hr6uzBgC1RTXI8tOyfrp6+kLmhVZzjBNHtPdcrFjC0t2lSLDg41EZ5Jvxq/HW8vEtj1SVB/mdxDQ3XkH5eypfQ8781+UHXPkfY6tAIFvWCsTOR8kolwLvYXsP2glrxEnKTc5YRq1myQ==
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
CC: <shahafs@nvidia.com>, <hengqi@linux.alibaba.com>,
	<virtio@lists.oasis-open.org>, Parav Pandit <parav@nvidia.com>
Date: Mon, 24 Jul 2023 06:34:14 +0300
Message-ID: <20230724033421.249893-1-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT069:EE_|CH0PR12MB5330:EE_
X-MS-Office365-Filtering-Correlation-Id: da718962-7c46-4829-3cf7-08db8bf6ed04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HPJeT4MHQSZqAFZM015yZkusCQQRSUiP+Tr3EJnbsyBe0yALQ5ZQsURTjc+64MWcPHTLJfurEA2/wY7cdKzLiuM7U5sm4gNEnLUQY4Kc3KYXFzGmjoX3SChuRo3U4xSU0cxKVLkMaMJ3P25iNFzJawCAJai5C5LW5N1lZe0TOTPvkeQSGFwJ536U64iVYztzzmydQBjKpeaYe8qqnt2Df/J7NSXhj1ESNont0PTH7QFSZVL8jwGjc2uVNvtVD9cQtAz0BMaTwFLSGRLyPp2xIkRjFFuwCJHsx5N5NY0XLQCNIW68PJxM2/1vDqG57wWqfBsAm19PykqOM2FhEObjTGzFTuP8TUkBb/oH+VKcfQT4GhCFtcmG5CNalUGLXjAqJ+ABt8TkGYDMU0sCZDwCr/j9Ei36miKbgLnj6c3LwfXyIIiJzFOlU9dlqxWTB6gAvZ9kKqss6ULw/qFC3Qs2cc1CQ4xsxPyuEEWcbUdSChMao+oMGdWWV7R4VB0ztDqM1im+JO5gr0e8iqyGSLjlGiga80NJI+lAV0hBsBfipkkT2wSv9YO8J9xMraBiORYfhmIZjsYFbRH5u7q76TsX1Kaky6hT/GivAc827F/ZB+JzyP6gdCK71hlFKic5bNxb9e2WdOpT0MQf8X9RtJxRJp8vCWKQti8piExPuqTDR5RC2aMW+UffHBzCBiiHhKcAGN8v1Wtgdyn/WVnNKGPN7CIw7yOM0dntOBu6LSROQpY7i3aBGzUJnSIvO3trr7GP
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(40460700003)(7636003)(356005)(40480700001)(36860700001)(36756003)(107886003)(426003)(2616005)(47076005)(83380400001)(16526019)(8676002)(8936002)(5660300002)(54906003)(478600001)(4326008)(316002)(6916009)(70586007)(70206006)(41300700001)(26005)(186003)(336012)(1076003)(6666004)(2906002)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 03:34:45.6813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da718962-7c46-4829-3cf7-08db8bf6ed04
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5330
Subject: [virtio-comment] [PATCH requirements 0/7]  virtio net new features requirements

Hi All,

This document captures the virtio net device requirements for the upcoming
release 1.4 that some of us are currently working on.

This is live document to be updated in coming time and work towards it for
its design which can result in a draft specification.

The objectives are:
1. to consider these requirements in introducing new features
listed in the document and otherwise and work towards the interface 
design followed by drafting the specification changes.

2. Define practical list of requirements that can be achieved in 1.4
timeframe incrementally and also have the ability to implement them.

Please review mainly patch 5 at the priority.

Receive flow filters is the first item apart from counters to complete
in this iteration to start drafting the design spec.
Rest of the requirements are largly untouched other than Stefan's
comment.

TODO:
1. Some more refinement needed for rx low latency and header data split
   requirements.
2. counters requirements not yet up to date to match the discussion
---
changelog:
v2->v3:
- addressed comments from Stefan for tx low latency and notification
- redrafted the requirements to use rearm term and avoid queue enable
  confusion for notification
- addressed all comments and refined receive flow filters requirements to
  take to design level
v1->v2:
- major update of receive flow filter requirements updated based on last
  two design discussions in community and offline research
- examples added
- link to use case and design goal added
- control and operation side requirements split
- more verbose
v0->v1:
- addressed comments from Heng Li
- addressed few (not all) comments from Michael
- per patch changelog 


Parav Pandit (7):
  net-features: Add requirements document for release 1.4
  net-features: Add low latency transmit queue requirements
  net-features: Add low latency receive queue requirements
  net-features: Add notification coalescing requirements
  net-features: Add n-tuple receive flow filters requirements
  net-features: Add packet timestamp requirements
  net-features: Add header data split requirements

 net-workstream/features-1.4.md | 321 +++++++++++++++++++++++++++++++++
 1 file changed, 321 insertions(+)
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

