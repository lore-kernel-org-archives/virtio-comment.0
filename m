Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011023.outbound.protection.outlook.com [40.107.130.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A569274674
	for <virtio-comment@lists.linux.dev>; Mon, 14 Apr 2025 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644879; cv=fail; b=KKa6jRrDhDsrhsUW0Azv5rA70llcyF0DSpN1hdcV+AHuDpLyfE6/KkvPsVrYfJRjwo1mNiGppCmMO7GZ96+8BpYddemCed7DweYyGXEis7m9nRWe1+a7PYyLrV6OdJTWTqzEKyCvAnfZ5QkuNq4GFlO8HszD3WDMdNFt52zQVO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644879; c=relaxed/simple;
	bh=GftB5I0yv7bQwusYWTaliI1yzKRvWn1CmVc1zhN1ThM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZ5KnNELBBZildw5VYMEVI1vsoUHqTs9lznFU4FSQYT3HJvsWJOnvzWaIskA76vlNNT1M3bwC4Q1T2IMmqIb2xSej9MjoWf6nOwK8WLmxn1LEZ0PtHoOo4xsMdDbqyeNuz60Ce1waZEe5DBqHrQas4Bd557Yl/vfX+4FNVRTA9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=WM7zCCEa; arc=fail smtp.client-ip=40.107.130.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="WM7zCCEa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kwqmo5xv8rFaEZIotgO3SxCdGu5EDG6sQGJRSKFEq06cI9hzak31qGCw+1g8l5WnXi/Fq+LGbJ6cZMQzhIZu6XCZ+ca7NlysZrcivlsJ9MtCJf0cvK7udKonoXJWNCk1cYVPHd83AhsxQwAaZoOexkQN152el/9a0f9dTKxT45X4MFzY2p2ip48ZI08RVLggI1UBfhrJzrjG7M99+KGt/MIJmsDzYr/8uYvfvtcOpiaLwWktBCWwKe6a0aH2PJTMn5C/pJhglDc4aZwCnqegdtag25IS1wCEbIByRdlkARBsTuKjeExvpSniBaLu0SkNAojPoa26AaPCvsuFzLdX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tYyC+wJk2CrFwRtTWWyTJeBfZs9HWOKw4p4T9w8YH8=;
 b=N0i3YKzOCDI29+Wnb99lUCoX4O625A0CT5OA1xAiH06Kgqny8nlHOBPd6Lr+2WRKlYSRqiSFt1vhMwUyY1q+adukm0Pm9VA5lW/KLhkuEtEPJULtWWx22B8AUizX74AMXegVQdHkFRG1BROfVRHcgTwNlpcmrVyW8405ybwbzub85JcUqzTXky5IiLFbkxkZJeIfcQX49L/5uOnmHo3CA/Uw3SWArCM/NcuWb1gGkq8BIuag+INy5ri2o5cM6Gb+8qin7w4PNDBBO0JlXSBy2OSWQezNBiB2uAkyUT7IfYvilDQcD50tNha6XTm5+dqoEKGoOnrE5UbbBGPJMn+ZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.101) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=nokia-bell-labs.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tYyC+wJk2CrFwRtTWWyTJeBfZs9HWOKw4p4T9w8YH8=;
 b=WM7zCCEaIsdJl18jC4kOtmAjVaeWrUy+y8kzClfwZulVPCtsZB4ybTpJV7hJvFflE529vwlQvG6wN+ANczrREE9JkbBcC5884gRSeY3ePrAI7qRfjGozmhjeyxchGcfgA+dqzAYbMzWaP64tPN3gyo3AuBB4F7oOlx5uB0NpRCx6LDimCkobnzljYbiKa1Dtpx5rBon7JhPzqz/AfWyY5nX/PBOhjG1FiyncWIyTWTxFvhbMXuVenfBXa3Yha8k86/FvvnGwvUNChK3yWbao5wq936Mw/NHjRleAHA62qtU3Cqz3/u4UBNCy+bjML5XTGI1m1Od53Uvj8mB6Wn64hw==
