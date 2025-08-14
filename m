Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6352FB996
	for <virtio-comment@lists.linux.dev>; Thu, 14 Aug 2025 12:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755172895; cv=fail; b=WyNrfbrhAD2l47giT5pXv9ozyBGM0FWTTsrpK+EZxSRgleIKTrNYAoCyDaAJY+JFSLZIXEiXhKN2zb2FRl4ei/c5KwQp1WqesuFbAPRnRkWGbtEZFNOj7Ex30CyXpNi2dfAxvcKWX/LGjRV/EVzZrWZA9a4ZA3ONTIXCFf84f4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755172895; c=relaxed/simple;
	bh=KnFIBOtcmY3OMsHnt9uf439PquM0gf2z5fwSwxXBJhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SAEYH/RcdlnrJEAvaqQHidkWWG1XA2lj77QrcMw/aDnOfKromnpldOHv5lqjsVB11cjzTYEO/l8wM3FLCKJa95RQNHoCjWlKQjHwEMFdQ0yspqnigjnF9oLlzA3EtVXlM8QKf1DSutRPMSzE+16B58w5nzvnQ8CB7UmrZE0EdeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=FCtrbDwO; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="FCtrbDwO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/74sZ0AVfttFI+3rLaV6Xh+FqCzhUlUz3iNABM0rTolFOxU8TJCyr3sTS9x1RP4njY/EG5or9PMSWBS8YzjdwmieVFuuGbz0Dnp2MFnfiO7NTcLm/lIJROayYUS5EYESEJHCzjQ56dVGamACsBcC62tne1yfhEBIXWb4DkTTlNpTMawB8cXY9aaRKzTVIp+lr2KnpmTnmBh0tN0L8+IN3RfhuLLa97FoEBgEBu+4N7Xor2XEHSpbjhT63xiTaU4H1Z5RCyg+q+lu+ltGeHnV8RcdhLXOiPvS7r1IeTk/wLexvvnvDmDD6Ksd9d+XvADQV4Fmw26PlC6SrJOBCghFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFMBD8pbSa+aCT8P7T0RlXYT0ayPcUx52/VMHBS9nd4=;
 b=ohEXLeONiZs35fvT+j9GrI9t1kw8ZKFCo6SbZ8e+fc8V4IIqBFv//nPvryzMORZt2ND0h+vXxehnGn5ALFKj/2A0/mVDgZrYK/by0o04iXsp/5Z0h9mNUNhydnwOyIRNWc0rwGGrPNvW812xkdkp8WKjvY9YsR0ynUvq+jHT3aZixYbaWAht/wjDQpi5fGwdx2q6NjilA5QRH7tnoG2Vkw62nLAKKIrym/Ji4W2BQ6xYOJ10dpA7GWj9UP4lCMPvGnJS5Ct3Z0peYbRjFKskm8zrQrd8wsjDFoYnKDkjh+I/+82+IK6188/EXZkwoXhWwHqsTyO3bA6bilTK4k9jOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.101) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFMBD8pbSa+aCT8P7T0RlXYT0ayPcUx52/VMHBS9nd4=;
 b=FCtrbDwODpLpSRWLkx7CBa/9wlFyJAUhJBalhcSWobLGPQVLc0qKGrAclI1Re1jNixTd2f/GsBf3XPeZ4B3p6Qeomb/xD/6CAZSNp/fe+f87Komr8bBQJZ/nPKVtJkWRv1h0Kde9JYkcqf1swP67Pz9ob+tsusgZ86H3wmLlu957VwXCxVzTFaMZxWs43spgBM/x9rbXCwuqiB9i15wFTR7h21znM5z4soPHZPXlCGrKSYNkndqu1Fy1obhCJ2jZbmvRkMD5Vhh6fuQc061tTz7yg7ohNUpVexJV76O2uWWjYER7tbS2NMfYJoZUFqR/8GCtZwLlXOzxGRZ8XiUZaw==
