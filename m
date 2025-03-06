Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB22E946C
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 17:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281576; cv=fail; b=dKWYFN6+SX6QP03+76OIT1F7bJ3qsJDRvjJv4kb3SRq/McRR3LKtZgdGEPIk37+qjhvJR/EvzDan8zJNGkR/gO0JlEMfLjSNLJg23NZ3aqPOEIMI4Lhmv1Hf12jINAIU3uYK4jK3HevigpxyQYW8hfqu3olaBUnFZX4MjxGVfXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281576; c=relaxed/simple;
	bh=pEWv20F2ZK88atQOVdhHeCN11BxCVoHan4EzKFzfMYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dllFXnwkUB0J9OrNuvDIbnLPkso2I4MtMugHUu+L2M7yjw/y47jLM54nzZ6CrUAyB0lBcw+0V/YnWKBq0VKVEev3Reg4kxSt6T36h+nsfd/4tTkq88Yi8PFoarZuQUAGUUTuVwGRNj5qm+KgNO83bNz5SHVeHF8baxKZ3KJGM5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=jExr6osD; arc=fail smtp.client-ip=40.107.22.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="jExr6osD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agFMJ9rAuYAB6HPJnnPILKLDfSqzJSdcq+OS/RVYp9Ao1zg9ezeOV70l3sFwAh7im+Cb9fxwHeYi6g1o00Ow2/lsun7f1NiV/8UTtMslcdlSC5LhvSbp2q8bm/JdnX3MK2DzV1PF04oiPzmpOINXZuZujn85IDuvGpZQjjcfdZKiZeAvrTddOT+nHenyf0n6XAt+LEqhVGbGnVZ6N9JbI7MREPQmI75g0aGhCeWgECDFE7nmMsWNbZ88s1wm8f5gkAn+inQiFna9HkQdO5MC3dpaKP0k8dS+Fnl79LbUYhW6KgYqkIwLvs/PgYjpMza7d4/yMRp/eAshYJBDr84NuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoHM4ZUuITWd9Zmqt8Z4cUMVLpd52kHlE4YZBi8154g=;
 b=f3QXlHoFsoiUVoVuf3PyivqBPhT6BVxTpYW2xFioCluu+vswlm0NGXf9/f4VnrrVS9KAxx369Ppw9IXx0b3hBpBEws560Syz5lwPcBij1YUyDqbqgz3D6adxE1xFhThVCLqrm+HtarLaP6Ax2hkCFItyOlQwQ4uUkZlGpoG61ciDzjIuhnOk2iOhBYJH2VWjh5uIHrBpgumMtuIgD4h1J/DsR4AK37G3Yo134FoG62R53p2i5Tdpwu+lN/ncMda4CHY3IvhW3JTtNcXhwUPyWtDk8cxV330i+hX4pO1ZF9P+8GdQo1mTCJxVrrkeymYpZiREmtul1QO66HMu+FtOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.6.101) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoHM4ZUuITWd9Zmqt8Z4cUMVLpd52kHlE4YZBi8154g=;
 b=jExr6osDPp++cjdHGV11oq63jSoYyjEb96OvPLQMkj5fghKULXLHq10cWPNxengiaFvCBTvViqiy4Ut+jxuFDfPG8iCBkP5C56Aajl7Ed2dvcFoW0QhitLOzvKKQMtqNWUh0Os46ySeRN/5GKQkcPYralLjcTfdGC32DainhKqe4ulY1lmgZ8AHcoWiru59GHw4yDL65hpFmFbT+mWcevNFSyMBVY8PgwbXS7vMRtDyoj87+f/2w1BhiNvDngFzPHpNjXnm8h+j6YG+RY2S+ovlzh4WVF0qtn0qiFWMNxtD3sS5sWpv74lHzwUyT8WeuLCvlH7yIdUTEsuQn7cWKwQ==
Received: from DUZP191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::15)
 by AS8PR07MB7077.eurprd07.prod.outlook.com (2603:10a6:20b:259::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 6 Mar
 2025 17:19:28 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::48) by DUZP191CA0016.outlook.office365.com
 (2603:10a6:10:4f9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 17:19:28 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.6.101) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 17:19:26 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (GMO) with ESMTP id 526HJJ0G004528;
	Thu, 6 Mar 2025 17:19:25 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
        mvaralar@redhat.com, jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
        eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
        koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
        vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
        mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v5 2/2] virtio-net: define Accurate ECN feature in virtio-spec
