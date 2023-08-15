Return-Path: <virtio-comment-return-7133-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F00C0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:47:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D5CE92AEDE
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:47:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA16698638A
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:47:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C26C6984035; Tue, 15 Aug 2023 07:47:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 642679863FE;
	Tue, 15 Aug 2023 07:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObrTZ9JyoVvvnyWxpsCJGPJwCBef1vpJ9kb/84JMvNKB0hLErf+2zIrkSq0WFCo8AhNP7yQjan0n/6Hr/RdFdSi1F4YJCxAkfOhJfm8VVuDMQLXnDbzOEh2bocfMJ9wMjwBzWikzmG+z6fH9WRrhWMaphXMKp9KOu4nh4h1UTQ6s7Kwxnd8dSVXHH1cUJTwOKEYmKFl2SgUSvvW1rdZ4DhekK0L/RTlWb/jIejds8O/YLW5/ttODTs5rJS514z8soE+zFe4X89AFuxrWreLGrE8JY02+adBamMMwNPR7kL4o3ozEF4bpnCisUCREgMTXS1rz9bTgo0vpJcpwH1tAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO19lH8uzOdWZX3YGKsC7XEpQ4fTUqt519tIecaL468=;
 b=nw7UAh0340Zp0hpF+r6WQT3LAGEq5BunpPwDNplardk1FzoBM+hb+55ntM5z43yM+zS6Wn0pt8BQF6GRMLlz9wylbUIW1gQOEHVSFjVxY3ik+pt75SpjuC2KcS8DMi3+F4x8+ok+hyU8LjWjTW8oZ45w+btMZGUtf+PmN1x0/TOVOxTSSOwtcYPxiWH71IMsbjzoQutCzHRLvPBjg0FJ+I/vwb/+HLStRNdSqqzB/8jR5+RQeNGKj7jC0kPMoicKGjIcRel9dM7xCy2lAG0arD0hq3bhmu03ajqTFIL8OXMM88yv+fpVmcIjHQljTAFw3jJsaCDG6qJXLeBAMQ3X9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <hengqi@linux.alibaba.com>,
	<david.edmondson@oracle.com>, <xuanzhuo@linux.alibaba.com>,
	<sburla@marvell.com>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 15 Aug 2023 10:45:53 +0300
Message-ID: <20230815074600.473933-1-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d751cc-9484-45c2-ec31-08db9d63bac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jUyklHTLWb0PQ17UKKZGIyweJK/flq/ci2LFOioe227SfXyuG3Rji8qa1Uny6DbMk9ZtuFOx7HlrUnm0bmaNmq65ZsK7CP8715CbdCrG31JwoHWNUQJBHQ3KZwdShCh4reWZpAcUaVaBNGgIK09GgvG10DucYdfVWYFTjoABX6g5iTj5dquOHf4OSKedDnP54fU8tLuv+yfU54WHYNmXpxAClzb9EMr9uNmU6y56riUdFeSk7x++BNUv2wt+MJT7TjtY+WPbU1vUhHzKyaYHGvbuJNetLRP0MmVK8adUCCDyj2ZBohbi0HYunjLFPoUc32LkfkEOeE0f/mkmEtc+R2NYXN7ydsq5Q8HpeTUebDl4da5XpNDqFCRr6HJDW1u0WOSylcJeDB2/GX7vMSxRfh8dLvotyFb9vqo+DBbMtZgW2FxJVm7BCHfTyZcyFf0TG3ZmT8VorrEguYNGAR3KYIwZFxFgcoWQ7DGmL5npWOIQzRjTw0Li+0LaIp7qIOyfbpl9ZWcPp6fOCcbQIQkg5mZu8+eI9BmCs/p6xa/szC2prYyodsUxPWVQwjOfVOV2hi6OHUe/kfCrikzNmwBTzrKM25KtvRqpvLHTOtOzlS+P2wOffnFW2cHE+dPJEa7z7QFwXryomr12+JBv4C1IWWgHPlsWEPSJoWWX3yCD49/l11oUIe9B1nBtYqbbUuNvnSGTSuudw/w+pQ1Dup4FZBYmh7+DA4ciLHtsO1kR+wLX9/zzTlPYupiPGN5GbVXw
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(186006)(1800799006)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(70206006)(70586007)(316002)(110136005)(41300700001)(54906003)(16526019)(8936002)(8676002)(5660300002)(478600001)(2906002)(6666004)(1076003)(107886003)(336012)(426003)(83380400001)(26005)(2616005)(36860700001)(47076005)(4326008)(356005)(7636003)(82740400003)(40480700001)(86362001)(36756003)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 07:46:26.3172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d751cc-9484-45c2-ec31-08db9d63bac8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
Subject: [virtio-comment] [PATCH requirements v4 0/7] virtio net requirements for 1.4

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

---
note:
This week update is late as I was unwell for several days, but managed
to cover all comments from Heng, David, Satananda.
We must close flow filters requirements this week to take to spec
drafting design phase.

---
changelog:
v3->v4:
- receive flow filters requirements undergo major updates to take to
  spec draft level.
- Addressed comments from Xuan, Heng, David, Satananda.
- Refined wordings in rest of the requirements
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

 net-workstream/features-1.4.md | 375 +++++++++++++++++++++++++++++++++
 1 file changed, 375 insertions(+)
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

