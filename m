Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2081.outbound.protection.outlook.com [40.107.247.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE0149DF4
	for <virtio-comment@lists.linux.dev>; Sat, 22 Feb 2025 23:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740267061; cv=fail; b=N0hojDmCGTc5bLTXlGxdwd5m8N+xaNcJE6Fd8k6sSN4I+eBLQLEyGwixP/YWKBfJfdCWqmEOn01oq3iaMwILrGAeVYyoCxLRO3K5nG2JsLGQYkmwdWliid0QnY7sZrxOlh68s1oOslTfieBaf70qBjt25sUixGBqkEB4S+UtKDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740267061; c=relaxed/simple;
	bh=COnzqQNMzHJYPQiBWTFrDlOzqg7UcgtkXhdXFJSfjJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPu9UCoSR4AI+4MtKs7zFgjUFaS+5s356PAr6Mzk0LaeRVQaqRgiDKfZsgHj+NGEdVjixGs19Qe6/CfcZmK+jdld1tzxMY52ww/FMYjshk+kK/TGbGD7dS0s6CF+uDT7OZtzs9DovZD3v5sThOtQL+MsN+XRwX7AhfqSPHLFoEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=DL43RVzm; arc=fail smtp.client-ip=40.107.247.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="DL43RVzm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GghtwXgrAy7CS3eVxpIYRy/Mnj7L6JdZ/BxY5oDDv4M1tAxFvjIlwd+tpE79qsdbBGZUCvWAXpY1qe/thNcOEl7uqNUBWSrD9ZfZ3npolfqIoYjR9lEcpnTEktOLm9q5Blg3WFUW/ThofpN1vJojhzPZ81U8zwjryF/MjS9SAEQjkS9gubEUDSOq0V7f+IhYBSmebk0leurDBBqoh2E7QPfWtItA1q49O3eskoHmVryOP1R6RzzziifLh/B6qxwnZ8UQ/xbF5TNzaOiZlPJSXnJMgcRo4huKqCMLoTglar5TInylmhKwJh/UkVwVWHm41Yh1Yhyi7F3hMDoKvSQzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CFMUxQaMBkxCTA1cvLV4bLGbCEHqLyyP/5oq0BlcwE=;
 b=ipCir+HOj8CW1tireM+7/GbWyaBY+F8T6uEw5IS7fshSwbLr5eWeZ6WoaKAcVM1YCt9hCP8W8nilkWO3aH1lUhYkYvbNeE8g16KkaBoWb7rm4fov08f/qeXyc+YTlTDIfedAIYkwzo1hZiZ/Ou6yScVXKI2tkF9HU0us7EBVqpBzvpIFTRLUP1GTtZTnhWaReJwZh0YBphY2KViPp4To4hZP6Q3/Cehi6ylCYig/YYzX8pClqXzGQIlAy4M1U3H9OLtJ2a6nzJUNv2iDU5F4xBtO9Gl8dOofRByHTeWn57GLUYpXWNJpOuZgDcpq1LKTjif7TOCyrzJw4VCt5wWj4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.29) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CFMUxQaMBkxCTA1cvLV4bLGbCEHqLyyP/5oq0BlcwE=;
 b=DL43RVzmgdUi6XwRTo/WKxvqExc4xvJHJ41o2OrVTIV/kdDt/zq6WEg20Q9Vn4neZxILfo2x1hj1sKhSk8QA1q0fcLZnUkTLnbREoEjY46GeuoFH8L9TvNL4Kuyw75sNX00hV5IXRnV+CGrHXvg6vHuXHSJtzocC0DhtFmx3MWG5ew8e4lYdFOeaz3h8nKJbYihNnkdsVZ2pDc9h6vpybAyL5mpn/bb0DN/GBpcZ5Ni/l7yfZvwyZdn0d4UMnEjT3O6ps4+gqISDQOOauXztrO0OPeUyitS0dnIe4wg2W6To6tDj7b8gh/S6WkdMmADAWqKqU9HffdligOBeN6Og3g==