Date: Thu,  6 Mar 2025 18:19:17 +0100
Message-Id: <20250306171917.90460-3-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306171917.90460-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250306171917.90460-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|AS8PR07MB7077:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ec6e43fd-b513-442e-c2f4-08dd5cd30c26
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?NiS4goDp57M/NjMNzK6d9nFuEYsria0dMmkcT0KitPoU6Qez264U580/Tvnt?=
 =?us-ascii?Q?vFdP9keBDbjs3e3wwmmojFAiPEjkLapIstFvthpn2iDAvSCBr/SXOk4NwT/p?=
 =?us-ascii?Q?BEdh5BLZMnEtpy8xqT5LHnz1U0GChuEzDl83RT2VRfjzdI3kdAr+RFFQ1wu+?=
 =?us-ascii?Q?rPUGzXZsXin7OsUb294xnURf3Q34zX69Bc1WfO0+BapTq+Q3EEsqZN6jJ4/Y?=
 =?us-ascii?Q?11mZNhzXNNBQ2WcwAdGqhn85SVEUaO1STPLBbkjkkll0lANiTUZXD6kQgDjg?=
 =?us-ascii?Q?sKIY0wtmkGTaaqS6egvQs07KnD5otBKt2IPLHuT2VD8jD6bfqiglzqN3VAjw?=
 =?us-ascii?Q?kcbcuEk+i+kkvW8f1Ww/ERmoPNkLq8zzJ80SQTvT4PbSvQkkHDvimpNG49TB?=
 =?us-ascii?Q?/0tazqmvelgu8pTB2HWZR6bm9/4jpp9neK/OdPivOoGHO8RiJNSW899y9gqd?=
 =?us-ascii?Q?BaqBWEFQsbPc4mW1ztTZOHLD3v+FZhmqkE1ATpzmPPlSSAGDEdzd8FPQNGzh?=
 =?us-ascii?Q?eY8BMR7nsr7XR8yqpKfFnFFbwBxPPE0+VIVLEU+vSibEYCnTZKrUPSrLwPTc?=
 =?us-ascii?Q?x9AnBcTLtgQct4h9wqrdghi2snI92VUq7o9bny0llJx93kWD/reNu1JBVmvi?=
 =?us-ascii?Q?txsQvElm6Mt1mI9+G/Y+0rRvFUDJWnPWDqeAsXZW7RFaaThP2+OP6frW4/tQ?=
 =?us-ascii?Q?8tNTPG16yKxxe0YitNORy04KYxDMoRODpSWN+C3lzwcPypSNDfc8h8CponBO?=
 =?us-ascii?Q?DxspLIdv/jlsiB+4ZtIxk8pLpi6/GXOpRBVWY7HFHz8QPpT42UkKRJ0wtr+y?=
 =?us-ascii?Q?K/Ww5wj+8X3UFB13AXQIh5zkg0izGT3/9SsLnQ6DEghoJy83Zjx09gzZGMcm?=
 =?us-ascii?Q?fWe7OjFpso7HpxCyWiGXSExqD6qV+ZVgQQVn7nIe3dszl35upq/Zr4nWGOuU?=
 =?us-ascii?Q?kTIYULR3qDL8QjDgYoUtqwQEW2Ka2P0pbLFSF3TfbewCdNEJVcsOOVv8VS/N?=
 =?us-ascii?Q?o5iKQ/m1YXyWlRxHSBODn/cRFkumXkexiA79jPgiVdJdkcapw/D8yZEKTrmt?=
 =?us-ascii?Q?309mNpjC7MVQLbnns1/brm73P56HAouL0uqwlEX2jMYJiDDlrr7W9vB9X/Xx?=
 =?us-ascii?Q?CZT3Zalm5efsQawZFei9OOWDMiGfFePKvYxtDhxnnE2crr/9fCs68eMDLPi9?=
 =?us-ascii?Q?t+EQoipp5DVI7pCnbFMc0jjx+hKtM9yVy4XQxnbwkKH7+JUUYZOfJnpbAt4i?=
 =?us-ascii?Q?hIYurJdwCp2kyiBfneY990bs3Sp93GMgyQbZCH9iHLZrbZmburt6ssdccByW?=
 =?us-ascii?Q?Jt0GN2IRPIQ/O4H1kiPnOvrhtQEPpUdAuMBBbU3E346v9AQnna+eV4om/vrf?=
 =?us-ascii?Q?GcwSH9GhYbw9b3MXJDDBoFyHni6oTnsEiBZmUV1J8qf7dg6Uhjl/zRfhOtzK?=
 =?us-ascii?Q?eHSRHjIFvWi1zbvUMup8A80BD19dSBJMBG2wVyK5P0B7ATgGHGfEtQovYnj9?=
 =?us-ascii?Q?UPST68Mt1nl77sn3FuGUGztN27aOtRwGsYxP?=
X-Forefront-Antispam-Report:
 CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 17:19:26.5075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6e43fd-b513-442e-c2f4-08dd5cd30c26
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7077

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
index 50b1372..095a1d1 100644
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
@@ -2195,6 +2221,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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