Received: from AS4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::12)
 by VI1PR07MB9803.eurprd07.prod.outlook.com (2603:10a6:800:1d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 12:01:27 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::21) by AS4P190CA0012.outlook.office365.com
 (2603:10a6:20b:5de::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Thu,
 14 Aug 2025 12:01:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.101)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.101 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.101;
 helo=fr712usmtp1.zeu.alcatel-lucent.com; pr=C
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.11
 via Frontend Transport; Thu, 14 Aug 2025 12:01:27 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (Postfix) with ESMTP id 757011C003E;
	Thu, 14 Aug 2025 15:01:26 +0300 (EEST)
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
Subject: [PATCH v10 2/2] virtio-net: Define Accurate ECN feature in virtio-spec
Date: Thu, 14 Aug 2025 14:01:18 +0200
Message-Id: <20250814120118.81787-3-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|VI1PR07MB9803:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de0d9b01-9f67-4080-01bd-08dddb2a4c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GdiPWBTL8AdH7sKR2QYYWE+Da7+rpmbsGLg9dgtV7OFgtBJUpS2P8yv35XEe?=
 =?us-ascii?Q?fHl3F7cr/AFFN/omHqsIZmiTqLcJjipq8a1/bFXWgDcaBIhV45EVzUaE/2qv?=
 =?us-ascii?Q?hyqaZvUPFtxkI+o6MekpA+8kW92exwX5vGf9dyNG0O1Xv0p9kfOns43+PzU/?=
 =?us-ascii?Q?XBLDxBa3yxzoTTrZh+KYux8mp4gG775YUtoUOE4l5H4woS+6z+VeYsFFzaHk?=
 =?us-ascii?Q?t1KURdjiSK4P2Yw0pcF9DOfrYEDIg29S1MMcb9VFeabfFC8qKSdhNuD3uDDt?=
 =?us-ascii?Q?E1gXhaesgG+ueupg48Y/bUpCJYH6egDtjFeAVeFdxNUsvFCmnd9tDYcOo9fb?=
 =?us-ascii?Q?9Lj88F6UZwLRz5cgRwt6H5sQRlgZ7txAnn7eZ7ooFRDWCYWT7/tgYSBBIp0/?=
 =?us-ascii?Q?3ZhKC3qL2SUvFUzX5+1hgSg1z+JenA5tx55+ArPhEaUEOq8ax1HFZ4IaSOrs?=
 =?us-ascii?Q?qP5A9FIWVRM+dazgSQTAgpirv/58eQ1IGajOQMg+FOZbKxfiFW+3cFvot7UB?=
 =?us-ascii?Q?Gi4eOK7AtPmXC9oLSkbhKCxyL6uUzXkV+OTOUeBq21YGbrP/W68+WYtLtGTh?=
 =?us-ascii?Q?qDcErtXgQoI/1mPaNq3Hs7oC/Bq+By0kAVl3gZzv8Q+uTNVy02neeTXh94U/?=
 =?us-ascii?Q?gYYi9eGdAYR4VvqHT0uezjj9zV07CtxBrDUe4lLveFz/wKL7jkT2aKMbZdJa?=
 =?us-ascii?Q?Oh1l35vOm6SUqwD7MB7o4mPF56BgKt2dyiKtXiRugs5FLINu0sj3Ahqzxncg?=
 =?us-ascii?Q?2shJ/cQP9JSpHzIp9NJgBkFYURQndm1aLdzolynr8oDGcBeeRD/5LRKnK2Z0?=
 =?us-ascii?Q?suUNsBUV5AKgZyX98rChUJV7+o+t2w3KxebvNIKzvOxdfJwIdzC3Iv+Uu5QC?=
 =?us-ascii?Q?yEl8ju7BsaLWO4CP19DnIXrBuPWZDM2LFo/WVgDaUzrBBazkDALAD8hKdt8k?=
 =?us-ascii?Q?cXty23E7rFaxntmyGtT0wIc56cMjfe9AeZ8HhEVd2da7I0Ztu9IQ0CSmKo/C?=
 =?us-ascii?Q?T+Pxrb11QNTvM2+ePl6aDN41ybi6WJvFZkaztCAjvYehx1tI0+w+G5qSZ2JI?=
 =?us-ascii?Q?zzNYor8pXh6acqwfZky5BIsyI38bg4FfsMoNzaDyApoBhAntnGpACkN+nYGZ?=
 =?us-ascii?Q?HbR5qRmAnQ5xNtIVGtDTlq0xeLI9eYhrivgAVGvhdYJVQM4qyn/soqE3oAvf?=
 =?us-ascii?Q?tKzlKIICfX2hURTq6B900L8ILPRwt312NGImjfn2pZBITEcicuOe5zYo6vX1?=
 =?us-ascii?Q?92FS3zBMStGp74CBawBPTeUrxvYvtKK3doxBEkKyNMt9QPtqtXOPYawLDOMT?=
 =?us-ascii?Q?FlkAqXR8cz7esnC7EwZ2IXdyO/2sbpNHx7fuUoaIvUYeYATT9dy44G79a11x?=
 =?us-ascii?Q?DAsQ8Wong44V425tvSL6IzjhteRPwbPmuev+zBMxegBvhOx/Q+ylB9w64I7/?=
 =?us-ascii?Q?fee9MRYS7RPPFHtgCLHC3+vOPG2MF4BaiE2GI6vKZ2nSXEE6EGXVwaf/PXwU?=
 =?us-ascii?Q?YNaP+x7PiOgYTy3l4EEIUkozpbtxcNwjKIzehdQROFE/xfL0+zQuWjVI/g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 12:01:27.4758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de0d9b01-9f67-4080-01bd-08dddb2a4c8c
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9803

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

