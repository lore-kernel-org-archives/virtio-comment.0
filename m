Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0B01FC0E5
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741264868; cv=fail; b=cIPE5rCFm49iSStcYaNkvD9/qwhHkQIDan/L82dgMJj8tB1/b+1yZ4jVWP5wN+NxSQR7HJgeis8aHc4Hd4RAg/+pnFMBTNZYze1uFPUFlNNlPK5P3f9EfhiKr18KzYwP3WX3NCoIxRHfasM4AjQtFb341BkOcgq2EbMkJfSEvuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741264868; c=relaxed/simple;
	bh=pEWv20F2ZK88atQOVdhHeCN11BxCVoHan4EzKFzfMYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OynRbBKC8uDoVjwpa2IHF+DLYyE1NVZWUAHq3MlQJ3fyz1t5hz26K2iKNSstDpPu79bmYR0HxdBt1NGpvRImEY9CTklDnX3K7MvcsdZP/lO7lRDZxlmXscork5AdyfnPJbTErY6qIXPV2qNlR2xH+75403IcmgbRO8UoY4C+rXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=I5Ifvssn; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="I5Ifvssn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/nv+To+xDGpXytjM7WFyVXyV8SIXyeHSdtkeirMRZpKCUWlVTDW7mAfAWUtgkpBV/iPwxW3aRMJF1QpYFJQG3kml+AOx3kOwH8dFDEZ3D1TkCB0TiONC/s5DBkO4AxrtVWrGCxex+J77SPLSKRYSgANDikkFnqOEkiz3yJCKVb197JupWJelk6ETzN0ypTwhuK9VnnNQdx4iDe8+rZXYsasE60SHFFp5LVrGZpZ6JeRRTbeL/Z4x+zWteLVGX+RodILhbTLWwtfWYBnWxhBMRipwHabphyA+0v9vUvuplr1VckKf3uYIrRTl3wQvFvpukmoCULtcpBuMTO9DRGhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoHM4ZUuITWd9Zmqt8Z4cUMVLpd52kHlE4YZBi8154g=;
 b=EXZkr5EP/y2lWDYTza8VXjLpNQVyHgOKlrpQLQvTidxS42Fo9eVhXTdldqcR1T58JBBfJPpF3j2RJ5jgV3jde/H3Bzrdpa7W42mAlbRBk/MUz1yIG5uOcT7e0/wPi8vbgcoi1apzMpPyGLygRfQFYLvxiJeeYuTXmKdh6/BHPfZazc7hFHYmmx3qOeZ1sUFe2UN0UolTahjERgez4fwKUt1yB6kd51U6wJ9/HHUHqDPfa588TYUcneWXeCOPjvsGuh3UY+MwQAgYvZWZJzKlkyqatV3bBLyc/TjVCpaZzuyqH6+nNlu1CJouMhQu2CqPO9P34Fk3V23GFqzvPy065Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.20) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoHM4ZUuITWd9Zmqt8Z4cUMVLpd52kHlE4YZBi8154g=;
 b=I5IfvssnI72i692vLsIgkmvQkcuktKk3yhyRHdAkRAXoPNTp16ClGy69whSNlpfQW/pnN1q/e0CiQPGiy5H1saV4Oal4KVufQwEIxsYI9dd2r6NlJPIH6tuQ+MKGAG+iZ1zjb1iWFKF5QeC5B7x5FGHzgmAjQwegQo+l5BWPg5c1jQZnPQ257q7OIMozVQNd2IjREicuf+t9ehjtdBxhIKSJ7tCQMapN1uqfgaPdGFLT20fypI+TiF1/UXimsaSKsyAmCq3665s5knwuGzH1mwEoi9L53sL9BZ/BrZvQF1wqvbLkt7JLV6lBnQfo0WOR4Fs5moEgOustitsnkD1VIw==
