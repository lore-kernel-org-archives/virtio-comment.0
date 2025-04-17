Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C9A2063C2
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744927071; cv=fail; b=pmXJFED35Te5UAB87jnQr/DcR1Sk3IIsoBDZXetoqtUDPGNap1c0Vyw25slAwarwMf7GvuldJW/12uMMajs+C8uMDdjurMXy/Gz02yUtwSw/IxunKaJ8sKI9azXPPOj4deqxRJjrM3fqqSbCydJBzKh/4YZ6osP2DDSW5Nsm9z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744927071; c=relaxed/simple;
	bh=50Zsiu1Ozh8wtJhHikhNvbrARtrTC1YaKNyEj8UT8jc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebfN/rZxwV28EH6trt2CFozsNz5+uFaioAlrJBkAa40gbqXBMQRB8MMwh68cT3tJcDQz7hAXh9OQHXMBCIE9AOcuLKxSkezqjAL0j/JdKnPeEtx0tbWxOxAxrZs1ADxKrL4J07E1s+eEqvC9bkhXeRWuDcOmE9ztEQAEkPfVNyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=WDCsKeRl; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="WDCsKeRl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuH5Mh/qkYPXdK3KetMERdEK3rIMAwb6Qkcmx8BghOQ6OW/vT1hxBWi8D4y/8Xm18/yXqpZgRiAtRCmD+/KFgNAZTOTaiOFpoeNCBlKyqbg9EgyjfbfxyGAwv8ll0ShH9yJHYpgOPfvVHdPgFHfLmq7rgykWgwjEv+kAPMWhzFvfKVTZEjkG17BvMpuEwWDZi9hoqq/Y5HanLxLGxw7nZhZVnCrdxBH3sUKfBcT4EJmcRKVOHXuc9sWrx7n9X0ILQpYHetXDKm8F1UFUNkXO/NSENsQrDWFV0DQBbwp7RwI7JHIFcCQ7AD8JYdTwSWtCZPJMj2B4Jo84llenLXBakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGF5FbavGPsXatO6OaQSaXcZ04UQLeLrKXkyiceNDjQ=;
 b=DMPiV7mI6+D0WV70yM0PZmOb86VujDfXWwfDzzrLT3Hv0OnkI6fMKy2FXNldiMqEor89oDiRV7aVVGppriPoprr/Ec4xF1857n/QtMgy/Gn9uHR7p2j5DZFUO07fF4ZnAdQAEjz/1y94cRWbJ4w1P9jkZ6bZrBg2CP4OPk8G0LpGobXHlkYl/SpR0LrtEjpXJajMJ4WceZ3Svsg8PwUphpTYSkiYPRRQWgI7ErL0/+GI7i0P/6q1o13QGHerrl1Ygx2WJRI7yG1GpQEJnaBpNKmNemK0esbS+sgttdK89T/QRvRMgl6Sc9izQAsGmEIyN/dnbeUSVa4KvXJhwOT2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.20) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGF5FbavGPsXatO6OaQSaXcZ04UQLeLrKXkyiceNDjQ=;
 b=WDCsKeRlhzVHh/HXa7wxGeYmlHFxjJwZ/xIZ1p1nrShWorLNkmGtEQzkY/3NzxEUTg+BmkNgBtKgAkuLLkGJ/WsEesWh+Df898XmtAL1YeDxinXtvTJjCwdBduja57d4/3ld19QqccLwJImVUurS3rHdJ61YVxb7BukpBJvNvK1kxeCei4SoBmiyBpzz8sJOXA9aLVwO0xxfUdhSpzALBw9IZNgD+f0uARbJTY137il6w09fXxOdvs6gQSqTD1gwXSr8mHieORGoCn7PgCDoQjLLWMX2kUrcXP0nSy0Uh14WAxn4TxrYboAb1KfVAuNouMnYbWgiyKBL6wRWouTcfw==