Received: from AM0PR02CA0164.eurprd02.prod.outlook.com (2603:10a6:20b:28d::31)
 by PR3PR07MB8244.eurprd07.prod.outlook.com (2603:10a6:102:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 15:34:34 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::fd) by AM0PR02CA0164.outlook.office365.com
 (2603:10a6:20b:28d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 15:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.101)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.101 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.101;
 helo=fr712usmtp1.zeu.alcatel-lucent.com; pr=C
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 15:34:33 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (GMO) with ESMTP id 53EFYSsK027839;
	Mon, 14 Apr 2025 15:34:32 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
        mvaralar@redhat.com, jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
        eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
        koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
        vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
        mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v6 2/2] virtio-net: define Accurate ECN feature in virtio-spec
Date: Mon, 14 Apr 2025 17:34:25 +0200
Message-Id: <20250414153425.99726-3-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414153425.99726-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250414153425.99726-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|PR3PR07MB8244:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 23f41e07-daab-40c5-a32c-08dd7b69db5d
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?UVxr1zcrl1LiEKCkcYBQpZdm172/RvnvGFPMjICswQuk2mVTXaR1E0EyatBm?=
 =?us-ascii?Q?BCZc483Doo2XK9EligEVkUEQwc0bWudOjymNhbpbT5FfYQ/ziZrCGqiXKDvX?=
 =?us-ascii?Q?nqGFEoQA5WEbJ9cw1i9TKNsNHeTXOfaUEAIfpd0r+KT7dn1qAoiVnwYnOyZ9?=
 =?us-ascii?Q?BXVe2hiDf55kyIKhRyTnVQV8JQNSq4LhtGQcdUTR4jkEBygtsIxrLjPlTC/o?=
 =?us-ascii?Q?o27ogXCqOMO7z32MZ+g4km6hsav9VKXVqgoeM9HkDRplbBbuYAGioPYupBBI?=
 =?us-ascii?Q?eS2OJA+xtNRnMO64yUJBW6/WlGR/ECN/D85fLlMMBWLlnCaULJ/w+mWrjlGe?=
 =?us-ascii?Q?VM2Tqoop1GgXGN2IaODXjGwMYYqgA1P11pICAWBV0fiKZVsVJs2cfi40Imsl?=
 =?us-ascii?Q?ltrBwGcGTnKBFT+aBDQPZUk+GxIEZAz+4vrpYW06WnHXEEIAdNZsnuSPXg6o?=
 =?us-ascii?Q?MGGe20sNAYwKGlj3/phSJjHltjwMzhhs6AlV/slFt31+u/QMUI9nxmsJ4O1w?=
 =?us-ascii?Q?Tg1rW/8cbpIA4VKqbYL9zenjYtHqG3KbWirJuYjBxduR3LKrtXYenIFP3H02?=
 =?us-ascii?Q?pO6ya/pG2AVSiYaPYjvRi6KTbA7L4Mw2Xs26q7tg7FkWT9mJMy2BH8Xi2/+O?=
 =?us-ascii?Q?hWEgL9HAKpUjIShDI2zhp9T3WyliINjH45Dh4e9pksZcEucnV5lzq/suSpRf?=
 =?us-ascii?Q?upLYSKodHbBOVQmdUhWBH2tA0Fpxq3BcSXEHiLmlFw+PY+uuwCYjBqZyafJi?=
 =?us-ascii?Q?LhQoC5T+56qaJ/WWSIHOTcHYaBlcwJqQrRnkA1wMiseWvd529Iluul24WXEB?=
 =?us-ascii?Q?NCWBwcjP0ywQ2wZl203lode7XY2fulz5OqHz+TKxiCX/RcLS9psY5XCFLju/?=
 =?us-ascii?Q?5yNJm5mFiUacb0yYXozYKWE6Mf9lo6KhS1yHDW0jnQbWCLexbixM4Jw4thJ8?=
 =?us-ascii?Q?fuJIfVKLeN7OojF25tfS6JpV7SbGpQFOYNgHr9ppcJRX6cwiJkuGl8kj05sX?=
 =?us-ascii?Q?sfD8tWYUFaCsCqWHrS1sdnyAwRyMXgY6WSLosR2zwcB25tXh1ilKHOiCr00f?=
 =?us-ascii?Q?Ejkk01qV/13lyiRb8vv9jOXy3lcfmjTm6uWoK4a6mlPEGFcf67jFKfIEDADu?=
 =?us-ascii?Q?Lj/juj7aq3SxLTvfvFZLwMjCXXZO4OlD6KOddPvk06oKL3vXRmrVnakBoxUW?=
 =?us-ascii?Q?qwglnfL/4Opi42lsSaDyRUy+pYRvWRZTsNertsS6QlGV31ObbZAagC6wha/m?=
 =?us-ascii?Q?Djl+Wht5VK31kciKEhfGH7ijpZTQCk6BB0gWIwa3NnA9ifYaSvCnTsiJUAAy?=
 =?us-ascii?Q?+KOsBn6FwahIaqJwoUNiIgxO5nq0P97xJxVWHCj0ItWPTNVL8hwr2csl0r6w?=
 =?us-ascii?Q?BFOQzFh4FvVCUMlHiikSbK5ShPZFawmrt64qZx1w4HN7lpI3AnhrkJaprtH+?=
 =?us-ascii?Q?EEyAmAIqasZc2Z2qL5lEneEtNHWYKcSaoOmmbmOUgMyC0VloukIwxiuAwOEL?=
 =?us-ascii?Q?+DW08GoosTl14LWLC16XjQMTlhAimdYtjYq+fuBFjXfkIqtvW9dlPZupdg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:34:33.6264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f41e07-daab-40c5-a32c-08dd7b69db5d
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB8244

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