Received: from DU7P191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::29)
 by VI1PR0701MB6894.eurprd07.prod.outlook.com (2603:10a6:800:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Sat, 22 Feb
 2025 23:30:54 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::1b) by DU7P191CA0027.outlook.office365.com
 (2603:10a6:10:54e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.19 via Frontend Transport; Sat,
 22 Feb 2025 23:30:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.29)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.29 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.29; helo=fihe3nok0735.emea.nsn-net.net; pr=C
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Sat, 22 Feb 2025 23:30:53 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 9299022572;
	Sun, 23 Feb 2025 01:30:52 +0200 (EET)
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
Subject: [PATCH v3 2/2] virtio-net: define Accurate ECN feature in virtio-spec
Date: Sun, 23 Feb 2025 00:30:40 +0100
Message-Id: <20250222233040.29738-3-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250222233040.29738-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250222233040.29738-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|VI1PR0701MB6894:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5ee6c71f-b030-4a81-2c7b-08dd5398f33c
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?iRDbnWqCPgBOo9NyTvRdDJNnTO791lR/25a0VgJCTLQAvBj5j6HOzqzGeyOQ?=
 =?us-ascii?Q?ycVCPrKC63EBYc3ACQisEfxbnP03GxV/31BhdS53rLYWpC5fx2DWh3Ubvzyb?=
 =?us-ascii?Q?6dQWHLET++NEj7DD8yd2O/sblk4Q2IdQFgC9iY5OD+1n3nDxWOUILdNvHcnm?=
 =?us-ascii?Q?yAgBM9SDyzfn+ZvgkBeUHhqKtH82HPx+I5LVkV94oAkr+mpC0dI1ayEokaws?=
 =?us-ascii?Q?nOXZTjKk1MSIwqsJD6ojjL5odNSg/aobqUPVW+VfYJ3D5YgKXJkPgVU2pQkY?=
 =?us-ascii?Q?F54tL06wHLtC7yx2+qNw22oX2WsGNiS0IYcgT1GjlCj/y30FZvAo+wLCUZZh?=
 =?us-ascii?Q?yRjtZGj7Sq9QIbt52mzcyi6xx59dInHrXzPkLocx5HE0DRd4/Q72OfNHKHto?=
 =?us-ascii?Q?RcFPFx8SDCPKlOMoFEaQSlBf+LZrJ0cZ084FGOAP3keaQpRUuMkQLPLdeAie?=
 =?us-ascii?Q?EjulaAysxX5D4lVgjdaNi7xWdzF50BG/qDE0KPtt9PDbhsbh0fNW2HhcwXje?=
 =?us-ascii?Q?zQz3A9JB/inxi1WWT4azGlZZAFPOlfgOFtj2YyK9HliOzjSpyKi3odq3schC?=
 =?us-ascii?Q?OKKbvuI99tZIjiDWJqdiZdcga5gvNB0nQSzeF8CLntHE1lGtfFqT8TL680mj?=
 =?us-ascii?Q?2K32yiKEj9wrbqJi3CXdq+7YNpVSaZ+AaU/KeM8tnQJcAP6TCussGWehwKa4?=
 =?us-ascii?Q?oY1nnYheEqhdEE+X4h9YdwLOsy7Ctxjk896sW1nT1StUGdFo2htyRp37c2PW?=
 =?us-ascii?Q?sh2Uu0jh1YwILn1oyrmBrFWnlIkXiv7DGof76wCYDgCgIt15zBdhqAH9qXVk?=
 =?us-ascii?Q?liyDe71qk+OoJ5mN4fhZQkSugxydA1uD4IljiIaCXmEbaOjMVYJjI8P/uckh?=
 =?us-ascii?Q?gt3/mCqW8RIYijK5bpbtMQNWo9TNBqCF9lrfjxCqjFdo1uuHVFRZwC5o+v0f?=
 =?us-ascii?Q?Bncr1p5W5Iw0UntKjSRKHDw4VYGPxgo1sUMYRp0xyUt/5SNe3tOzmVXTitzR?=
 =?us-ascii?Q?2hFPSfM7v8lHK3nwNGZ5S2+xdsJ8TUaionlEFfsP9YBwdjXGw9eycfKKgsdZ?=
 =?us-ascii?Q?HBOyRSrfXw2L3PcNOjwKiBT66WpBdLRfYzKkprNJ/1sb6iRDXKeuYhb6K4Z5?=
 =?us-ascii?Q?lpLDzqn8chHc1+1Fq3jKK5qV2Eax3AOYZwoiDINRX4Y5YZqoB+0GSsz+ayZz?=
 =?us-ascii?Q?KbrbQbsx3gs747qqmIosr5mOfLVNhscgEBVEDKl43c52fS301fnyEGkR71Cz?=
 =?us-ascii?Q?0h9OwkOQPuVzPVsuKvFjTGwiKHIvbyOAuVRUuatEImSebLu5mLoVo3u4FBty?=
 =?us-ascii?Q?3pkKCKmZEg9mRr2XlsD0ng9qkKe/CyBFPjtd3N0KZaqJ0YNdtf4rPULNRQJd?=
 =?us-ascii?Q?UYkefBAzL57WBq1QN5feB2UbqA6rC0ocSVCnN0bkGZW8HZ9pbzrK5bApZci+?=
 =?us-ascii?Q?mjp9hfDYTMQXQa4oHG9A0MSkrncqcTLQ8EsJrNUnSMlQiQ/4oJ5L+MJj2zg1?=
 =?us-ascii?Q?DOoAnO8hXzMX+9uIvGVfo2dTYKmRA3Hx7hWv?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 23:30:53.6326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee6c71f-b030-4a81-2c7b-08dd5398f33c
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6894

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

