Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793116134;
	b=mDSdx+WwZA89IcCjtrkp0XJkykgnBm+I+eXPTZAg2NVB4KxCY0m8ldeywrVpBSQ25X5+
	 g17twwgZZQYtxUrm3ZGHimOoRatFQ0vZZv2/w8q5A8/3VbKbTZQ1NZK2jTOuThSddTNIb
	 GErMhIZSUrktR1c+0P44Lq9L4hhBZTvAzftKiuYSB8s4DiFEVTOL1PshP/AdWjFNWgFpS
	 QmhYMMtgepEnVbbWAln5bqBR2Ijr+DRLsmBX5t1/lxoqEC6x3yXUW4mlP75787rdd8XiU
	 U/82kuMu0OtGEANOVP/Zn6Lmn2vR3BFVzsm3bL7LfzNiogz20BupYE96iBSnTr5xRXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116134;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QRGOeYk1ObZDvITDA9YYlvcSBgdYFpPASTBYy9nCgXw=;
	b=u8UUBuPOEbRhImIl2eCREu/tm5lAGfOHOzrar7936JUMlasHcg4YgwhZg54EBarWNZfq
	 Q2IcWKZOmxgZ7DECdBtqUxmiPe4/s1KHEH43swgDXP9WpfYsU2o664lnqJxWpZQVwNiJQ
	 uKVbC6pwca0Wd/youM25atByh3KROHlmCMeSF4H2tDwtiBSyE0XvIl8W8XG7BBTNWh5TM
	 0QeO+j7Va9aB08cNT97N5wc7DGtaOsMsVLBf0BXXzetpTBosgFShxoUKxazgYbpVp9kTK
	 D72iGaabamhMRjt02vDSYvvEMWTrL2H5e26I0Hp4HjxOa5k8yV9lIkueVAOHYAML5zQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HBpONxhG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.70
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E18606A31E
	for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 15:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E18606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HBpONxhG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7h7GudY2M7qmUIOzD1w663eDW/ZBeIih/YmYYLhUdRi2b9YLw22L14bb/mAYT94QQMiqWUD55mYEWSpqXEsa6PHeip2UwgX2t5VmGS5vL+Fjl77kkpPwkZbK/o8tcW+tZlFGXLTYu98Kt0LtjizNPFJjfQlzPIqa0grjqrUVZAhRD/dAK03KJ4+ZkevJ3XK3N5ey0acztzbgX3nw3f632n2Ul8tk6QYyfNgZqdVtyGtmS1RxLa6wMs85Lu0vO9tz+bq82EnkpknrK5XmIWaNG47sDwXTr4k8wgI9ZAEo8ibKojAbBm+jB4cJju+IszLW2gTfEwcDKqlmDxBqtW3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRGOeYk1ObZDvITDA9YYlvcSBgdYFpPASTBYy9nCgXw=;
 b=xqkriCP0iue8ZDu3dgHW83Y9DMfB+cOLfdG9lebSwpXedtEOl5IsZwrt3fvCys0TZSAIBnX80qOT0OtE+hyqQMjPk4g/0p9TAJfG3VShmaAnDBKLNGHInGERQKRVRImO1Bi0RVkt0xaxkEtWsC0zuFs4WXm7rQUazuFkbcQt5QqEKF4MLl3i6WZTmw+i+7ZnTWQGULjoc+EcvDhz5lyQ3kYsprhgwSg7R3ciCt1AFJENLNtYUGdZHM1H4j3UWVOJu8+xOQePZaEphLaAN6+98+UaDNwz//0QVyPJaUmG5UwSXqYYmW/Lgw8e9SsXZHgGhsojE5md33PykJVEkp7zLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRGOeYk1ObZDvITDA9YYlvcSBgdYFpPASTBYy9nCgXw=;
 b=HBpONxhGZzZQiUtXPhII7RkkgAEy1fVuxha6okUuXwfLjmVJjc7hbKmulfIbNYpqyT5fEt/iBRUTwH4nWOgtY0HSng2diITZdOmnEgYk+wD3pOEpo78ElYeTcdipQ1S9NaQFEESphPzj0ls83SLqCU+9L+/nqcghG5eCQ7+hSz8=
