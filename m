Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D8280CFB
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662286; cv=fail; b=OQ7pLqMYVVSRSVhCBnYnfTPNtj989Nfvd3NJAXJuvZKN3Vq2QV50HuKzbNGB86ysGH3fmeHJG6IWSroRbAm7kiv6uNVATDqdn2IwfJLBeiDnvCHYWm/05DMMNQMCsWAZ7ZlM+AeeqLFNGKM/h8rbbD7TR6L6Lk4Nn+AzgWZIrKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662286; c=relaxed/simple;
	bh=LGgtgrtS8f63/8S44iLalZs63O4M6ikLAnBf6B86LiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZqdHWKYFMdKtW655lSCC2qSefzCJLT1uMQWtxc/uXl/OIabCCU5dbpXMzEreLLVQZ3EvfL6CSErjcBd71nzql3tk5RyUK73tenQzLtm+y01+3N1xbykxOWl+4MK11onPE+EgCYGfWxOTkQeq2+KVo33LX7uZ1tLk5tfQaWH+hCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=KCCNdAaN; arc=fail smtp.client-ip=40.107.20.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="KCCNdAaN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZHERN7IlIjZith59ViR65+ZPwnTAckxbAgy+H42HM3gH0WaXPfW745TpmL2JfpOC8o0anMe5BRik6f5mLhuuxou0bDg80XG0uO935WdiS89sghG7ERv3uwH7NkKyQRS+ORcFLOyjT+ixubirSYE3oklQdJue7P65CN7GNs3O/8km2AtzyR5WASW3fz0AxrtINXSGy/LaoYgqy1ek55blr8DQURXQgVo1YhtK1INrQO9qVdkuy/nwcEjN8MQ2YwHxl2r79ty4q/WAQAjKs1SwnlvXthoTwSY2Ke9tpYPwnnURQed9LVvH3sKuyEBBwN20tIyYFeEstFvBSEYPDXHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvHpPAajVZWwdtgZFw6mZi1cgfNDUD9PuPyFyfQyALU=;
 b=ySH1k3m3nKCgflg9hfbNEKf8TQWndBQ4z43hJZydJ44n851C2J/NVrKbYXzU9jwWDq50qmAW4dkg9z8nBQgBZV61PcUrOKzTFDw7VxEv97MHcFhMqqFHuScNKUg8rS6uEhlyUzdZV2qAaLyqQffoMOt1tEKWs6ZrkqcCzlQgvnLkpR2hS0UTFUKe0ro0z+es2B34WgOOf6tH0JOz1C1EbQlXpSnH0zUeqHsYrK0l/mvdfSghNRvoRgM6IeS9iWdPHT221/0nwhPaWpPBS+r9pZ0jKgw/RmWTpOdg9JGziJzNr7eQ3qAE7SUZNeviM7yuSN994N+FBeZgB00bAUQnEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.101) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=nokia-bell-labs.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvHpPAajVZWwdtgZFw6mZi1cgfNDUD9PuPyFyfQyALU=;
 b=KCCNdAaNydJd3sFfoW+5HiKvDl9CXYj4j+cwzfkWT8HI1wKz99VODlYop1hac7XDz/F3nUGAT/7FnGHPJDCSiJx1p1AjZ1nOq9XgnROnTgTqlVuWb6MgfQjRGJ/x4KuEst4xawIfHR+MkHDtaeFjfNLyHhp5ur3q2qen+23sAif3MbMl+QwFa6bdyaCGYPlNH6fmNv08tLsWBQhF2ZoCTsUFIEdCedjs5qcvEk0hgy98wMCT5KrN5SGN0WTNSNDKPPX7hFJHVFXvEDea7L7RzSTvD1TU/fjA5qdW7HtQDNV/1jVjoyQ7BmbZ2n+FbJmnM5hlGzYzvRlo5rhXYsvIEQ==