This change implements Accurate ECN based on AccECN specifications:
  https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt

Unlike RFC 3168 ECN, Accurate ECN uses the CWR flag as part of the ACE
field to count new packets with CE mark; however, RFC 3168 ECN-aware TSO
will clean CWR flag from the 2nd segment of an aggregated segment.
Therefore, fallback shall be applied by seting NETIF_F_GSO_ACCECN to
ensure that the CWR flag should not be changed within a super-skb.

To apply it in virtio-spec, new featue bits for host and guest are added
for feature negotiation between driver and device. And the translation
of Accurate ECN GSO flag between virtio_net_hdr and skb header for
NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to
RFC3168 ECN TSO.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 47 ++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 104a32f..f8294d1 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -92,6 +92,12 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_HOST_ACCECN (25)] Device can receive TSO with TCP CWR flag set,
+    which will be applied to all segments of an aggregated segment.
+
+\item[VIRTIO_NET_F_GUEST_ACCECN (26)] Driver can receive TSO with TCP CWR flag set,
+    which will be applied to all segments of an aggregated segment.
+
 \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
     to the driver through the control virtqueue.
 
@@ -151,6 +157,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
+\item[VIRTIO_NET_F_GUEST_ACCECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
@@ -161,6 +168,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
+\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6
@@ -284,11 +292,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
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
 
@@ -338,11 +346,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
 buffers to receive at least one receive packet of size \field{mtu} (plus low
-level ethernet header length) with \field{gso_type} NONE or ECN.
+level ethernet header length) with \field{gso_type} NONE or ECN or ACCECN.
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
 size exceeding the value of \field{mtu} (plus low level ethernet header length)
-with \field{gso_type} NONE or ECN.
+with \field{gso_type} NONE or ECN or ACCECN.
 
 A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device offers it.
 
@@ -433,7 +441,7 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
-  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_GUEST_USO4,
   VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
   VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
   the features described above.
@@ -592,6 +600,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
+#define VIRTIO_NET_HDR_GSO_ACCECN   0x10
         u8 gso_type;
         le16 hdr_len;
         le16 gso_size;
@@ -702,6 +711,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -798,6 +812,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -1109,12 +1128,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   in case of tunnels) has been validated.
 \end{enumerate}
 
-Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
-and ECN features enable receive checksum, large receive offload and ECN
-support which are the input equivalents of the transmit checksum,
-transmit segmentation offloading and ECN features, as described
-in \ref{sec:Device Types / Network Device / Device Operation /
-Packet Transmission}:
+Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL,
+ECN and ACCECN features enable receive checksum, large receive offload,
+RFC3168 ECN and Accurate ECN support which are the input equivalents of
+the transmit checksum, transmit segmentation offloading, RFC3168 ECN and
+Accurate ECN features, as described in \ref{sec:Device Types /
+Network Device / Device Operation / Packet Transmission}:
 \begin{enumerate}
 \item If the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options were
   negotiated, then \field{gso_type} MAY be something other than
@@ -1220,6 +1239,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
@@ -2191,6 +2215,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_TSO6       8
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
+#define VIRTIO_NET_F_GUEST_ACCECN     26
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
 #define VIRTIO_NET_F_GUEST_USO4       54
-- 
2.34.1

