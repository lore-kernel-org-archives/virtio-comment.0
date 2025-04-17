Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2066.outbound.protection.outlook.com [40.107.247.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02BE20F087
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 22:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744929661; cv=fail; b=P9cI9lMeuRLQQAZUxnDRwj0tRXGuDfeSyEaauoNHlE0iJ5QE+wufdJ8xy+ON/kpMNPm1pk/cnafIQ6mhQ1JDDIon9AyVej22DLv6mJ4Ncm2kYskth+FVM45xe6RVsEToFSXIb/UKcJXoJe1wL4+U0B9ZnQfxj1YJuMXNqcIqWl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744929661; c=relaxed/simple;
	bh=6UokOQBws3iMvhLKtiUTQxssd+Tx75P9YuVKukvwyRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rkn5T1DuR8DtUyV6Jc9nn3DI9zHlyIKN6AV+vArhn0XEXbiXyREAJYwVjuBY2+v450Z1L33L5RkGyOpvCdFvxbfe1fGMVjRqJEBEaLMcuKjZeUwAoqrAIbQUX2MYy5hPyCCj95IBN8dyyTkHikGU3gjeK1ZBOMtY7VMApvQ6Gbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=MsgD2Loa; arc=fail smtp.client-ip=40.107.247.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="MsgD2Loa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tx3WfWGiC0gjuOmSq8ZgX4i77QDWrqwtjI36ypkS6KVYcWk4hnEsTk9IEfOlGiG1DxViXwPz/c0SXYSIwHyuQD1didZru65FNcNnp0hA5b01pt/lKtqplnKrb9nYoadgBqlWiVQIeHXvo6jleN+ms5sgkOVoQhORwmUFeWg0jCqVlnlY495WpM4zYdUnZpksTyIkCQUgUh2qf3grFVA/pu+4aIbru346lFACYsP6LaiuaujI9X2pOlIVY0HxXCf0W3M6Woa5DV8XIraDrFcr5uhoWbPWpI3fz8avsrbYPpy9lOp8n5kL9RxNaqfv31pppni6Eagi6CJR8q64a55zwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEx9GsViw2O7qOFwuUJQOFMkSpe9weNm990ZCxf8VFw=;
 b=qM5R/JKbV6xbmz4F1hGxppRD1oY/78x9PoxYh6FOwurIof3ZFOLlrgyDJmFl58kCY4J5soYW87GliHooXycreHcZkDCVrVFejg7PEjPNLxNaSAeI75iKXy1DTPjWlnu04r+S+mkEaCFSiERvaxWCpbSRMefjiS7uher5DnOcamBdUINtNFctIzJ4SwMLEPEDTIbN46IHV8V813H0BTU7EM3mVY0IyQ8BwtNuNQwcFTYKLzFNf9tg7o/6mMeCkRsy2a0PdOiRBwdMlIhvpbi+2V/szO4gV6WgpbsUAs9Oc6rNBZzqyaCE3QEoFRZkQ5DzSzgpvZJgqRRBeyfWIlIbDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.20) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEx9GsViw2O7qOFwuUJQOFMkSpe9weNm990ZCxf8VFw=;
 b=MsgD2LoawYVXkI/xq3JbCWjkWuqGbSK0AHC5eF8EXUcB/JaLIfDGdzfnlNACSQa7SYrSRk/3yJf8QlR2Ck3vxmv+YxLlCVBs9DdcXMqUyljuKIwkdgg9Rc58qkvUBqLx9TnX1gr6lt9DJdRKIfgjImVRwIX7WTrKAUH27Rn2ktwZ4g62v0yjEXn6pxaJwckpgybloby4O1SsAEQtJW0wH+txSfUljuzTQsxXdRXSi/eC0pVR28Xspmm+ogWwakIayJiWIJW/++jIg1K/lQMoIv8xfhfe8GDN0nD2pZVr34NsCUiuNIDmOVc6m5HR8rsA69qmnlnr4ecZXR7GUAlZDQ==
Received: from DUZPR01CA0178.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::20) by DBAPR07MB6983.eurprd07.prod.outlook.com
 (2603:10a6:10:193::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 22:40:53 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::77) by DUZPR01CA0178.outlook.office365.com
 (2603:10a6:10:4b3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 22:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.20)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.20; helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 22:40:52 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id 02DCF20066;
	Fri, 18 Apr 2025 01:40:51 +0300 (EEST)
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com,
	mvaralar@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com,
	g.white@cablelabs.com,
	vidhi_goel@apple.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v8 2/2] virtio-net: Define Accurate ECN feature in virtio-spec