Received: from PR0P264CA0130.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::22)
 by AM9PR07MB7123.eurprd07.prod.outlook.com (2603:10a6:20b:2c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 13:44:40 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:100:1a:cafe::40) by PR0P264CA0130.outlook.office365.com
 (2603:10a6:100:1a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Mon,
 19 May 2025 13:44:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.101)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.101 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.101;
 helo=fr712usmtp1.zeu.alcatel-lucent.com; pr=C
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Mon, 19 May 2025 13:44:40 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (GMO) with ESMTP id 54JDiXAh011659;
	Mon, 19 May 2025 13:44:39 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
        mvaralar@redhat.com, jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
        eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
        koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
        vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
        mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v9 2/2] virtio-net: Define Accurate ECN feature in virtio-spec
Date: Mon, 19 May 2025 15:44:32 +0200
Message-Id: <20250519134432.27406-3-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519134432.27406-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250519134432.27406-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C715:EE_|AM9PR07MB7123:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 14ccd98a-8129-460e-709e-08dd96db4dc8
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?3tRusDbsRgnC8Sz1RNYzVR4uvZNggNmFGXOTuM6q8Sw5qki2jFhW4IV8s/Lv?=
 =?us-ascii?Q?jMhrl2fuO+6rywIvPuZclGXy6NZtkr38AziIyftpPLZ2sZLEf02BS6FsKYSb?=
 =?us-ascii?Q?7qgawrRCTr4i7Z/XPnFj3OpjXKiYFr4NA4nH9tjQEf6Z3PvdmAYsSanN5CIO?=
 =?us-ascii?Q?k+p4MUh69oKGqwLjH9Sg9DXvGKCwJVMp1cFCp3lNLzHUEHlVgDSAE7FJ07J3?=
 =?us-ascii?Q?OP69VVk5P9Gz4626VUYIItQTc5TazOBjlmJc3uY3XGSlXu4M447mv1t7PDcl?=
 =?us-ascii?Q?tNXaGM+QmeuUwE5QsIC1T3qKjS4e8IeHvirRlMWN6a5MzhAMBz75lX3CkBpG?=
 =?us-ascii?Q?38idhx9JuyzS0fYlR3p/744TqBvuoqH9KXAyC6KLTRQ4mC8YjFUyduIcpSRi?=
 =?us-ascii?Q?1PAP/gc5EkPGNPvP8JEOCQQ3BzS3/K3vZY2YXiglaWuGMpwIBH7ymNBdLhTX?=
 =?us-ascii?Q?zpBrgfB16O5pSg0wZaueKkWEcyR2NgkJmL1eQ9UHKFKgc8RSvvkmbBGn1pHp?=
 =?us-ascii?Q?60S0V5nwK/x+gPqJ/yD34tW0Z6g+ISaexyja3ttZgkopRItBFnDpFQhSDCKS?=
 =?us-ascii?Q?yZGbtx68xYAaCMpYXwBHs8d6Kf+it8Tu/vPb84DERDaPKj338UUqjwktixs0?=
 =?us-ascii?Q?ieX4IK4f+p5CRfAf3INYPGhi3kG29hBWxbYpcJR4KTOfsAy3gD5WMcHYVO0r?=
 =?us-ascii?Q?ppeSLg3KSr5OZWNLUhCMCNKFIJS4vscPftM04jq7B0scMSnKTWnOc/x1yWb/?=
 =?us-ascii?Q?bjyVtCgPxX+KXovCz9+WYLqycLMwdPIKkVU+GoW6Fw8ByiaOAdirJICefVC+?=
 =?us-ascii?Q?2L7lYMo9Df0LbDnK81RBGZ91J1Fx/eDyC+U46Lwg7YxGvYiTldy85jpkELwc?=
 =?us-ascii?Q?bIx8xuvyhZNlmLZaLl+Q/zfoiRFe9hMS8el6g1WsQXUo1gal3ahlA6rl8h+V?=
 =?us-ascii?Q?7v7KS5tXesM3y0GrlwmGuJx4udIJeYi8Mo1qTO3l9A+00t/CPV1YSxYsgFd0?=
 =?us-ascii?Q?mUZq5pHQtsANOj5H8UjiX7Blo0yO1nrLQ9izU6SOhPdmpJnwjjVppAJg/qvv?=
 =?us-ascii?Q?KzFhNeaLooxPOJX2mF2ASdK7nVPXkJeKRc9HmVw+EKzQaObhZOpGU9rgC+RR?=
 =?us-ascii?Q?yErSQT5GK7UCiFfu4ERjg24pYEjCBsIPi9/uk2PvXlCZ73u2ZWTU+H0G4QRX?=
 =?us-ascii?Q?/6hWz5RiiW4ql8ag3atCIE0Yi2+Sst8jMCo5TvkUCgyl02YI/E0Hno6nIvuC?=
 =?us-ascii?Q?9vqVBzS82Ia4LBqb1OxPioniQqaP6WZ1lVaoxK3fXk/34g67C62Y6m+tr3/9?=
 =?us-ascii?Q?xb0eFuy4BP88vb2BDqO22fRXv8H8Z9QPYDD525ucF/tiD5/tPLCukFx/Oswq?=
 =?us-ascii?Q?7LXzekJl0r/NAuxABIPiKK03VrEzW6Jk/DrQvqVUrrvgcf3hSKzw/kPfzLME?=
 =?us-ascii?Q?0x7DdEbVBQbMu1k9RVq1dLpg+McZMr5DZLEIiteC3OYU60gPSFD9Otsvcti1?=
 =?us-ascii?Q?Z1VwDA+URaDSpqM=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 13:44:40.2262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ccd98a-8129-460e-709e-08dd96db4dc8
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7123

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
 device-types/net/description.tex | 55 +++++++++++++++++++++++++-------
 introduction.tex                 |  3 ++
 2 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 931b80b..530d8e5 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -140,6 +140,16 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
   carried by a UDP tunnel with partial csum for the outer header.