This change implements Accurate ECN based on the AccECN specification
(RFC-to-be 9768):
  https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-34.txt

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
 device-types/net/description.tex | 54 +++++++++++++++++++++++++-------
 introduction.tex                 |  3 ++
 2 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 0da8f9f..6761148 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -150,6 +150,15 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
  when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
  also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
 
+\item[VIRTIO_NET_F_HOST_ACCECN (71)] Device can receive TSO and follow
+  the requirements of the ACE field described in
+  ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+  of \hyperref[intro:accecn]{[AccECN]}.
+
+\item[VIRTIO_NET_F_GUEST_ACCECN (72)] Driver can receive TSO and follow
+  the requirements of the ACE field described in
+  ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+  of \hyperref[intro:accecn]{[AccECN]}.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -161,6 +170,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
+\item[VIRTIO_NET_F_GUEST_ACCECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
@@ -171,6 +181,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
+\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6
@@ -294,11 +305,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
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
 
@@ -348,11 +359,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
 buffers to receive at least one receive packet of size \field{mtu} (plus low
-level ethernet header length) with \field{gso_type} NONE or ECN.
+level ethernet header length) with \field{gso_type} NONE, ECN or ACCECN.
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
 size exceeding the value of \field{mtu} (plus low level ethernet header length)
-with \field{gso_type} NONE or ECN.
+with \field{gso_type} NONE, ECN or ACCECN.
 
 A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device offers it.
 
@@ -443,7 +454,7 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
-  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_GUEST_USO4,
   VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
   VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
   the features described above.
@@ -613,6 +624,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
+#define VIRTIO_NET_HDR_GSO_ACCECN   0x10
         u8 gso_type;
         le16 hdr_len;
         le16 gso_size;
@@ -737,6 +749,13 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -837,6 +856,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -1171,12 +1196,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   value to indicate the outer network header offset in packet.
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
@@ -1286,6 +1311,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 if packet contains a valid network header. Otherwise, the device MUST not
 use \field{outer_nh_offset}.
 
+The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
+which need to follow the ACE field requirements described in
+``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+of \hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_GUEST_ACCECN feature is
+negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -2286,6 +2317,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
+#define VIRTIO_NET_F_GUEST_ACCECN     70
 
 #define VIRTIO_NET_CTRL_GUEST_OFFLOADS       5
  #define VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET   0
diff --git a/introduction.tex b/introduction.tex
index 1c4cb33..fabefe4 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -183,6 +183,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
     S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
 	\newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
+        \phantomsection\label{intro:accecn}\textbf{[AccECN]} &
+    B. Briscoe., ``More Accurate Explicit Congestion Notification (AccECN) Feedback in TCP'', March 2025.
+        \newline\url{https://www.ietf.org/archive/id/draft-ietf-tcpm-accurate-ecn-34.txt}\\
 \end{longtable}
 
 \section{Non-Normative References}
-- 
2.34.1