Date: Fri, 18 Apr 2025 00:40:44 +0200
Message-Id: <20250417224044.21348-3-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|DBAPR07MB6983:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c80b6a76-2f32-4454-9028-08dd7e00e8ff
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?GsCiwbmL/ArGtMVy0sgESKvq+OLCSiR0sshXKqEKhVG8c9S3W+QOYQcGSU8i?=
 =?us-ascii?Q?4dzENi1cKPAwnKYn7Jq1elqpRuOdIgWXOzKFZKQThrLJiXczYwjwgVq3A6Wm?=
 =?us-ascii?Q?vpDvR94n0N6X6kX95A2zFFKxeKYdfgiyLlcd6tRTxebN1Ud3kCJDywbDpGhU?=
 =?us-ascii?Q?sSTALWL8+C97EG1hPafxLDKzf+FA5Xd27zQtCIOwB1tXuEck3E6YVWESA9iL?=
 =?us-ascii?Q?NjtA4c/eKBafx7Ipa533eXmU1VSST2zUX/UnyQackLdjiURztBrfmh6hrfgO?=
 =?us-ascii?Q?D80TbjfRkmsGi++Ge6n1D4YvMLRMEbhuyBjGpkE5GkuWF08LhCYj1W7blKhf?=
 =?us-ascii?Q?Q2oWIS4NIMBiO83yregCduJnbkYB2ckPcwuAzBDNf7qRdQJZH1CvWRPxWNer?=
 =?us-ascii?Q?ShdvR4HUSmgctQF1B9EGMbj4HyrOnCaaSk0iolFCcywRyCRNiWZDFukvCZYc?=
 =?us-ascii?Q?GyWIpy7STmCR8EHZVQW2J3C7eVkVvC8U7HF/e1nQWRHeLURVc++9IhboYaBR?=
 =?us-ascii?Q?Aa5usASNvFnjNAjIje00ivOAXSOEkkNUdsBouI66IRSwol+9WWlREEztmZMv?=
 =?us-ascii?Q?B4q7ou/6RCJGytVr9oQdpQHbY0P2sufyUcujbinOuQgJj7XZG9RzmhuV4Q63?=
 =?us-ascii?Q?FyfsysLnuiyKkE6Sd3et7pkRqOdQQQVQc0GvPAAHHWwx22XNVaHL5G3SlR7g?=
 =?us-ascii?Q?zNleEs835lh7F6bMQ3TIMnBdqouOsHwjkHXZNoTU9Tj0emMjCEnW2QcuvR6Y?=
 =?us-ascii?Q?6Tk+Q8yZAVEVG05RgQgfbMV1/Xyxc5o10Hn7uvBuGr8tWg4BTa2MeAiQ9P98?=
 =?us-ascii?Q?95W9oxMoxG/9ov4ioYXcpeqvac4sGqhJ2AvxzVhYZg94tu+hkiRQ22woMfWn?=
 =?us-ascii?Q?Le2zLXJAjlkewGIJtIm75h2rjd8W7OKAvamkIG2uO+Hu5a2U8vplcAL3xh+2?=
 =?us-ascii?Q?N4lAZTz+VWhM87dSInAN3wt5uytuorybRlZ04vyC+9/xnd49RAgJ2h9HvhjX?=
 =?us-ascii?Q?JiftR1p6Y2YnL4I+HLgECkYReNSUVR7w+8Mx+f8k8DNDsKtZYA7U4QzapSxr?=
 =?us-ascii?Q?vKUdZabwpNG2haEyGEP9OBJafF1HmPHBIaWSQnq8qozZVs+NTQ8qDmZKGEnC?=
 =?us-ascii?Q?4YjNhVmTSsvsWuAruqLraUjhiGUpbO4IdysnaaPxa0mKbEymGtXZjP2gXcwR?=
 =?us-ascii?Q?dBWp2Iv6rbJwtY9LDen+PcfpOmmbytiQ4nfGxVOifaylyx1cjlGxTLk6oMx4?=
 =?us-ascii?Q?oR/Oi0/JiELPutSh/TmcgNJDFuYHqiY4385/mbhaASEVrWVJru/MdwN2x5eK?=
 =?us-ascii?Q?gCvk5czb847Itf3L/UIIuBtUGIex6MG/WkIzRIrOb2Y/kZlLNHtqU7J1x9zr?=
 =?us-ascii?Q?gn63cgIHng7IPcfJxzzPljSGVZ6TqrQk57MoU6Bi6yI54Tbxgx34m/j4AdTZ?=
 =?us-ascii?Q?gFW2aYcQPfktEnwOZrlWdFiMgqWlGI5M8z7uyFpXGBoKOA+r/WUyeCHOSg5L?=
 =?us-ascii?Q?IyYqp0u/BJg76kizikvoO/R99PlyUb/LE2TY3rdk2h0zs7mM96BN0ZWZTA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 22:40:52.9703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c80b6a76-2f32-4454-9028-08dd7e00e8ff
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6983

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

This change implements Accurate ECN based on the AccECN specification:
  https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt

Unlike RFC3168 ECN, Accurate ECN uses the TCP CWR flag as part of the ACE
field to count new packets with CE marks in the IP-ECN field; however,
RFC 3168 ECN-aware TSO will clean the TCP CWR flag from the 2nd segment of
an aggregated segment. Therefore, fallback shall be applied by setting
NETIF_F_GSO_ACCECN to ensure that the CWR flag should not be changed within
the aggregated segment (e.g., super-skb in Linux).