+
+\item[VIRTIO_NET_F_HOST_ACCECN (69)] Device can receive TSO and follow
+  the requirements of the ACE field described in
+  ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+  of \hyperref[intro:accecn]{[AccECN]}.
+
+\item[VIRTIO_NET_F_GUEST_ACCECN (70)] Driver can receive TSO and follow
+  the requirements of the ACE field described in
+  ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+  of \hyperref[intro:accecn]{[AccECN]}.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -151,6 +161,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
+\item[VIRTIO_NET_F_GUEST_ACCECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
@@ -161,6 +172,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
+\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6
@@ -284,11 +296,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
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
 
@@ -338,11 +350,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
 buffers to receive at least one receive packet of size \field{mtu} (plus low
-level ethernet header length) with \field{gso_type} NONE or ECN.
+level ethernet header length) with \field{gso_type} NONE, ECN or ACCECN.
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
 size exceeding the value of \field{mtu} (plus low level ethernet header length)
-with \field{gso_type} NONE or ECN.
+with \field{gso_type} NONE, ECN or ACCECN.
 
 A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device offers it.
 
@@ -433,7 +445,7 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
-  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_GUEST_USO4,
   VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
   VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
   the features described above.
@@ -592,6 +604,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
+#define VIRTIO_NET_HDR_GSO_ACCECN   0x10
         u8 gso_type;
         le16 hdr_len;
         le16 gso_size;
@@ -702,6 +715,13 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
     has the CWR flag set and follows the requirements of the CWR flag described in
     ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
     \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
+
+  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
+    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type} indicates that the TCP packet
+    follows the requirements of the ACE field described in
+    ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+    of \hyperref[intro:accecn]{[AccECN]}.
+    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -797,6 +817,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
 negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
+The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
+which need to follow the ACE field requirements described in
+``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+of \hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_HOST_ACCECN feature is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
 in \field{gso_type} according to the inner network header protocol type
@@ -1108,12 +1134,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
@@ -1218,6 +1244,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_GUEST_ECN feature is
 negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
+The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
+which need to follow the ACE field requirements described in
+``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+of \hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_GUEST_ACCECN feature is
+negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -2193,6 +2225,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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

