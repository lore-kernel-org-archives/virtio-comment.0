Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5184A33
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741214178; cv=fail; b=aWoz6deS3GBiGutjJb8UAIP7eOsh9dGaJYSgbQ6HEHI0SriAtdyB5m9COE8yH1f4ITZLwTm8Z2dqynEsiDswxl2nrKaSBjik1u/OvGAZNMbSHTuzcfZi1CH/45yOeGoWABORAm+Peq+j1K8h1KvsRWgvDkCYqxiGi9lKSjG6ipk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741214178; c=relaxed/simple;
	bh=ezGFx5k1HBovayWWJIEgYl6s1eWnLHyLFzmuun4zQPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ulk+g7WmhM12fQJX3dGb3KJ81yZf6rtN7EpeomcipoV1k2AbMcBcakFwPiQNRIwuRiB4tBrw8Dnl1+oqLdfSy5Zk4QxqzzuF7d97jEJ2aTntBmgSCj/q/iDCtf0fBskgubXxqSc2t0Hm5tJgz94EUN+50T4rzD9PcAJvQ1wPsDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=UASvUbX6; arc=fail smtp.client-ip=40.107.22.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="UASvUbX6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlHhHz7zgubznBTkPO65aOiixXMmYoQMv8WAImwSr6vRLRLNjkcpcvfgike0Wola/BuYe9QF3CV6LbG9rkFQkemGeStlGhZJH9Pwv1kwiVO7nSqaRxzYrCV7zwDjHx+YyC32RZLqdjf7eF6xKx2w1G+S2NEHHfKa5u1SkSP4GkU1HDySva84QbSYesmK43k+AzVz8BlkiWp43lSle8h8u3kjwWu1rmH02usDyMkyw8xIJCeBhNujUqQ5VrlQn24dFzhXAsIM3A/3pUnnaZo7KdrjkBVTKuna9lGLyoM6DVC9Aez/0eSPZXf3GdYgCbd4w1i66pcJC5IflppnGXwuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tRpEaq5ydALm8yPhue6awWtJSaCTPMC5N12+D7yJNg=;
 b=PUS9StOTSO0uwCECTGNqVJ0x3TVVPayTfugtVmnvnNGW7ElAPYKJVuu9Y+X7Z8TGwXnMLwiybUTTRJlXjYw65kgpqrnPVaxwtBSpQqZSxgJm79327rRH8185h8am/1d+Bacyo/2i2FbW2c6unmSKXKZWbcTeL3QYo0hwkvwH71ibDRSRNF207FqXgF7im6QRNDiAoikfNQqyTQQopPt0kK6SFcWgFbzkCqQfk+40dVDXQi/Rj3LZm2zMT4uX2QQ1gq62MbpDoxCM1V3AyQrWhtfT6TwF9XJdtAwdXUGJsSE1pzxuS7APMAS70+uURZtYm0oR8EjLE3143MYsOjBjbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.2.29) smtp.rcpttodomain=apple.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tRpEaq5ydALm8yPhue6awWtJSaCTPMC5N12+D7yJNg=;
 b=UASvUbX6C0BhPDihCrMRkPe1/BLDQF+261HoLP2gk3B97JEUX/d05utpgAucUHDgojKGh7lcIMoMnQp2cnK1pURBIdEffAlxkl4I+bwgjYd5hsEZIT786MCKfEmWQtY/sUvPbk+9nfF90GRRFzYveJSoUFFS1RyRVJbmVlx7uaukt6knKCTrEXSAswhXRbJUz/ay9G8BSc2oJlc7dFTlnRyeU7rgaLq9mNYaO1ybyl8eQkJpQ0hJIJJRVcOpB4w4wvtgAY5Nc13jDoVI5l2kLIAMKWezzaesjQtsDE43GyahN3fG/oGTEb+wuQb+hwShq2D2uCnvQPPzAy2AY+PaQg==
