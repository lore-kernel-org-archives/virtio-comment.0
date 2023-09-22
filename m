Return-Path: <virtio-comment-return-7527-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ED4E6FE32
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CE93479570
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C57639866B5
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BA1AB9866AE; Fri, 22 Sep 2023 13:50:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BE31A9866AB
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Sep 2023 13:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjDCkf9sS4jTLgRJrP7v3hnjYrZB4zKODTgExAN7UWjCJwG9EpdPzUDNN6umTB4VJFV1NVnBHZuJsK5+y3BHrinfvIL7dGwJRGHCZFqILS8WhGTUrRrNLFmMtQ2R7M5cK7e+0fNXraAkODKktdD3vyJMeswPv+KLbKA/iOb2dk7VEHScDTCRrmgQUBi/pP42c9rA/8p/b9zcx+5XMHPNwoj6pXNllmNDjTsQwYCQuAl7MvRLgrRIbvXrSB33M5aLQrixMYuov1DlwvXEkuqlkkMA3uCHdJ787SujamLx7zmm6da8lw7T1NojMaAljf4daYjP3eOV6RWSnMF1OxOX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+jWiu5kTcRzQUXKIHuAD6zrtmZcVVh3Ba41nQ1skfI=;
 b=WdZRVOaa1w1/5JdTylsDD658UwFF9Ah10R3JAtBmIOeRyjngbyv18nrROi6JTvm5epRmAK/XuEB+e0XyD9fABhfN4TIhmbHO+mmeJFwysf15gbUFrNNs1SpdfKsyYWoKMEaNEnMSI4oxRpuebPO+QxfjttaoqEp67etyFoVaSorZ7UN5/VFTzr3UOvRnPd0lsuEl+Qyh3a2GDXuCtuY7TBy4hTJKoifJiXERbcm54PEUlyd+xo17V6G8Y4xh3F1uA4vxHGKmE87wRRJIvsQAtd+ZXpPxLw3whKO7NohhFxZigfeIoFHULJ7qNZQ9F+HNoH2Acsfqa2uaUSfxnroI9A==
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
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Date: Fri, 22 Sep 2023 16:48:34 +0300
Message-ID: <20230922134838.3718-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922134838.3718-1-parav@nvidia.com>
References: <20230922134838.3718-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|BL1PR12MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 59249f80-8b5e-42b7-2ce2-08dbbb72b390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ilh99ihvpNGUxq25Qcz9uap7BNPPEkAH//Fvy11KWiVNIU6N+yOIi2477///E8k74s0TDuG0TBTWaS/mUr85qJnP4NuCpkSR5pSouMAKNfdbwwcVl+LhhdcbkShQ7aCoUIPrc8wSoYq6hsLFiLUos2M0fqd/XWgHBeot4Z1rFKMK7Zb29vIe6g3AS5nis6KlX4QAXKKab6bk3jfCenjdgJx6mgPsifv5cYsjySWLOsC5K16h9xtDPUUxjVzRd3mdH5Zm/vdSS/RbrWfNvWK1v1F/Zg1zZlNm7yPi7tnRCF3/0qzf+5c0Xf6FgNxnI/tgCq697JSkXDJv5aX0Y1E4ls3UEGCzM3GNqxUdlx9ZjCmqpJn06EAjsrZOVyHGTSZJvoTcejGLi1LDtBxjBGHaM6n3GQrZwHo9ke/KJiqKs3g6LA+6fw84Ym93S1keCQi/x4FGDJFElnoeRyEYAOIGunxh8FeB/ppGS94fBaXf+TC2eowPnvg0melZRwzZlOHhoCQnepFDvoPgvdogzuInAVH3+Vv9PwicKNTaY9rBYRZnyrFnIoJgQFwOMzbH7qFbRFNUNcTygViqH/edI/p1PAsGHBqVVudBD1cLt7pQGp8z3DvDat3FvXZeOI/coiY4LgAaC1c1niQz5GAd70zPoXkCCUuS3HkAv29BIqWR6shq9UNrqh75Q5XESL2bvUrC6rKf5H+4Lg9geMgC0PoLahsmhbd22n8VyUZ8CUBtjcLUgk5keMK8S0JpbMnyJdiXr8JTFXD3cu/sX+EQkP8Qp1R21/7vAkBfRQqF13f+JA6czij74McoQ2EMFAHQM2h
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(186009)(1800799009)(82310400011)(230921699003)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(70586007)(70206006)(316002)(8936002)(4326008)(8676002)(40480700001)(41300700001)(2906002)(36756003)(5660300002)(54906003)(478600001)(110136005)(966005)(2616005)(6666004)(1076003)(336012)(426003)(82740400003)(7636003)(16526019)(356005)(26005)(86362001)(83380400001)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:49:11.4887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59249f80-8b5e-42b7-2ce2-08dbbb72b390
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5175
Subject: [virtio-comment] [PATCH 3/7] virtio-net: Add flow filter group life cycle commands

All the flow filters are managed in the flow filter group. The
device can have one or more flow filter groups. Each flow filter
group has its own priority. The group priority which
defines the packet processing order in the flow filter domain.

Add commands to add and delete the flow filter group.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
 device-types/net/description.tex | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index bf6d4c5..caa8c59 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1192,6 +1192,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 filter group, a packet may find match to multiple flow filters. In such
 scenario, a flow filter with the highested priority is applied first to the
 packet, if there is no match, the next higher priority flow filter is applied.
+The driver adds and deletes the flow filter group using a control
+virtqueue commands \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Add}
+and
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Delete}
+respectively.
 
 The match fields also optionally consist of a match mask. When a mask is
 specified for the flow filter, first the packet fields are masked before
@@ -2036,6 +2041,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_CTRL_FF 7
  #define VIRTIO_NET_CTRL_FF_CAP_GET 0
  #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
+ #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
+ #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2107,6 +2114,32 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 Each array entry of \field{types} represents supported match fields of
 the packet by the device.
 
+\subparagraph{Flow Filter Group Add}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Add}
+
+The command VIRTIO_NET_CTRL_FF_GROUP_ADD adds a new flow filter
+group with the supplied group identifier \field{id} with assigned
+priority \field{priority}.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_group_add {
+        le16 priority;	/* higher the value, higher priority */
+        le16 id;
+};
+\end{lstlisting}
+
+\subparagraph{Flow Filter Group Delete}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Delete}
+
+The command VIRTIO_NET_CTRL_FF_GROUP_DEL deletes the
+flow filter group that has been previously added using command
+VIRTIO_NET_CTRL_FF_GROUP_ADD. Flow filter group is
+identified using a group identifier \field{id}.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_group_del {
+        le16 id;
+};
+\end{lstlisting}
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
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