Received: from CWLP123CA0045.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:58::33)
 by PAWPR07MB9901.eurprd07.prod.outlook.com (2603:10a6:102:38d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.29; Thu, 17 Apr
 2025 21:57:42 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:401:58:cafe::f6) by CWLP123CA0045.outlook.office365.com
 (2603:10a6:401:58::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 21:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.20)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.20; helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 21:57:42 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id 2A0BD2004B;
	Fri, 18 Apr 2025 00:57:41 +0300 (EEST)
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
Subject: [PATCH v7 2/2] virtio-net: define Accurate ECN feature in virtio-spec
Date: Thu, 17 Apr 2025 23:57:35 +0200
Message-Id: <20250417215735.20982-3-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417215735.20982-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250417215735.20982-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|PAWPR07MB9901:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c4906885-f3f3-40b3-11e8-08dd7dfae0be
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?yvZZfMkF+cjKiTnctNtKXk9vuSDXOh+ChYelejEOBNH6gq95uJjygdIMsOzK?=
 =?us-ascii?Q?8TCRsNvj0wwBrF2RadB0wef3Z91R0Eq1h33iRirCu9dei647tjRMuoJpeVN7?=
 =?us-ascii?Q?WpFTI4/phmEGVyNDlPUgskDEv8fcRsCEM/VORoZE2xlkGZzh+YNnQ2S607xA?=
 =?us-ascii?Q?wn3Ss27Gni7OydOqZgq2Ca/itn2Ec3WiWDzY3A/vLeYCxl2I+l1xi2yLq7+e?=
 =?us-ascii?Q?gdOoX1+Kt9D6ojt/FFxe4iYh1ZlckNHRBtOz/tNkxkWNr85mrgqJXxJ0rZVC?=
 =?us-ascii?Q?qYqUXLj74ALD4JYw22jqk6IqEpJuIaQvBrsWjHEsTAgx1b6VzhBzBTJLc0hL?=
 =?us-ascii?Q?iYYEEyOEfAWTcuczxQsuddiBpZfYo1xEfnLAuTpk2ngKrMWbUQIiaQ/1qFtU?=
 =?us-ascii?Q?uaJQOB7MelUQgpJjvgkn3cBjQAVYAQ+Xki5e3TAFTFwMKGoY/A4CUuWVYPLv?=
 =?us-ascii?Q?+ur1/5rm9Zlv4E6LLKUs+9zamNcHXilsxxbmK/6QFANJxdLOCqB6ijnNGGRn?=
 =?us-ascii?Q?27++cx882xvQkx7UiD+a1GSBV1KfFPOtwRIW6Jc7suu7GqBjeRdYf21cA0vb?=
 =?us-ascii?Q?x1pokPxfTSRkc4TZ5kbezTsNybdKaQQ+R9dmuvBXOZKQlKnYGWywgfEs2jkv?=
 =?us-ascii?Q?Dhp2BGuKntVLfnoaTEtcyvhHgBDeV3uHJ2LwhsiECJ9+yN24QtJmyj+xWcEz?=
 =?us-ascii?Q?B1fnoOd7rHVo6JpTrU520BBMxGE0ZefC2ig1IY4EscMXzlTKAvI2s2lDJW7i?=
 =?us-ascii?Q?gg12dAku+E/OYZdKGcs7TJccEGpMT6UrPSkIDi1RmB6HuhnfwR3ORjL5nIyk?=
 =?us-ascii?Q?97hBbM5oEMhc6FmsagO74veBeK/tlFiQROn2SfKi1BoM+4vUX3wYy8qeeLpZ?=
 =?us-ascii?Q?zhYfn+5LmYwuwgMh7agkQnynTJpNB5l51QQhZKJn4mHpH8OA3GoWpBLYuag6?=
 =?us-ascii?Q?pPjaCiQRVcH3yHlgn9CrmOfYw88oCe45zPGtoDCNvyTuRRbd2kebRPk1OduN?=
 =?us-ascii?Q?t9tzvJvsG7hO4FoQTaODgwa2jBjtu7ITe0HJhSw8C13UeZVqPwujl+e/aSyC?=
 =?us-ascii?Q?tcz4/PTa5BclsqJw3o1CZHn888dCXEd3/HjMd0TXEQpKdLDVQJqNsipYoCIn?=
 =?us-ascii?Q?aDz3e/d1IfIdcv8Wc+jpCPzUseCV5tihs48NNq5oHXAY7MpYo6fhEMIjSxd6?=
 =?us-ascii?Q?Pwa2VuEYbOa41RFGRecd7cieYQzEBi+zvSVLqP4wdDpwn8MUnu/aiIOaVLM7?=
 =?us-ascii?Q?BsCN/R/5PVoGa3wwW+mDV9cZt3rJLiYAgBOPE5HSwHN9ZmfheHfLVYOT1tgT?=
 =?us-ascii?Q?jWTK3eFT9Rn4E1nj3bxfy88dBx42pQQ7UMx3BA8BHmUtIZb63pupJ+6+uhBF?=
 =?us-ascii?Q?MQGgj8lMxkpxdGAEOSjvDyYFwOSgw10JVtF2S7McLq9mxmuQ+hEytOJjV+7P?=
 =?us-ascii?Q?u8qtQWHL+eJLD2ltUlafMl3doYYhoQpC4RJNHec0RtePwz3reEL2QTyNKRb2?=
 =?us-ascii?Q?Aj+F77c3fDr54YGU8TZNe5djwCyAphdW5cMMMLsnPe0TAWcs8XmTnkIcZw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 21:57:42.1389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4906885-f3f3-40b3-11e8-08dd7dfae0be
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9901

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
index a2c9de8..61e2aac 100644
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