Received: from CH2PR10CA0005.namprd10.prod.outlook.com (2603:10b6:610:4c::15)
 by SN7PR12MB7883.namprd12.prod.outlook.com (2603:10b6:806:32b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 15:48:47 +0000
Received: from DM3PEPF000265AD.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::52) by CH2PR10CA0005.outlook.office365.com
 (2603:10b6:610:4c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 15:48:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265AD.mail.protection.outlook.com (10.167.23.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 15:48:47 +0000
Received: from AUSALIEM01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 10:48:46 -0500
From: Amanda Liem <Amanda.Liem@amd.com>
To: <virtio-comment@lists.linux.dev>
CC: <mvaralar@redhat.com>, <parav@nvidia.com>, <Nathaniel.McCallum@amd.com>,
	Nathaniel McCallum <nathaniel.mccallum@amd.com>, Amanda Liem
	<Amanda.Liem@amd.com>
Subject: [PATCH v3] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance label
Date: Tue, 27 Oct 2026 10:48:35 -0500
Message-ID: <20261027154836.13778-1-Amanda.Liem@amd.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265AD:EE_|SN7PR12MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c04ed00-fbed-4149-c769-08df3441c9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|6133799003|18002099003|261026140227099003|3023799007|56012099006|11063799006|261022075727099003|261021121427099003|261021123027099003|261009223027099003|5023799004|10067099003|261022115727099003|261022113327099003|261022105027099003|261021135927099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	pioCtnd5siXbBDorqPrwKKcb5i8V+8/6UnyMto6TFZQGAPRius8pKSrZ2AoG7iACy95JIzmOtaiv7wCG5i2KOKjib1CPdxc/gtCNXO03Ir2hqmIw+zcPSmqxW/wf3AfNZ4RfhuNcuSslEAfIGoEbcWq+9JwzWe3VlsJ+y9YyubeD7KnQaI7BwSLQ91efnYojUyuK7YY83P4jMJbreKQN78FUxYE78Es1N9r5DRK+E/ND1bLunGhq4SOkKTeoOIC9U0NqzpE+JnhUjMg80n5N1niJ01sA7MftE7GElQp4KcY8vBU/5axVHnKnpmMNf1nmWxhvXo9eloKVG/+U/ntKXupeH5VqvoCf9Iq2OSccu8Zbz/N31yaoWMIa3ZlQK7rG+wN9p/e8clydiiYAMx7CrsZB5q/v8363NEXO7eeefmHoE+i8XkV8LWSMNtApoFgZ1zZ95LHwLvAOen2w5D/D5q9IKhnF55KWZCwOiF1cBJ3BTCtnK2AJKwdAYP+O6GvjwAg6uc6HCParWd+v0lH8lGGT8kI+UWO+4m7Mot6Qc6SndCjTqskFy9Oj6X2cF+CoRSCgOdPXR/8EGJPr8woezbZONUj0T41g0ZZ2aefWPyCIR14FrYfVzeYeCUGHjPg6BHiCRLN9zbHpCSEAod3zxqbmHxwLEmwg1o0LIclkJXU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(6133799003)(18002099003)(261026140227099003)(3023799007)(56012099006)(11063799006)(261022075727099003)(261021121427099003)(261021123027099003)(261009223027099003)(5023799004)(10067099003)(261022115727099003)(261022113327099003)(261022105027099003)(261021135927099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8WsWarYuUx3rq2BG3Y0+3k+6/3838w9GCiMUc55Drm1QrcMh6ZHTWBWzAalTazoWcTgRE2PNKgLORLt4FPwtyffejo3Wq0Vo8Fgzq6SF4hRvMeQSpVYujAC8/FatKBBfpg69MO8Mth9T1x2NQxYwBLV7tLCP6XVTApB9MtSYQfuDoSRjhVLWXCVLx/SmSq7LqQqXO1QDUQM/tYxh9BJAYZChN1QTkbtPbL2tgaq4AEIfftuAMD9HjVrJ5bIZsYFI4RlCflfa0vx/9dwaemiMD9SVB0Nr2E8fmCHmTasOcNcyBQIYzj1T87ChB3TBuyg4us2dPALCrax6T36muFF9Sf09N4vYdo4ey3twTCXboYLXSwIB1MuRTXSAaXr6lIobsQN8o39X5lyx1g1CYzBp+3SozuDIny2FmwHX1NFJKhlvrwfh3wdzhQGlgJfpzMoh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 15:48:47.1335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c04ed00-fbed-4149-c769-08df3441c9be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265AD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7883

From: Nathaniel McCallum <nathaniel.mccallum@amd.com>

A guest may expect a specific set of virtio-net devices, each for a
particular purpose. The host creates the devices, but the guest has no
in-band way to tell which created device corresponds to which expected
one. Device enumeration order and guest-assigned interface names do not
carry that correspondence, and the MAC address identifies a device
without indicating the purpose it serves.

Add an optional, feature-gated string to the network device
configuration space: a host-provided, guest-readable label describing a
single device instance, modeled on VIRTIO_NET_F_MTU.

A motivating use case is a confidential VM whose image author ships a
trusted manifest describing the expected network interfaces. The host
builds the devices according to that manifest, but the guest must
associate each discovered device with its manifest entry before it can
apply the intended configuration. VIRTIO_NET_F_LABEL supplies that
association: the host places the manifest name on the corresponding
device and the guest reads it as a lookup key, checking that every
expected name is present exactly once. The label carries no authority of
its own - the trusted manifest decides which names are acceptable and how
each interface is configured - so a distrusted host cannot use it to
redirect or misconfigure the guest. The label does not authenticate the
backing network, and that is not its purpose.

Config space is the right home for this because the label is a small,
bounded, read-only instance property that is stable for the device
lifetime and can be read during device initialization, without
negotiating VIRTIO_NET_F_CTRL_VQ or standing up a control virtqueue
solely to retrieve it. A control-virtqueue query could convey the same
value; config space is preferred here for the static nature of the
property and to avoid an otherwise unnecessary control-virtqueue
dependency.

Two read-only fields are appended to struct virtio_net_config,
present only when VIRTIO_NET_F_LABEL is negotiated: label_len
(0..VIRTIO_NET_LABEL_MAX) and a fixed VIRTIO_NET_LABEL_MAX (64)
octet label buffer holding length-delimited, well-formed UTF-8
that is not NUL-terminated. A fixed buffer (not a flexible array)
keeps future fields appendable; existing offsets are unchanged.

Device requirements: offer the bit only when the fields are
populated; keep label_len <= MAX; emit well-formed UTF-8; keep the
value stable for the device lifetime with no config-change
interrupt; and never emit NUL, C0, DEL/C1, U+2028 or U+2029.

Driver requirements: do not touch the fields unless negotiated;
read label_len first and treat a value above MAX as a device error
with no out-of-bounds read; read exactly label_len octets; and make
no routing, identity or trust decision from the value, derive no
interface name from it, and assume no uniqueness or persistence.

Comparison is byte-wise and never normalized or case-folded; the
spec guarantees no uniqueness. Bidirectional and zero-width
characters remain permitted because their hazard is contextual; an
informative section places sanitization at the rendering layer and
notes that on an untrusted host the label is attacker-controlled.

The feature uses net device-specific bit 71, the next free net
device-specific feature bit above the highest currently used (70).

Signed-off-by: Nathaniel McCallum <nathaniel.mccallum@amd.com>
Signed-off-by: Amanda Liem <Amanda.Liem@amd.com>
---

Link: https://lore.kernel.org/virtio-comment/20260818170552.2127-1-Amanda.Liem@amd.com/ [v1]
Link: https://lore.kernel.org/virtio-comment/20260924153024.3362-1-Amanda.Liem@amd.com/ [v2]

v1 -> v2:
  - Add motivation to the commit message: the problem (a guest expecting
    specific devices has no in-band way to match created devices to what it
    expected) and the confidential-VM manifest use case (Parav)
  - Explain in the commit message why the label lives in config space
    rather than being queried over a control virtqueue - a small, static,
    read-once property that should not require negotiating CTRL_VQ (Parav)
  - Correct the feature-bit note: bit 71 is the next free net feature bit
    above the highest currently used (70), not '0-70 are in use'

v2 -> v3:
  - Require label_len to be 1..VIRTIO_NET_LABEL_MAX (was 0..): a device
    with no label does not offer the feature rather than offering an empty
    value (Matias)
  - Spell out the over-length error: a label_len greater than
    VIRTIO_NET_LABEL_MAX indicates a device error; the driver must not read
    past MAX, must not use the value, and SHOULD set the FAILED status bit
    (Matias)
 acknowledgements.tex             |   1 +
 device-types/net/description.tex | 118 +++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/acknowledgements.tex b/acknowledgements.tex
index 9a9f8b4..3394bbc 100644
--- a/acknowledgements.tex
+++ b/acknowledgements.tex
@@ -22,6 +22,7 @@ \subsection*{Participants}
 Martin Kröning, Eonerc \newline
 Matias Ezequiel Vara Larsen, Red Hat \newline
 Michael S. Tsirkin, Red Hat \newline
+Nathaniel McCallum, AMD \newline
 Laura Loghin, Amazon \newline
 Lei He, Bytedance \newline
 Paolo Abeni, Red Hat \newline
diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 9f85bf4..5ab0da6 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -146,6 +146,12 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
  when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
  also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
 
+\item[VIRTIO_NET_F_LABEL(71)] The device provides a label string
+    describing this instance. If offered by the device, the device
+    advises the driver of a host-provided, human-readable label for
+    this network device instance through the \field{label_len} and
+    \field{label} configuration fields.
+
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -220,9 +226,15 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
         le16 rss_max_indirection_table_length;
         le32 supported_hash_types;
         le32 supported_tunnel_types;
+        le16 label_len;
+        u8 label[VIRTIO_NET_LABEL_MAX];
 };
 \end{lstlisting}
 
+\begin{lstlisting}
+#define VIRTIO_NET_LABEL_MAX     64
+\end{lstlisting}
+
 The \field{mac} address field always exists (although it is only
 valid if VIRTIO_NET_F_MAC is set).
 
@@ -276,6 +288,44 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
 Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
 
+The following two fields, \field{label_len} and \field{label}, only
+exist if VIRTIO_NET_F_LABEL is set. Together they convey a
+host-provided, human-readable label describing this network device
+instance.
+
+\field{label_len} specifies the length, in octets, of the label
+value, between 1 and VIRTIO_NET_LABEL_MAX inclusive. A device with no
+label for an instance does not offer VIRTIO_NET_F_LABEL for that
+instance rather than offering an empty value.
+
+\field{label} contains the label value as exactly \field{label_len}
+octets of well-formed UTF-8 text. The value is length-delimited and
+is not NUL-terminated; octets of \field{label} beyond \field{label_len}
+are unused and have no meaning. The remaining octets of the
+VIRTIO_NET_LABEL_MAX-octet buffer are reserved.
+
+The label is descriptive only. It carries no semantics defined by
+this specification: it does not name a network, identify a tenant,
+or establish trust, and the device does not guarantee that it is
+unique or that it persists across reboot or migration. Two device
+instances MAY present identical labels.
+
+Labels are compared octet-by-octet: two labels are equal if and only
+if their \field{label_len} values are equal and their first
+\field{label_len} octets are equal. Labels are never normalized or
+case-folded before comparison. The UTF-8 encoding of the value and
+the octet-wise rule for comparing values are independent: a consumer
+that requires Unicode normalization or case-insensitive matching
+performs it itself, and a consumer that requires labels to be unique
+enforces uniqueness itself.
+
+The value MAY contain bidirectional or zero-width characters, which
+are legitimate in many scripts. The hazard such characters pose is
+contextual to how the value is later rendered and is addressed at the
+rendering layer (see \ref{sec:Device Types / Network Device / Device configuration layout / Label security considerations}),
+not by restricting the value itself; the value-level restrictions
+below cover only context-free hazards.
+
 \devicenormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
 
 The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000 inclusive,
@@ -326,6 +376,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
 does not offer VIRTIO_NET_F_CTRL_VQ.
 
+The device MUST NOT offer VIRTIO_NET_F_LABEL unless it populates
+\field{label_len} and \field{label}.
+
+If it offers VIRTIO_NET_F_LABEL, the device MUST set \field{label_len}
+to between 1 and VIRTIO_NET_LABEL_MAX inclusive.
+
+If it offers VIRTIO_NET_F_LABEL, the device MUST set the first
+\field{label_len} octets of \field{label} to well-formed UTF-8.
+
+If it offers VIRTIO_NET_F_LABEL, the device MUST NOT include in the
+first \field{label_len} octets of \field{label} any of the following:
+the NUL character (U+0000); any C0 control character (U+0000 to
+U+001F); the DEL character (U+007F) or any C1 control character
+(U+0080 to U+009F); the line separator (U+2028); or the paragraph
+separator (U+2029).
+
+The device MUST NOT modify \field{label_len} or \field{label} once
+VIRTIO_NET_F_LABEL has been negotiated; the value is stable for the
+lifetime of the device, and the device MUST NOT signal a configuration
+change for these fields.
+
 \drivernormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
 
 The driver MUST NOT write to any of the device configuration fields.
@@ -367,6 +438,53 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 A driver SHOULD NOT negotiate VIRTIO_NET_F_CTRL_RX_EXTRA if it
 does not negotiate VIRTIO_NET_F_CTRL_VQ.
 
+The driver MUST NOT read \field{label_len} or \field{label} unless
+VIRTIO_NET_F_LABEL has been negotiated.
+
+If the driver negotiates VIRTIO_NET_F_LABEL, it MUST read
+\field{label_len} before reading \field{label}. A compliant device
+sets \field{label_len} within range, so a \field{label_len} greater
+than VIRTIO_NET_LABEL_MAX indicates a device error: the driver MUST NOT
+read \field{label} beyond VIRTIO_NET_LABEL_MAX octets, MUST NOT use the
+label value, and SHOULD set the FAILED \field{device status} bit (see
+\ref{sec:Basic Facilities of a Virtio Device / Device Status Field}).
+
+If the driver reads \field{label}, it MUST read exactly
+\field{label_len} octets.
+
+The driver MUST NOT make any routing, identity, or trust decision
+based on \field{label}, MUST NOT derive the network interface name
+from it, and MUST NOT assume that the value is unique or that it
+persists across reboot or migration.
+
+\subsubsection{Label security considerations}\label{sec:Device Types / Network Device / Device configuration layout / Label security considerations}
+
+\begin{note}
+This section is informative.
+
+The label is supplied by the host and is not measured. Whether it can
+be trusted is a property of the deployment, not of the field. Where the
+host is part of the guest's trusted computing base (a conventional
+virtual machine), the value may be used as provided. Where the host is
+outside that boundary (for example, a confidential virtual machine
+whose memory and execution are protected from the host), the label is
+attacker-controlled: on its own it is evidence of nothing. It carries
+weight only insofar as the guest corroborates it against state the host
+cannot influence; how to corroborate it, and how far to trust the
+result, are concerns of the guest's design and are out of scope here.
+This specification only defines how the value is conveyed; trust
+decisions are made by software layered above the driver.
+
+Any layer that renders the label to a text sink sanitizes it first: it
+drops control and separator characters and renders the value in
+isolation so that bidirectional formatting characters within it cannot
+reorder surrounding text. The value-level restrictions on the device
+(above) remove only context-free hazards; bidirectional and zero-width
+characters remain permitted because their hazard depends on the
+rendering context and is therefore addressed where the value is
+rendered.
+\end{note}
+
 \subsubsection{Legacy Interface: Device configuration layout}\label{sec:Device Types / Network Device / Device configuration layout / Legacy Interface: Device configuration layout}
 \label{sec:Device Types / Block Device / Feature bits / Device configuration layout / Legacy Interface: Device configuration layout}
 When using the legacy interface, transitional devices and drivers
-- 
2.34.1