Received: from DU2PR04CA0233.eurprd04.prod.outlook.com (2603:10a6:10:2b1::28)
 by PAVPR07MB9238.eurprd07.prod.outlook.com (2603:10a6:102:318::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 12:41:01 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::e1) by DU2PR04CA0233.outlook.office365.com
 (2603:10a6:10:2b1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 12:41:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.20)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.20; helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Thu, 6 Mar 2025 12:41:01 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id 9C67A24040;
	Thu,  6 Mar 2025 12:15:27 +0200 (EET)
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
Subject: [PATCH v5 2/2] virtio-net: define Accurate ECN feature in virtio-spec
Date: Thu,  6 Mar 2025 11:15:23 +0100
Message-Id: <20250306101523.88798-3-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306101523.88798-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250306101523.88798-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|PAVPR07MB9238:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c6c9c573-7ae8-4bda-c4a6-08dd5cac270d
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ufCqazA1icuna4IcmbD08GbANCTgbR8UuZKAwhEdE0iuujreOQ1Qg6tNUxSu?=
 =?us-ascii?Q?Rc/L1folRuHeOytA6Z0yKqkkPLIA4lC4MSeD1KVwvvgN6tMTusqOGVgghtq6?=
 =?us-ascii?Q?UMX4yUeKKUD/AsmL7k7UA3w1slDzHvJ5nStKA7iM4iaF/wL62OlP1l0Kctcg?=
 =?us-ascii?Q?OfMttqDkkv4DlFVJQuS8rn1rKuJnJm0HTJ6ZoAlMBjkqwLB2AvGXV09YIFk8?=
 =?us-ascii?Q?YY5SNKM/5dSSvxYqJ9ggMIUNJNY2HLBwsVDzBlbCfpjUnSIw2xpi7dELl822?=
 =?us-ascii?Q?O+zPKZXNQdtgdvlv5j0R9NZH5/KXBpDCgF0O6RMo19HRGM5TpAG2D5l4Kcb1?=
 =?us-ascii?Q?7vMROTk5X8QN5iBCrW50WLUDpYBJR35cShCYsTnLVzmqiMYhfGt4LCKs1gwj?=
 =?us-ascii?Q?k5KLPtzKgkT+Ewmf5Gih2l9MgTdK5SJ77nRaEiu1TkVPPZmkHMXIHTVP/ZFA?=
 =?us-ascii?Q?3bui08wL+YfgA7KRav63MVh87RyqGAjalNdREG6U8Gn3R3ykaN/6lgzCvAv4?=
 =?us-ascii?Q?77fD7z6eR0JWGy8txaQlD9OeLjaFvAjdcuWdFtdFD6ICuic4Y3JkWobPjN3W?=
 =?us-ascii?Q?anLCdASQYEEIpeQ25DeEV6u7RS3WNhY2GMQjhESUaXQ3lRGCXnO+O2j55zTE?=
 =?us-ascii?Q?f34i4pOcgQJNgwoG4gAGFBjFVVgHtfgx4kImU4dckS6F3003h303dI+JEyqz?=
 =?us-ascii?Q?CaNpLD31nmmDEQ0DcOMzed1lEimzQjAe2Bbyn2mYdsdfRzztrdOUOzEZ/DCN?=
 =?us-ascii?Q?xL/88jqpxujtXprx/ByJycHvP4sHxoaAZci4dWZ6A7jRRTlPmMRCTofr00r6?=
 =?us-ascii?Q?rCpfYAia3DOkjfsIHJuV9ogSkgXGzPNSrzO7xbC9AHreB5Ej+P7U+7EUC9p6?=
 =?us-ascii?Q?T5zpR9ueUzAmGnluf/i1BOSq5MKibBBSe09a6FSAjYeK9of6PxNBPVw+x3Ir?=
 =?us-ascii?Q?Fi0bpLmRRr87xPUalzYr7T9fUsS/2SLNIB3il9REe4pk7yHqj3kPW+dRPohX?=
 =?us-ascii?Q?taYpOddXV6YhH96RpRx47jyzPLrMuwn/+w7LIWZIRjcmGo9lZcJPQiYknrBp?=
 =?us-ascii?Q?gV/0gCDNfYTu7Y0AeT5Q23vO1vqd0tTFGtvJE7yZrVAx0vjAXs1h+v3kMhqU?=
 =?us-ascii?Q?dwj2Bg2EkkCewP3tRJxDF7b5GHX0ma6YOMMICbJp9xjgT3QXYoNvyUFxF3tJ?=
 =?us-ascii?Q?kk/Xi4l1BLIg1oWRFti49YksyiY8fhr4QKe7V5/wcySVRwvBbj8c2CL2v+gV?=
 =?us-ascii?Q?mSrj6C8LHkRldBYaKIS+nRmTgp2LLmiNlnnhryN+uCfgFE3z7+5TClMJDjg1?=
 =?us-ascii?Q?UTUSG/R+K1gvnhqEGuO+YFrVMGrrY+WuJUexn7/ByYqyF/oxdcv8iQmNMrdD?=
 =?us-ascii?Q?k171xvaQdEaxJ3SI+8hagpNeiQH8kmrqwYgclSvrFpV3YXjLWXASkgOAoyyD?=
 =?us-ascii?Q?Ufz4/5gEpk1XK+LfxmeS4c6TfTm7BUbIoD+E5pNz1rbYd1ebTk3KjKJ7dViA?=
 =?us-ascii?Q?tP3UK24AF3QlVF6Bju6bYP5lvzeOJ8x1arSx?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 12:41:01.3322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c9c573-7ae8-4bda-c4a6-08dd5cac270d
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR07MB9238

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

