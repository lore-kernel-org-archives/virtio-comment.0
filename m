Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793900607;
	b=JtAKh7i4ly8uAWEipKkIVpjFEb2+OiJSxxDSNVkyqrBfFmqssN5JpaSaslJy9Gwu3BAl
	 DG5R/7q05VC2WwrHzAWZQZ3cfvPub/ouT+Uv3HCuWKz2Uq1KjVs/zZvsOX2pE0dP+qXtQ
	 xyu0ju8EkijnsOYoO4w6mH3ShWm17xqs0X8iaHuCEdWzUKGdnaUeS2BPIvXJPhFVnpm6Z
	 tTbKWcaD7ua8E8VFIJ3MFfJGakA1831aQalHvvOQvPU1CATlwShT1HmVwNy3t2OmYsxWz
	 m6ezP24pncefK5BC//LcZvrRI4Z8dDP39FW+1+LXB37q+a6o/u7p5fqUDowkfGiWvdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900607;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=rM78os+mLk57LzNvTMnRgixaBsgeXtBBLayjxLe9iAQ=;
	b=v1WU+IlDNmCLNBrYkTneTmxY+SEWTG3UvnamfwWM9fJhwiI/WCvoV/a6pJpJ2tT257xs
	 sQUbsJ1NFhRD+e3ZRLrqlTd3iLC12fn6UdqI+9GQuxYlr92LtQq2ZdbJkepVErLOByiMr
	 qDP5KVDX++IB/2dQBaMaEoFydMDsptYlV7UdbaU9NfbITLZOJolpCB1lcIjbabm7WAeRW
	 TQdvzOrt3sK8Co9dpRIsLhvGlFInJSKBjuVGqmNtP6J3wnuX7er3gONzhBLDTl4gEQIJg
	 p5rRLTz4xJATJ+jHYdGBUWW37ruyo48YNnYsY+a68/TaHr0Nrx10FPKurWnMRmz7koQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="t+0Pw/qI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.6
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39192606A332
	for <virtio-comment@lists.linux.dev>; Thu,  5 Nov 2026 17:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39192606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=t+0Pw/qI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIrXjr4gZSaRS3xAwcU7pvacCGOFNxeQBvAVZndX/+d+8dmmBEjr4NCQeQZubKMwiHMiXxU0CMn8uGFvSJZtpNhGCPjJRQA6AsIXmNVRZGg4v8JavhBj4Al5evN0dYbxalrPMs1V6nm3NTwEs0O0x8qZStnbxFTJt+Q6p8hi+4xp58qq93spH8SJWcri1KE/pQqcXlhBbUDCWIMZvQBl2/V5eMxwgNUsK+3huYiiFdaZDDOHFczG9UjW3+KZNd8TIrkyd+O1iHQH/ih0Eko75v8hTd7kY8g92Gqaq0YcfQ5wONTXr09ffnbig1ZntffTvHuBPfH1gDIXQGzNarrNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rM78os+mLk57LzNvTMnRgixaBsgeXtBBLayjxLe9iAQ=;
 b=QjR25G0S/53jwW+SbZEu7H7ZfeLVdFDakx8e1WGDFZbcM04TBONr5wIrXH1nHEx5HgfOfEfdAVWHXt3GbI/O0zGVpSC7tY7NusM6J7LPvoRRaq+Z0sSPOrZDNztqc33nKCWq1w9Um0Ti+/OILTJ5CItlHNZ37uKiVOC6FUrT+ON1OOYB3zEDZfnZaPGF6fU5So2DYpKZcpVslPYgDurh7QdaNtuT4I9r02o+nH9TF2KGOheig4ZGL/GyxqK6V6KHUjBvH/K2RkrBisM0s4okA+F+GSq1tZE5bze2LmPVPncCy1nNXJhNoz25kwEf9QLRolGIfSRThxXFPgQDmVqq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM78os+mLk57LzNvTMnRgixaBsgeXtBBLayjxLe9iAQ=;
 b=t+0Pw/qIJxMBHDLzgkmcW1JUu0XPFczqqCcGZvv53I4EwdKHtpl9aTuQEhgpb/ySeE7P0+eKiP3Oj1wzGbVnrN6mPYP1gowd72glgvYH6PeJx6cMDB77PwjbxmKuI2WelvFnrSCHtfEsSCAVcO/rZi3Xd4ag1THMt2f9vSK9fM0=
