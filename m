Return-Path: <virtio-comment-return-8567-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B2AC624B4
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A3301330AD
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8982F986E6D
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7DE539868A7; Thu, 23 Nov 2023 09:22:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F1C69868A9
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 09:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djnGB3k3O73erccp3IHUfDBLpOM7LxjOjJQWE4mjHpmuZs87aAwwsCQZvTOpmRGtCBT1C6vFLdcJC1TTFg/F6y9+32dZRkOQ2JG8t4jzAd+/sGuf0S3ZefYv6tSdJeHAEaHMyvPjMQlcFWuXd4UyM/JzigF43E5JmSOk6FamhsRfI8zhXc6MVx7CXCCGHweYXUixPpRCI+y5t/Q37uj+dJB+QH3zSfR7eifwrpzeYIo7Ht6B337xaCppk+rO+8QZ0q3MHnlVTFtGpfUeV0vzigNQHkEjM2K6x+v4bWOV/ClceRS7cCt6pnxZrRjCUx4Z5iBUiKoPlt3WLDtMXbCmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7683eIeB5O8DRqbUzdwb2cgixL+pDwZWcbGbvpm5GIw=;
 b=fmUUpG9IgsSmIY2MtDILVH35WFNM4Q8BI9VJEfCBA3073gvyif0pRvBq7uphiRY8qKGhaYh69cm/YwsjEDzDSxtqnnIfCCfLR7RaZX1TRjVK9c/N2NCO2I4QqbFNyCQEAUbFhFqj+s0Hspo8G+oyLYLgZ7NUVu8vG2KjquNuXd2xPzb1Xw+a345YsmKXDFOizp8WR6wwXCyXPlgD9+QwO+1JhR4na+EAEN177xFyRcdLR3La6zh0p9SCAajxRPw2Vs5vCLP47rrEtaR/AIxyWNtD7XH8Lv/V8z81KbihLh0m5aTDJrnQvXeug+onIUOYOEp2zQEwC9Wmlefm0jB9cw==
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
Date: Thu, 23 Nov 2023 11:21:17 +0200
Message-ID: <20231123092119.2718448-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123092119.2718448-1-parav@nvidia.com>
References: <20231123092119.2718448-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|BL3PR12MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f76c97e-78b1-4463-e7b3-08dbec05ab6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Vgtu5zttX504DV9zcoVfNJSZ6A+ZXWnA8zi+ozSi9RqRdU0CrT3r/jl4+cbJVbshKlgvTcN1iVFIiVwZL/YZVIRQteG4zVagHvkjD2oU4TSjU7JFOW4wsvEhj7c9xAMwEtWsqdeAhvVHh5uZvCzAVx/r5AQOgedstRcWV3ujMQGmqzLuvzyzUR4BlQh5YKAJEeD2kH+4OSN7yLhTCuPe0MK985efz4Ay02pM3rK9r+YU7NKJd53oEmvJOQ2D1MBr7HH6KQtYYKEw7m2eMLZrfgLXfEt4Kl+saOlKLvVa4scKTOJICOKX1RmYvRk+fLkhGUKtsZW73LO3VqeUENaUQnFTpgKY5eQfrsDjQzbzlOQQabg/7zc1mvQt66W/DiJUUPu0WypoCdPwtZBn5pVLNVUt/xzohd/0CDn4d6gl5gFHEJIQnZtM0/GkDexwwJ3/SvQR49LV9B8uL9jHWGQVXF8LPYJZfg84XZme7c82oQiAeVeTNljPI+arayXO4qhka1zjJp2yLNvTmMNj3OvxyRsqqeV6L7e/MOM33VCdXZ82tCzysoMB9MXzWrJjTsHfXdB/l+QifkV/QyqMFRJP6lfuT3bRnoTdbcyL3SQnYsm5RDma+AfbSmFR6VjyqRs+oJbntg0ggmrcxiTTGprU7Ihu2hCDUeI56mglDUKQCk8EjKgZY1IPglLPRnp7EGYKj/P6KMWVYwqKAF6YRrCbZ5fapRbhJF/QRbvElq2MmexlDZiZwZWm5V2QIYFa3v7Sd9INVmRlcpCRaogIXfcA0NOwNxsdP0KGpgnYOOrs2s=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(16526019)(70206006)(40460700003)(316002)(70586007)(54906003)(110136005)(7636003)(426003)(2616005)(1076003)(26005)(478600001)(336012)(82740400003)(83380400001)(36756003)(36860700001)(356005)(6666004)(86362001)(47076005)(966005)(40480700001)(5660300002)(2906002)(8936002)(4326008)(41300700001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 09:22:09.6618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f76c97e-78b1-4463-e7b3-08dbec05ab6b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404
Subject: [virtio-comment] [PATCH v7 3/5] virtio-net: Add flow filter group life cycle commands

All the flow filters are managed in the flow filter group. The
device can have one or more flow filter groups. Each flow filter
group has its own priority. The group priority which
defines the packet processing order in the flow filter domain.

Add commands to add and delete the flow filter group.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>

---
changelog:
v6->v7:
- addressed comments from Cornelia
- reworded the description for group delete command
---
 device-types/net/description.tex | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 10d92d9..e766b12 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1188,6 +1188,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 of the matching flow filters the one with the highest priority is applied,
 skipping any matching filters with a lower priority; if there is no match,
 the next higher priority flow filter is applied.
+The driver adds and deletes the flow filter group using a control
+virtqueue commands \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Add}
+and
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Delete}
+respectively.
 
 \paragraph{Packet Processing Order}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Packet Processing Order}
 
@@ -2531,12 +2536,17 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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
@@ -2594,6 +2604,31 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 Each array entry of \field{types} represents the fields of the packet
 which are supported for matching by the device.
 
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
+The command VIRTIO_NET_CTRL_FF_GROUP_DEL deletes the flow filter group
+identified by the group identifier \field{id} previously added using the command
+VIRTIO_NET_CTRL_FF_GROUP_ADD.
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

