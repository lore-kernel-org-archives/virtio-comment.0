Return-Path: <virtio-comment-return-6888-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431D1C001B0
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 152F637113
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1078986857
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E369298650C; Mon, 24 Jul 2023 03:35:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 09D9E9864BD;
	Mon, 24 Jul 2023 03:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaO9iRrBeBtmdjdcd0cWp04ty1d2d6tL9G3/+5nrzCHNY19B5kbo1n8ZtCszzHER0BA2d4LBbqPc+gBa/puJvH8bYT78oY42nnOJzFmL6dK0Q5COxR1RS7P2KC0GK0mWOQypdBAc3PuacUoiFJRkFtk0AlJPUBSzeLy/enQ1GbXyzy+OuVrBNEw48pbK95j3pl8rwxiP7RVU4Cp3DDOeLA7yUgvtgb4caYD0xtj+PejZbfMSw8yr56QWJWwmFE6FkxOgOpOzVae3Y1QGdbz/r4ztb64lQKXBabXwvQ8pUQA/GVKcY462av+U3081NesuxnUBPHlSnJVxSHBK6fYQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNTzgFkKOt28UxEYJPWFkZIs+AQtxFMw73y6FN903gs=;
 b=gMkXwDLwPyMOq4OA2n4e5CkmbdH3TCEwEQ2JOYAxNLRvrA/XK3m+d/BrsuKRreMic9tUAFSwKNsbRzA6qVeqiimZ+sAYPBdO0IyFODd88RSF5V/JB2ATVOQEFj/KI+dfQOlc02K0yiiQw/sv5upCHwsrGce1AM7cFQ+uerig3miDXzu2RIdUxg7ZbI+3UnTshYG1gLfWmJl9Oi3fbRCEm/RvOMM8T9UfiTnacQzWGyyF94AFexNVceqLqtJmaR1VZNHYpdTIc+DABsOVB/Ei+7pCa5N2uOsgpQcSkGmh0F6QcWGi4QuUXE7dNr6rxGLLN38kJ7LIsZ2q6wlOQRlaHg==
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
Date: Mon, 24 Jul 2023 06:34:21 +0300
Message-ID: <20230724033421.249893-8-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230724033421.249893-1-parav@nvidia.com>
References: <20230724033421.249893-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT055:EE_|MW3PR12MB4555:EE_
X-MS-Office365-Filtering-Correlation-Id: 256ef733-eeb5-40f4-e66a-08db8bf6f25e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+7iO7WAVqMsE/EYw5xcWm/wTn2mDLJfhvRK17p4dfg0pHQ+IlNmJ+HxFbRk2Dsrq0uwCn6NLUFA3JxEgHpVCJEdm8QGeEuvH+cI5Y4TwEUZY75XCL3kxJjZYO1B5QFovESnc1gdgel+UEijAg0kj0bZwWlns7Qn5klUM68VI6hQ+H3rCag8EHD+ggbiMUiB13AIUIfyi3BkLFNzk9ztgDDGWizpEKrLiGuyfNCYxQmYkmK8PyUygv0Wdgswr4mKGj+BJcoPoHfmSw4ZSmgnNP08CZVm/j+cu8QIhNuBnKGO62QU7oBqrfTnBqvdjizPCu0QzQ80V8Mhpt8qxTb8KV+sd5SxKXlsywyNbS2qSTJNV654IVk6g0mr4CQ2C8upxtjAL3kgFmz5mFzsjS+Q0xRrTHGidMX0AOiy0yjm9EzWBeZU4ZfFFgGXeWfkB2iWHa4zwxoNzEzZtgvDRVlMYU1HD3DhYafGniCVDOkx7hxG1JYqJmRyeRsK/XjavgwtgbhfcxemAxFMteRmB/ewPhp0Vs6lUqsGTQ1UwfpUQ4mCtmv1bhQ4zCJ4QE7R5pCiS/tGYqtcWBf6C9qF5bg1CQC3mplJdmGzqByhATDCQh68bTLpji8NN+V2xD2v3MLJFQhZjN+SuBmpibnXqbJ1Qi6pqs5Kqb25gcTKM92VFfA1fajUJUE/Rdupk7G2ro71iTH1p1WzNCC0C5kS4BziV06N3xFrHzGCuY6URJN8WMMO9bbvfz15116CVg91zytBT
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(16526019)(186003)(26005)(1076003)(336012)(54906003)(107886003)(478600001)(6666004)(83380400001)(36860700001)(426003)(47076005)(2616005)(4326008)(70586007)(70206006)(316002)(8936002)(41300700001)(5660300002)(8676002)(6916009)(2906002)(86362001)(82740400003)(356005)(7636003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 03:34:54.6172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 256ef733-eeb5-40f4-e66a-08db8bf6f25e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4555
Subject: [virtio-comment] [PATCH requirements 7/7] net-features: Add header data split requirements

Add header data split requirements for the receive packets.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 37820b6..a64e356 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -11,6 +11,7 @@ together is desired while updating the virtio net interface.
 3. Virtqueue notification coalescing re-arming support
 4  Virtqueue receive flow filters (RFF)
 5. Device timestamp for tx and rx packets
+6. Header data split for the receive virtqueue
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -306,3 +307,15 @@ struct virtio_net_rff_delete {
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