Received: from DU2PR04CA0211.eurprd04.prod.outlook.com (2603:10a6:10:2b1::6)
 by AS5PR07MB9916.eurprd07.prod.outlook.com (2603:10a6:20b:681::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 22:36:09 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::1e) by DU2PR04CA0211.outlook.office365.com
 (2603:10a6:10:2b1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.29 via Frontend Transport; Wed,
 5 Mar 2025 22:36:09 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.2.29) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Wed, 5 Mar 2025 22:36:08 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 380C52261B;
	Thu,  6 Mar 2025 00:36:07 +0200 (EET)
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
Subject: [PATCH v4 2/2] virtio-net: define Accurate ECN feature in virtio-spec
Date: Wed,  5 Mar 2025 23:35:44 +0100
Message-Id: <20250305223544.85812-3-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305223544.85812-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250305223544.85812-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|AS5PR07MB9916:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e03f218f-7e4b-447e-fc48-08dd5c361f94
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ljR0/kOXYTHjcX76jrcoRhviGgBkKLH8ItzmdYfd+YmKVobKJayq41XRt/9o?=
 =?us-ascii?Q?8nkUwHgj7F4LBNZTLOYo1FkNpQSXdT/cbdXSHM3nW4I+IFM9FDFLc9dJ0YKi?=
 =?us-ascii?Q?FgKtOBshlvlKf0PRAgqB1Rcfoi4qsLEpy6DMy6kA9Qu3yMl55Gz1WxLpKc+L?=
 =?us-ascii?Q?aaITnzw6PuJ2YlBvw08bzhYBUgsKHImgOVtxT6Q/reI9+qdcrzS/oOfIOCCe?=
 =?us-ascii?Q?KkMVtYiAvKUBQnstglz/J292Zm+csM0MpJYv1hoZRCgc+jFbdIWZiY5kTd3q?=
 =?us-ascii?Q?YSZy4Yminj3PNutd5fvPaNuSnxYFRTAkVde7WtMl9n3Q2BDiD5l7/VQYDMdO?=
 =?us-ascii?Q?rGyNOOGwn8IJBzGM80ZvZ/CdkJykvcEKxOV/10xshhW8ml8yoHf4R8CPYAyM?=
 =?us-ascii?Q?TIQmGWQSj4SlvMTgT+gAy/p1hs1TrV/vK3JC7dW+d1gmaGrIBO61I5mu7FAe?=
 =?us-ascii?Q?FdJ9Ls8alL0AtfEYlODsDm7c5OD5AGf78PcURpOhIrMrAQi/l32YV2nmAUFJ?=
 =?us-ascii?Q?G/jFvtJr1bdWAa1iMfEZbEvfZKZGVNrGoxFZ7PHw0d3lLxqhoTYpm0bRO+oB?=
 =?us-ascii?Q?pdPTNRbRKfw++SrNl7IStcTr+cakPnHXl44XO2hHLqK6RXtABgqzCLDy3Fix?=
 =?us-ascii?Q?hTxGC3V0CEr40QDdRlgyCsBPHqYaEP8Tk8jpFqJW4Bp8ikxf8qmewAU34gPS?=
 =?us-ascii?Q?QK6TR+1zRf3VKq2fv2Mfzcn1AkuO3YCBnaH5CKxen0QppF6jr24tKN30eeAL?=
 =?us-ascii?Q?yStWqFfSieP8YbKaosN2QGxWzG9NZg9/fi6aTqii7oG+HsnfDaqbeeegNQhS?=
 =?us-ascii?Q?JOjIY8qvbLsmPWsZAQy2amnOsnpr7ln9uB0UW9cw9lJ5b51uLhIZOKF+GMfl?=
 =?us-ascii?Q?j9arcUM+nSTN83DwaqwMUbvb9Wc5A5Mr44DZR+rIamPAEc7azXQHiw9m3eMz?=
 =?us-ascii?Q?Pid2/dZiUITWOxKIgCTwCC4G+3XSwU5Tvag0WSL44TBBNmgcWEqcL50ExYJW?=
 =?us-ascii?Q?CybKe8XRF75h5GuKQV/rsoFH3DeIKcZrDiKAC/UL6SVSiBefbO2v6ZrY2zVG?=
 =?us-ascii?Q?SdPJM5uJxdUb6MSn33Lad8ia2LRhSGfxckh2fIEjNO87D69LtNRPQakqpOVp?=
 =?us-ascii?Q?a0WDtVoK0Viz0XvI9YaYIpaF9AIOc1w0KJGESzc2aU1509KdXYSa6HfCHrlo?=
 =?us-ascii?Q?THXZuwmGje1WtZZroybeEsG4x8CCWhMdB/cbFZDoZY6VEwcp6R+0vg8OF0JU?=
 =?us-ascii?Q?Q2Zi+hXNv48236zf8xrZbpheLwbTyjDy2Zpp7SmI8vk6GSVawogSzAeBIoE+?=
 =?us-ascii?Q?VooKIRC/DpDlXBHcc0LcAHoEgj70F7Od+9D2Zu9tWsc21Y+xW2le1Vja4DJd?=
 =?us-ascii?Q?q+VOCui10mJRL0SjQIHOvfdeSGxK6gVN8KTQgHzhTZo+yphhZ1fWX9bwbmmC?=
 =?us-ascii?Q?DK1kECIS55e2LrYlUUQeXoVPKYBl/JAr?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 22:36:08.3231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e03f218f-7e4b-447e-fc48-08dd5c361f94
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR07MB9916

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
 device-types/net/description.tex | 49 +++++++++++++++++++++++++-------
 introduction.tex                 |  3 ++
 2 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 50b1372..a21437d 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -92,6 +92,14 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_HOST_ACCECN (25)] Device can receive TSO with TCP CWR flag set
+    and follow the ACE bits handling approach mentioend in
+    \hyperref[intro:accecn]{[AccECN]}.
+
+\item[VIRTIO_NET_F_GUEST_ACCECN (26)] Driver can receive TSO with TCP CWR flag set
+    and follow the ACE bits handling approach mentioend in
+    \hyperref[intro:accecn]{[AccECN]}.
+
 \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
     to the driver through the control virtqueue.
 
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
@@ -702,6 +713,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
     indicates that the TCP packet has TCP CWR flag set and the flag will be applied to the 1st segment of an
     aggregated segment and be cleared from the 2nd segment of an aggregated
     segment\footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
+
+  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
+    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}
+    indicates that the TCP packet has TCP CWR flag set and the flag will be applied to all segments of an aggregated
+    segment. \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -798,6 +814,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 unless the VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the driver MUST
 set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
+The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
+which have TCP CWR flag set and require the flag to be applied to all segments
+of an aggregated segment, unless the VIRTIO_NET_F_HOST_ACCECN feature is negotiated,
+in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
 in \field{gso_type} according to the inner network header protocol type
@@ -1109,12 +1130,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
@@ -1220,6 +1241,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 unless the VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the device MUST
 set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
+The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
+which have TCP CWR flag set and require the flag to be applied to all segments
+of an aggregated segment, unless the VIRTIO_NET_F_GUEST_ACCECN feature is negotiated,
+in which case the device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -2191,6 +2217,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_TSO6       8
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
+#define VIRTIO_NET_F_GUEST_ACCECN     26
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
 #define VIRTIO_NET_F_GUEST_USO4       54
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