Received: from CH5PR03CA0011.namprd03.prod.outlook.com (2603:10b6:610:1f1::23)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:43:18 +0000
Received: from BN7PEPF000000A7.namprd05.prod.outlook.com
 (2603:10b6:610:1f1:cafe::3d) by CH5PR03CA0011.outlook.office365.com
 (2603:10b6:610:1f1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 17:43:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A7.mail.protection.outlook.com (10.167.245.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 17:43:16 +0000
Received: from AUSALIEM01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 11:43:15 -0600
From: Amanda Liem <Amanda.Liem@amd.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <mvaralar@redhat.com>, <parav@nvidia.com>,
	<nathaniel.mccallum@amd.com>, Amanda Liem <Amanda.Liem@amd.com>
Subject: [PATCH v4] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance label
Date: Thu, 5 Nov 2026 11:43:07 -0600
Message-ID: <20261105174308.11982-1-Amanda.Liem@amd.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A7:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: f861f3cc-60b7-4cc6-785b-08df3b64460f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|261022075727099003|11063799006|261021121427099003|261021135927099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|56012099006|261022113327099003|261026121527099003|261022105027099003|261021123027099003|18002099003|6133799003|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info:
	bqQsNDZhssyIlcZdwN3i3Uwpbm2+iTR99/K8DSoHRqM7xoM/aUUtdmSLC4e9gWqTBkEp19Az9rcghtSjLJLVKKBMiyQeGzVaAUsqW2cpOKvFb+pK2ZV5iZy6SW1WAjlnuCym3xE1qPa8FoY2NbDo2glEhb0QU8PyhuIC9NnWRSuerT0eFPIMLZPIFW8LoNej/WVwZeA5RwYeMurePykDaghWEZbRdBjg4I6E7IMdwjtUeRWB7PubmczQnAK4rZriJNBEW3PEArNa+XocxIvkXIxs34q4jvRWDKeBR+k1mOanRGWHpcOEY9iyggw7cbBrRvVt4OSINsOVGw51CR1Gz6ZPG/qQjSE3Z+peGzXEph5er3hwz62An5GXu5Gsqkhk/SfZ1SOnanMy3bGwSzuFL53GwNEtj37TKxqOFg/+LKTjQXXssxGHAhfeosrAka+m3kl16AddGgLlwY2z38AO5wmsLhI2/Gjz+1wCmqlWZxxzquu8FO8hmaynvZ2Alxr2Rfef0kQ4+84OUaGybOC1W1/k7Sef/M88WDNUbsDflWH1OoIpmWdWM9PIECcLLEHLpLPgxVhNe/wIzMNZVClXnyCmZH75xlUCMQ0qBdTNjRX/x8KYMobyE+VxIeKa5WEh7CCVSv/tZpzSfmk0oKcbpdu0K1MjzixsALGzf51prVM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(261022075727099003)(11063799006)(261021121427099003)(261021135927099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(56012099006)(261022113327099003)(261026121527099003)(261022105027099003)(261021123027099003)(18002099003)(6133799003)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f+kz8jbFKBIaHtPXPgS3soa+t6Poq/eAN+8Olo0xPRwZi7AcSsUtmTuBq085iDfPheK3DNV66vwmHT/fxKqFNPZfqnlk6jtiZm/3x5RuH1Ck6IhAJYVwxco6ax5gCJp+gLJWmZ8KxKed9dtvqMSJVaeaSpstWnNnFTJH+sq9h3jhu/ur6FxH8bhh15FzkyUax2ucRETC1Rv9rwngi5tlv+23lJOLwn5BDgY72qbaAZYJvvrmoOFWbL6M3Qb+ZFlu1ajvlKIyi71ZcBR6wjhcoN5ImqVRJZr1f9KFlFA8PQoVsIGhiYwsfJXrlmowiVE5pmkGgHFno/+avZsEkt/nFCluZiZg+0w7bJb4b0WQnaDHHwEltNIxkYJrSnO4eIiwWEjmcnWOw7wSYwdyk88COfMYVMpX54LX9kXQpSm5EkO2j73bgFpSCDYufewmQ2J/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:43:16.7674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f861f3cc-60b7-4cc6-785b-08df3b64460f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247

From: Nathaniel McCallum <nathaniel.mccallum@amd.com>

Add an optional, feature-gated label to the virtio-net device
configuration space: a short, read-only string describing a single device
instance. This field is modeled on VIRTIO_NET_F_MTU - it is static and
read at device initialization, without a control virtqueue.

Two read-only fields are appended to struct virtio_net_config, present
only when VIRTIO_NET_F_LABEL (net feature bit 71) is negotiated: label_len
(1..VIRTIO_NET_LABEL_MAX) and a fixed VIRTIO_NET_LABEL_MAX (64) octet
label buffer holding length-delimited, well-formed UTF-8 that is not
NUL-terminated. Two reserved octets follow, keeping a later appended field
64-bit aligned. A fixed buffer (not a flexible array) keeps future fields
appendable; existing offsets are unchanged.

A guest with several virtio-net devices uses the label to find which one
plays a role it requires - for example the device that receives inbound
connections on port 443 from the internet, which it cannot tell from the
device itself. The label names an out-of-band contract the guest expects.
The guest matches the presented label against the one the contract calls
for, so the label only locates a device and conveys no trust. A wrong
label can only deny the guest its device, a denial of service that is
always possible. It cannot make the guest trust a device the contract
would reject. A contract and its enforcement are outside the scope of this
specification.

Signed-off-by: Nathaniel McCallum <nathaniel.mccallum@amd.com>
Signed-off-by: Amanda Liem <Amanda.Liem@amd.com>
---

Link: https://lore.kernel.org/virtio-comment/20260818170552.2127-1-Amanda.Liem@amd.com/ [v1]
Link: https://lore.kernel.org/virtio-comment/20260924153024.3362-1-Amanda.Liem@amd.com/ [v2]
Link: https://lore.kernel.org/virtio-comment/20261027154836.13778-1-Amanda.Liem@amd.com/ [v3]

v1 -> v2: add motivation and config-space-vs-CVQ rationale; fix the
  feature-bit note (Parav)
v2 -> v3: require label_len 1..MAX; spell out the over-length error as a
  device error with FAILED (Matias)
v3 -> v4:
  - Reframe: explain the purpose - the label names an out-of-band contract
    the guest expects and matches against to find its device - and that the
    label conveys no trust and need not be unique (Michael)
  - Drop the acknowledgements.tex change (Michael)
  - Remove "host" from the spec text; the device provides the label
    (Michael)
  - Pad struct virtio_net_config with 2 reserved octets so a field
    appended after the label stays 64-bit aligned (Michael)
  - Reword the comparison text as driver-side matching, drop "consumer"
    (Michael)
  - Note identical labels may occur in the same guest or in different
    guests (Matias)
  - Remove the informative security-considerations note; its one normative
    rule (no routing/identity/trust decision from the label) already lives
    in the driver requirements (Michael, Matias)
 device-types/net/description.tex | 92 ++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 9f85bf4..e8419f7 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -146,6 +146,12 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
  when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
  also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
 
+\item[VIRTIO_NET_F_LABEL(71)] The device provides a label for this
+    device instance through the \field{label_len} and \field{label}
+    configuration fields. A driver uses the label to identify which
+    device matches a value it expects. The label is human-readable, and
+    its meaning is defined outside this specification.
+
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -220,9 +226,16 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
         le16 rss_max_indirection_table_length;
         le32 supported_hash_types;
         le32 supported_tunnel_types;
+        le16 label_len;
+        u8 label[VIRTIO_NET_LABEL_MAX];
+        u8 padding[2];
 };
 \end{lstlisting}
 
+\begin{lstlisting}
+#define VIRTIO_NET_LABEL_MAX     64
+\end{lstlisting}
+
 The \field{mac} address field always exists (although it is only
 valid if VIRTIO_NET_F_MAC is set).
 
@@ -276,6 +289,45 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
 Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
 
+The following fields, \field{label_len}, \field{label}, and
+\field{padding}, only exist if VIRTIO_NET_F_LABEL is set.
+\field{label_len} and \field{label} together convey a human-readable
+label that identifies this device instance, which a driver matches
+against a value it expects.
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
+\field{padding} has no meaning and is reserved for future use. This is
+set to zero by the device. It keeps a field appended after \field{label}
+64-bit aligned.
+
+The specification defines no semantics for the label: it does not
+name a network, identify a tenant, or establish trust, and the device
+does not guarantee that it is unique or that it persists across reboot
+or migration. Two device instances can present identical labels,
+whether in the same guest or in different guests.
+
+A driver that matches the label against a value it expects compares
+the two octet-by-octet: they are equal if and only if they have the
+same length and the same octets. The device does not normalize or
+case-fold the value, so a driver that needs Unicode normalization or
+case-insensitive matching performs that itself.
+
+The value can contain bidirectional or zero-width characters, which
+are legitimate in many scripts. The device does not emit control or
+separator characters, but a driver that displays the label can render
+it in isolation so that any bidirectional characters cannot reorder
+surrounding text.
+
 \devicenormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
 
 The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000 inclusive,
@@ -326,6 +378,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
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
@@ -367,6 +440,25 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
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
 \subsubsection{Legacy Interface: Device configuration layout}\label{sec:Device Types / Network Device / Device configuration layout / Legacy Interface: Device configuration layout}
 \label{sec:Device Types / Block Device / Feature bits / Device configuration layout / Legacy Interface: Device configuration layout}
 When using the legacy interface, transitional devices and drivers
-- 
2.34.1