This change implements Accurate ECN based on AccECN specifications:
  https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt

Unlike RFC 3168 ECN, Accurate ECN uses the CWR flag as part of the ACE
field to count new packets with CE mark; however, RFC 3168 ECN-aware TSO
will clean CWR flag from the 2nd segment of an aggregated segment.
Therefore, fallback shall be applied by setting NETIF_F_GSO_ACCECN to
ensure that the CWR flag should not be changed within a aggregated segment
(e.g., super-skb in Linux).

To apply it in virtio-spec, new feature bits for host and guest are added
for feature negotiation between driver and device. And the translation
of Accurate ECN GSO flag between virtio_net_hdr and skb header for
NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to
RFC3168 ECN TSO.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 50 +++++++++++++++++++++++++-------
 introduction.tex                 |  3 ++
 2 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index a2c9de8..3b9247d 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -140,6 +140,14 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
   carried by a UDP tunnel with partial csum for the outer header.
+
+\item[VIRTIO_NET_F_HOST_ACCECN (69)] Device can receive TSO with TCP CWR flag set
+  and follow the ACE bits handling approach mentioend in
+  \hyperref[intro:accecn]{[AccECN]}.
+
+\item[VIRTIO_NET_F_GUEST_ACCECN (70)] Driver can receive TSO with TCP CWR flag set
+  and follow the ACE bits handling approach mentioend in
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
+level ethernet header length) size with \field{gso_type} NONE or ECN or ACCECN
 after VIRTIO_NET_F_MTU has been successfully negotiated.
 
 The device MUST forward transmitted packets of up to \field{mtu} (plus low
-level ethernet header length) size with \field{gso_type} NONE or ECN, and do
+level ethernet header length) size with \field{gso_type} NONE or ECN or ACCECN, and do
 so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
 negotiated.
 
@@ -338,11 +348,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
 buffers to receive at least one receive packet of size \field{mtu} (plus low
-level ethernet header length) with \field{gso_type} NONE or ECN.
+level ethernet header length) with \field{gso_type} NONE or ECN or ACCECN.
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
 size exceeding the value of \field{mtu} (plus low level ethernet header length)
-with \field{gso_type} NONE or ECN.
+with \field{gso_type} NONE or ECN or ACCECN.
 
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
     indicates that the TCP packet has TCP CWR flag set and the flag will be handled differently to all segements of
     an aggregated segment, as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}
     \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
+
+  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
+    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}
+    indicates that the TCP packet has TCP CWR flag set and the flag will be applied to all segments of an aggregated
+    segment, as mentioend in \hyperref[intro:accecn]{[AccECN]}
+    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -797,6 +814,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
 negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
+The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
+which have the TCP CWR flag set and require the flag be applied as mentioend in
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

