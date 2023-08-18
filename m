Return-Path: <virtio-comment-return-7199-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CEBC001DE
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:37:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A48DA707A0
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 697FA986687
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5EDB6986447; Fri, 18 Aug 2023 04:36:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D74549865E9;
	Fri, 18 Aug 2023 04:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1gBAm8WSCZiIpfu3nC0eXaA1cBZkChxm8XQTymL35WV8JSlVFb24ubJHuYkaqutc8bqNRSE/1R8/dp/MtLKUZ5OjJY9b0Zhct5q+Jf0At7DjDl9XCalNc3H1JRsCU0adSF4HcyIZS/k5UCV+UAjuCH15y7w9WmokYvDdz5UU0m3mHwiR7RoRDnoTXtD7PtiE3CdJ89D9uyZzFRP+1sT1XCWNL2kkAtYRwOv8hFy4WQiOEGQYMlBiZR9/gli56MouVNj1N0H2ljRyVJOY0VNPEgYCpYR4P+roWInzVkSltfYx3wWvWw+HnW1QNsLZ+smJnFqGPPqUlrNmuxNWghk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwcEGxCjvQ6iNHeXfgzSNEmxJSIbeEzI6csNxQhEuFw=;
 b=mU8ZyX8DeA1sar3/8G6+6DGQz1TXAAoHPd0NH31QClmZry9g/Ex7ed+f+pXhlyPae+QYKW7bclkFVCEWzVSTt1cdhnSsBVPbTDXXgFPjOILTAfzYGZwodty/bOSoJO9gVw9wJiAYZSEfer1lYvje7RQz1XOXSVaoLjgc5PwaOuH8zW9tmiGtJKXECQuho83dcd/0ZDGmS9oh8ZUxJeY0XQbDxgqXqmWdO3ftzBvTfX3FSfkcuCniKVxzMYbJki9gBSIs2Gv8vHTL8o45VlP8X2wuOuszNc+X2pX4cX2x8ofpXcZHx5JUAS53dJFITcDRMfAC4uRe69NBRotu1LwY/g==
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
To: <virtio-comment@lists.oasis-open.org>, <hengqi@linux.alibaba.com>,
	<david.edmondson@oracle.com>, <xuanzhuo@linux.alibaba.com>,
	<sburla@marvell.com>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 18 Aug 2023 07:35:57 +0300
Message-ID: <20230818043557.496964-8-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230818043557.496964-1-parav@nvidia.com>
References: <20230818043557.496964-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|PH0PR12MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc32819-a7d8-4e9a-c90b-08db9fa4b2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZxxxNFRSRP+LhP2BKLMItNf/KMDKbUGWq8zSZUBFA1qC5Ztv4kelwofeXSctVbLYo2sUPbrVIVB6wmPKWm7748tF8qin7IRSmh9FBHLKX+ZhE9Vzkjykx93CLagQKiUZ2rm5Op7ulIyNRAjgt4tojuV4SViH0uW/f6c6hkhMJxnoGD7dyzB86UXF22kW4341Gz+Wl6wHycTo/MzOJGP2C5rORsQDXJ0gM3t81/4vp0Bu8Qw+dfk4nSlZTcN2nwH35HpzTNPUb96zSHAITzvy0zUGx61wAFhbA3CEYexIvhebJHNBPsju1nGwDb5kutD3GocpYhbMZ5a0z8C8Lbpegrv+J64wyKLOzBu7jA2QKmuH+hfrM0har1DREcF4tv2cHPtX3OMkd6IGw1ZpAUULZeI7b0+vGCQ2G9nvthae7WD6rgYV2k4uaqO/+kYfQZr2k8vHEWSw2USVCPl+i3C+BXIgrGrzVXgPs6PCIkoNTJiAB9AEzmPI48M9PqxumBt/xdOTHQxOIbdLsPLQAG/m/TEZVEuM6jCcOdvSvS5UxGqMgQMsWwBGejKO81ybP7+B9FwLtC/6KBw7l2Ow/yyl1Z9DajjNYNl1LyRco16GoN0cy7sbG6g/np/mYrb9K2CiyeiMTSdPMz/vbaOR4yVSDvRgjDUCscOnfIEJLADo7pwIvSGs0HdDsCtrLFcgTp8KusrPp2Y+ZjnLjFzCRhi5A56/55tHn9InaR4wekr/zE230rGsgV+Uh2oRSumOCIe9
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(86362001)(36756003)(82740400003)(356005)(7636003)(40480700001)(478600001)(5660300002)(107886003)(2616005)(110136005)(16526019)(70206006)(70586007)(6666004)(26005)(54906003)(316002)(1076003)(4326008)(8676002)(8936002)(41300700001)(40460700003)(47076005)(336012)(36860700001)(2906002)(426003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 04:36:32.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc32819-a7d8-4e9a-c90b-08db9fa4b2f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8821
Subject: [virtio-comment] [PATCH requirements v5 7/7] net-features: Add header data split requirements

Add header data split requirements for the receive packets.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 31aa587..7a56fa8 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -11,6 +11,7 @@ together is desired while updating the virtio net interface.
 3. Virtqueue notification coalescing re-arming support
 4  Virtqueue receive flow filters (RFF)
 5. Device timestamp for tx and rx packets
+6. Header data split for the receive virtqueue
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -368,3 +369,15 @@ c. If/when virtio switch object is implemented, support ingress/egress flow
    point of reception from the network.
 3. The device should provide a receive packet timestamp in a single DMA
    transaction along with the rest of the receive completion fields.
+
+## 3.6 Header data split for the receive virtqueue
+1. The device should be able to DMA the packet header and data to two different
+   memory locations, this enables driver and networking stack to perform zero
+   copy to application buffer(s).
+2. The driver should be able to configure maximum header buffer size per
+   virtqueue.
+3. The header buffer to be in a physically contiguous memory per virtqueue
+4. The device should be able to indicate header data split in the receive
+   completion.
+5. The device should be able to zero pad the header buffer when the received
+   header is shorter than cpu cache line size.
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

