Return-Path: <virtio-comment-return-9038-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA98AC46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 275C92ACA9
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 026B0986883
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DAF1A983F76; Tue, 30 Jan 2024 14:07:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA376986687
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 14:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXntPOpHo0m0s3wlfXy8oMxbGggBC0HyjzxDz7Hxol6vsJXBXmXgDJ6MMCBoT5wFR0Wb9FuBlQYmuO8p6tZnwsMpdFkINSxeHCae/PttFZaC8MFe3KGfVsKatEXDEuxBPffP0qS+A/VgYHMVur+oaZ0Q8422rqs/oCBegllp2M+eY/fw4WeU/B+pF4FQlSUhHk1kh0mlDApN4Jt68DyMy4yYc/jQ8Kd/hBAZkFaOXARoSovXJGAIenwU8NgHT2eYLwWjwf87IuYndQ9xCCNxA3Yvk+oIP4v0ECzffH8WS42VXq7E17TnPd75akFk+01zyBDzC0MDzkVyFX8HLm6z6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YSZDR227wiRxpo4fdWZEX8t2PQs3+lZL0G7e/kR2zc=;
 b=SP0FEE9zYHdFWUPpBeeeDgTQGY6rHtCI/DQRbBr0HHMQb0NmI5TYwfO/ezWTH1FKdaPakkUUSdp/ugr5YogvO1YL/BZaGhVySTHukoxu27hqnGOVtrXPOua78KiqQPfDNSWGK5xdusTup3lfGAoDvzFJ4L+afx22UWS2tz78pNChpCrv7BA3yoo+El48fQgVd5JzcsqmmciFISNHW1nmM65pjFqd7TxGZCOJhvDK0B/SYtz32v0b+Zh3F0kZ+ywR9EvQ2IVZpvdbHPudvAkiDnLyV3v2Nq7ASCzYfmCeIWY+KgsVdYqpc98eGBELof9FuF2ui8SeZ3AzBr59RLxCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 30 Jan 2024 16:06:30 +0200
Message-ID: <20240130140642.406882-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130140642.406882-1-parav@nvidia.com>
References: <20240130140642.406882-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|CY5PR12MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: b560fb23-8556-4e33-073c-08dc219cc3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gGoJub7k802ZJyvb4jVres/CFKiqPy/ENOGM0pgXwJ6bM+Jm8GpMJMRb/bENOb0EFHYUlXYI47oN3gE8iFv6wElqvHFvbAiVUcb8OTGrN3XZNUjMK4mhXAnn5eT4zo9OpRX5bhROlkDGqqbAKC2BKKIS7IHNv+8+TBGCRgfbdhKWfu/BJjfsJ2sd0+XwM9rTMaEfX1G7zWd1Lqw2PRHsLaCHHEJNly+VW1ObJ9pi094RWaSL2iGlkkrsobN+x5nJUIfWQxRLuDfV5QovCaW8r2J7G5trAzJ6be+Q69gzHonqKeqWEbE3rvKrrwhx7uLfw+J15Qiwsf0vUiyp2Jdsmk6BvNToQFRhi9Crj1RHIiGHv5rEE7QDtTW7lcqvWR58BP0sEPBcPb3PrmS18dxE4hF/yz/F4r1QCV2a9o1UYuL57RB2ILjo6pUAQB3S8/LTV4lEHFFGpBsr8XHfJ5h0hwzlgXZLqcw1tPn4OJ1N+lKgq8j3nxEOSwo2PZMquNf0HBZzG56ou+BoTFofBKHg20omZyabpP+hLTxN0KUaOazeUcjSbDemyuTWP1Oe6jK198qv9tGn+xhJDMR+ObH6QzjuDHndhVMQh3cRe+AdUIEDVuwTULTrVbtS2HolCEBlQ+H53QMVYMNHeUbLWRh71e50/OxiRN7fsPqa8ak36pAwuSXT4QLBxm1nuDUrqDHZInOVOtmYruqrzKaGRsd+2R9fv95khA/dqTrm8Bt/aMTjHf7l8azNeNcHd/Yrg6rmBDBY7QImZdIgvQSRYWNjvpe1CaPiTivBr8p6fVf8uGg=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(46966006)(36840700001)(40470700004)(36860700001)(47076005)(110136005)(316002)(83380400001)(36756003)(70586007)(54906003)(70206006)(86362001)(966005)(8936002)(8676002)(26005)(478600001)(107886003)(16526019)(1076003)(2906002)(6666004)(4326008)(336012)(426003)(5660300002)(2616005)(41300700001)(40480700001)(40460700003)(82740400003)(7636003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:07:16.2912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b560fb23-8556-4e33-073c-08dc219cc3d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6204
Subject: [virtio-comment] [PATCH v8 01/13] admin: Introduce self group

Define self group to control the self device itself.

Subsequent patches introduces the concept of device capabilities
and device resources which utilizes the self group to access
capabilities and uses device resources to refer to the device itself.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/admin.tex b/admin.tex
index 0803c26..00784b3 100644
--- a/admin.tex
+++ b/admin.tex
@@ -1,7 +1,7 @@
 \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device groups}
 
 It is occasionally useful to have a device control a group of
-other devices. Terminology used in such cases:
+other devices or self control. Terminology used in such cases:
 
 \begin{description}
 \item[Device group]
@@ -37,6 +37,11 @@ \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device g
 
 The following group types, and their identifiers, are currently specified:
 \begin{description}
+\item[Self group type (0x0)]
+This device group refers to the device itself.
+The member identifier for this group has a value of 0x0. This group type
+is used by the driver to control the device itself.
+
 \item[SR-IOV group type (0x1)]
 This device group has a PCI Single Root I/O Virtualization
 (SR-IOV) physical function (PF) device as the owner and includes
@@ -78,6 +83,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
         /* Device-readable part */
         le16 opcode;
         /*
+         * 0       - Self
          * 1       - SR-IOV
          * 2-65535 - reserved
          */
-- 
2.34.1


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