To apply it in virtio-spec, new feature bits for host and guest are added
for feature negotiation between driver and device. And the translation of
the Accurate ECN GSO flag between virtio_net_hdr and skb header for
NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to RFC3168
ECN TSO.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 50 +++++++++++++++++++++++++-------
 introduction.tex                 |  3 ++
 2 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 6b09f0a..cd5c38f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -140,6 +140,14 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
   carried by a UDP tunnel with partial csum for the outer header.
+
+\item[VIRTIO_NET_F_HOST_ACCECN (69)] Device can receive TSO with TCP CWR flag set
+  and follow the ACE bits handling approach mentioned in
+  \hyperref[intro:accecn]{[AccECN]}.
+
+\item[VIRTIO_NET_F_GUEST_ACCECN (70)] Driver can receive TSO with TCP CWR flag set
+  and follow the ACE bits handling approach mentioned in
+  \hyperref[intro:accecn]{[AccECN]}.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -151,6 +159,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
+\item[VIRTIO_NET_F_GUEST_ACCECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
@@ -161,6 +170,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
+\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6
@@ -284,11 +294,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 The device MUST NOT modify \field{mtu} once it has been set.
 
 The device MUST NOT pass received packets that exceed \field{mtu} (plus low
-level ethernet header length) size with \field{gso_type} NONE or ECN
+level ethernet header length) size with \field{gso_type} NONE, ECN or ACCECN
 after VIRTIO_NET_F_MTU has been successfully negotiated.
 
 The device MUST forward transmitted packets of up to \field{mtu} (plus low
-level ethernet header length) size with \field{gso_type} NONE or ECN, and do
+level ethernet header length) size with \field{gso_type} NONE, ECN or ACCECN, and do
 so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
 negotiated.
 
@@ -338,11 +348,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
 buffers to receive at least one receive packet of size \field{mtu} (plus low
-level ethernet header length) with \field{gso_type} NONE or ECN.
+level ethernet header length) with \field{gso_type} NONE, ECN or ACCECN.
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
 size exceeding the value of \field{mtu} (plus low level ethernet header length)
-with \field{gso_type} NONE or ECN.
+with \field{gso_type} NONE, ECN or ACCECN.
 
 A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device offers it.
 
@@ -433,7 +443,7 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
-  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_GUEST_USO4,
   VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
   VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
   the features described above.
@@ -592,6 +602,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
+#define VIRTIO_NET_HDR_GSO_ACCECN   0x10
         u8 gso_type;
         le16 hdr_len;
         le16 gso_size;
@@ -702,6 +713,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
     indicates that the TCP packet has TCP CWR flag set, and the flag will be handled differently for all segments of
     an aggregated segment, as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}
     \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
+
+  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
+    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}
+    indicates that the TCP packet has TCP CWR flag set, and the flag will be applied to all segments of an aggregated
+    segment, as mentioned in \hyperref[intro:accecn]{[AccECN]}
+    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -797,6 +814,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
 negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
+The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
+which have the TCP CWR flag set and require the flag be applied as mentioned in
+\hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_HOST_ACCECN feature is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
 in \field{gso_type} according to the inner network header protocol type
@@ -1108,12 +1130,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   in case of tunnels) has been validated.
 \end{enumerate}
 
-Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
-and ECN features enable receive checksum, large receive offload and RFC3168
-ECN support which are the input equivalents of the transmit checksum,
-transmit segmentation offloading and RFC3168 ECN features, as described
-in \ref{sec:Device Types / Network Device / Device Operation /
-Packet Transmission}:
+Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL, ECN and
+ACCECN features enable receive checksum, large receive offload, RFC3168 ECN
+and Accurate ECN support which are the input equivalents of the transmit
+checksum, transmit segmentation offloading, RFC3168 ECN and Accurate ECN
+features, as described in \ref{sec:Device Types / Network Device /
+Device Operation / Packet Transmission}:
 \begin{enumerate}
 \item If the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options were
   negotiated, then \field{gso_type} MAY be something other than
@@ -1218,6 +1240,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_GUEST_ECN feature is
 negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
+The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
+which have the TCP CWR flag set and require the flag be handled as mentioned in
+\hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_GUEST_ACCECN feature is
+negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -2193,6 +2220,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
+#define VIRTIO_NET_F_GUEST_ACCECN     70
 
 #define VIRTIO_NET_CTRL_GUEST_OFFLOADS       5
  #define VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET   0
diff --git a/introduction.tex b/introduction.tex
index d52622e..9320ca1 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -171,6 +171,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
     S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
 	\newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
+        \phantomsection\label{intro:accecn}\textbf{[AccECN]} &
+    B. Briscoe., ``More Accurate Explicit Congestion Notification (AccECN) Feedback in TCP'', February 2025.
+        \newline\url{https://www.ietf.org/archive/id/draft-ietf-tcpm-accurate-ecn-33.txt}\\
 \end{longtable}
 
 \section{Non-Normative References}
-- 
2.34.1

