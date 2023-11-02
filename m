Return-Path: <virtio-comment-return-8122-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08986C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 83DEC72351
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 752BE986C08
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 69BC3986C01; Thu,  2 Nov 2023 13:29:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5C543986C02
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 13:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bisGjvDkV8r6dy9T+ypQgUue3nWTlRptr7igCNc9V5XcMtkHlTpwN81rZD6cSTT02Ot6G7ZtEmE7quKuDUu6tP5uHMVPMuCQopgHwGeOobpKB42Dzc2vLHplzcRTld7zp1d9su3W4fuEez+Y877IiAKpk1MjtToOAqDLyfO2oZL4jw1DCacZiyWevxpH65geO2ly3AuJHoBHEtN3reMbTUd8vJqV0h4HDnPaKVaj1cv36ovS35MLpOf8MRO+oRCm8K03xjoyQqhmAxUFbkFjIt1zqp3O9NGyRN3s4orVunop0EvrCI6HxS04oig+StPnyLHIo0l3NNVUTYWY9tC8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1ECWZiwmkW2kR1XBB3qLBZBgZHlUeLO4KeZYjZVrjg=;
 b=bAuPekssZOnA1RC3El3WHeFLDODeZa4d7t0srlG1NOuqkskdqmXzbhqjbBI9hod6Gj2tTXmw8Le8jZy29Mkx2weLTUQ/4vCMuegbr8lNZYsrLPayvoWarIi6eXvnLytb6CkB/J1nympsNjGtZ5++M2DvN/k6h2m6rIht0qk6JWquREHO9PkIEEfIXoluLGrNsXs7HCdnCitxovy78aVs635HsVF/wU917uwHmchauGxlmav44rBqLsPiE3Zq1FKI3m41J8BtCi4KEbIVZMkcZODoTZKNHXrelUZFF7sk3/GyAAAtrzbZ1NSSjMPVzgERKbZFxa0FZgxcPFOBWCmQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Date: Thu, 2 Nov 2023 15:28:23 +0200
Message-ID: <20231102132825.1865068-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102132825.1865068-1-parav@nvidia.com>
References: <20231102132825.1865068-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|PH8PR12MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f24554-a7d4-4837-b3b6-08dbdba7b17e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TEfh1kkxpNUA3N70CN996Vkxnbpr60nkGxiU/4+GPblduT1VRG6ulUdtJoGDwsJTadqcqsDy7cVKrk87A6ZVQI23ODeGORzu9S56+Bycj5dIDujOONW9m9g6iazdm/kSTpN6oNS7s5IlvSR/xez/3YC8Jo5U59SlIKgtv7QH0mdSyG3bEn7RRHUaHzdlGHycuxF22wWNY80BeNnTTL683tVFRwoyKaOIvbcqVLKT2uMtQ/uG2pNcvdn3weg9KFIP8+bR6Cxw05JPqZvU4WtELj80l9OIkT96l2svYJyLAx4JrQ6BpINqll1TfR0ST0x9W7oAIwYUuPy9kgcIrSKBf5W3mA/tFNYxdIHscfG72yrxoFeS2MO2ePsjYSQB07EI9Xx/A2HaGoe+uZN0nZvKs+iM6Yyb8GoR+meAZ7+Lc9iEhHe430hmlIf+PuKlxaQ32zB4rm3SwtNGYacQ8fY8xa9pKINUH+K/f/mc+ngAf+WJ2pB/AlW53vsKP0p8Qb/LTPpAk5KtQHt2WPt6UAX2/WBQUwbh1KlZyWiwfVeOy1b2StcS0EUg2LPOMr3Magtfd9NU+ss5zndOLuNKbtcFtlCTi4lrQ9G2eWT0TDA9e9fDwBtqE+wxAp1px5e0apb2aDKF1wUqqqSvn18yg9WuWJNQEErAeCcNi38hfA+3G78fvOL+QzKNXh/sD/d6e+EDuUHSTcUXXuiUV5hccJSrUOaWYUcL+CPOW0JcyGMLEoH4gSXgE12JF8iFZhdDxb6wNlIcrnfmJdeEPmN6eb5ZkEwFZiz52t1eb4ZnkhARuP4=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799009)(46966006)(40470700004)(36840700001)(40460700003)(36756003)(40480700001)(83380400001)(47076005)(41300700001)(5660300002)(478600001)(1076003)(110136005)(70206006)(2616005)(70586007)(36860700001)(316002)(2906002)(8676002)(16526019)(8936002)(4326008)(26005)(336012)(54906003)(86362001)(6666004)(426003)(966005)(356005)(7636003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:29:08.5386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f24554-a7d4-4837-b3b6-08dbdba7b17e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6987
Subject: [virtio-comment] [PATCH v5 3/5] virtio-net: Add flow filter group life cycle commands

All the flow filters are managed in the flow filter group. The
device can have one or more flow filter groups. Each flow filter
group has its own priority. The group priority which
defines the packet processing order in the flow filter domain.

Add commands to add and delete the flow filter group.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
 device-types/net/description.tex | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index ec0803e..f08253c 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1190,6 +1190,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 filter group, a packet may find a match to multiple flow filters. In such
 scenario, a flow filter with the highest priority is applied first to the
 packet, if there is no match, the next higher priority flow filter is applied.
+The driver adds and deletes the flow filter group using a control
+virtqueue commands \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Add}
+and
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Delete}
+respectively.
 
 \paragraph{Packet Processing Order}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Packet Processing Order}
 
@@ -2533,12 +2538,17 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \item the driver can send commands VIRTIO_NET_CTRL_FF_CAP_GET and
 VIRTIO_NET_CTRL_FF_MATCH_CAP_GET to query the flow filter
 capabilities of the device.
+\item the driver can send commands VIRTIO_NET_CTRL_FF_GROUP_ADD
+and VIRTIO_NET_CTRL_FF_GROUP_DEL for adding and deleting the
+flow group.
 \end{itemize}
 
 \begin{lstlisting}
 #define VIRTIO_NET_CTRL_FF 7
  #define VIRTIO_NET_CTRL_FF_CAP_GET 0
  #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
+ #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
+ #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2596,6 +2606,32 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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

