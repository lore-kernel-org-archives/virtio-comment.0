Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2DF4A2A6B
	for <virtio-comment@lists.linux.dev>; Thu, 24 Sep 2026 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263920; cv=fail; b=rhvQZCeR6B0dK5OdfktWzyPVdVbelDaM+bPaX0uwAwauHi1wTQTLQ4ooU69CZcc5KK4YtiZQwgsJ+rbftEm2F2hf+l30YkZJPe3yCc7C5J9zIvbVrLZwx/7XUzrUUKIkgtpKavR3jH7cRKWGyloSXE5USbIrL1Ac50WAnsBGjJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263920; c=relaxed/simple;
	bh=us7zbsEjnycA1ij8m/7Cu4hPUFbCP8XjuQm03/eDC/0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JhKzLmcMtLLTO7z6bwhFNPxgrIKY4YdjPxbZlgdy1LIoX0sx/++VQIxtQVeZjCOMAJ+PmBe02GF8VT/oVL09PAP6/qR2k6VpEO3Y3xSxy/9MBP0mE0dCN10M0WOIOjC5o1u78qujSv4cQJD9W7b9k8CEflCwEUkYidDrPf6y/c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1CBaYmx/; arc=fail smtp.client-ip=52.101.53.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1CBaYmx/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A122iTVq7SJulJ/S603KhBCUMgV4QPWzoZvAqqVrkGRnz1hdiwaOB1B/ohpKNU2Lf90ZJViELd6YfnxoWKq5C1x0o49YPYa+GmwWEbPr3ahky0XGFfKf1bbw3dtNlnM/Yv/HeIlMEuWSB88Cm19s4L0YKnp6MQ62IzrQdOT6U4K2EGdyt09x2rW5th1kbefPZXMgM2TWA1FzAOJaKxB5MqigNt5OPQRVbA/wK/YYyIw9wGoVy5FC9JUT24vJjqXR4BYcd+Voe2Lbz8lloXsgOe7L7u4mVdbpwg2TwjTNBb/zbDat3udyFPDFLUsxmZvdiqY+0Jk6OH70DC2r8otJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IP7mu+lqE2SCvXj/Miz44iIeS+0u8kGUzbTeJlhHkE=;
 b=SJYKp5TO6o4gM7hkARErGq/KJhjr1qQVPqGf55JWYyGdJrKcvDJwOmENwwUanpnKoiZjAtjpQbRXPTzyhXjuNzHD2n4N+QDp0MDq/mEmF0VEVId5w4VHbAFEEVPJxoBcCPcYddYTOpYJkikyfwW1qdV7y5iJG3JsVxdDjnB2Peef16QUVSyf37CWqHxpYjlF25MZtE3wrulNFeYSgU7nN6QG+odFdNkDF7v1OxAnr8WHrpt8BMkrMMUPyubqUMRfGV8ILxuxdjEZS6ANI1anAe94dHxRKbj/ivjUrCmgZqPcsyEczTHcSsT6/AyTjqdWddqbqtZF8SYgTYoiaLQ7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IP7mu+lqE2SCvXj/Miz44iIeS+0u8kGUzbTeJlhHkE=;
 b=1CBaYmx/kosuZUkYC0Ui4AIYR/Jk8lQ+/pzGV5BN54naLTKFuFyDvUpDFXUbeaJBj+e1o3eK8JJKzfLwO09ue4wTlbT1tiIjqtH4DrOeEayEe/pXqqu4FaDgYe4NFVA4zfOPoAojmscjomAiI4YwTATpoHxsg1TGzGsSdl4UAug=
Received: from SJ0PR13CA0135.namprd13.prod.outlook.com (2603:10b6:a03:2c6::20)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:31:49 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::90) by SJ0PR13CA0135.outlook.office365.com
 (2603:10b6:a03:2c6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.12 via Frontend Transport; Thu,
 24 Sep 2026 15:31:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 15:31:49 +0000
Received: from AUSALIEM01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 10:31:47 -0500
From: Amanda Liem <Amanda.Liem@amd.com>
To: <virtio-comment@lists.linux.dev>
CC: <Nathaniel.McCallum@amd.com>, <parav@nvidia.com>, Nathaniel McCallum
	<nathaniel.mccallum@amd.com>, Amanda Liem <Amanda.Liem@amd.com>
Subject: [PATCH v2] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance label
Date: Thu, 24 Sep 2026 10:30:11 -0500
Message-ID: <20260924153024.3362-1-Amanda.Liem@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 6edaf786-910d-4e61-6944-08df1a50f351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8+9F87sQ52n+m8G9rKNq3r2FIav4FsI6HmzzcgfqrQcXHCV5cSUYNv3C3QslTzHrQ6XdV3dsPXAMKsZ8/hxaMWjJJpkHqZ74rQnltkjBkmhRWkeAIrBA3rU12EgULUMETstAPyWmFh1seFD83a+opeD+frdE2LQL98aksT8rVy3iWqcGGcnb9t6vkYVwqAoALJfxHlr/woqPHFrWLaz0H4efGFyzx3hd+ixNP88efiPIhax4GT8KJLt5MS7phBpuzWP3G/v4HITq+Se5XDtoX0x62/w7/BUT6daSSosNRgaq0snAzs5YlyOXZfRCm+E9YhJGh6wEPdoznUSqhscfa6CBpwn6rbmiT/SWc/ayTNj6NRqn4+DHZbx2GfZx/3OisosSeusJmFtXTTg46NLGR3w7sLEKvyyHt1YYaDZ5A+SkfzJ2FnMuUBHMP3FrYqJSEepFmlcSGGOiWXo9mt5Gw8UNlrZ7vrtZyifW3QU1x8KUp49HrweM6WWWG6OuWvX23FT8M6ZSU/8vMN+xtCgU3P9NVFRnnUzDH92Kz8vpho8966AJxTh/cVXScODagz+TraLqhtonafDcAgleR6dx7Un7OBdMijb3CNmmGYTmGzfw1RCwPTZfplcVcjIP0x1fZmYAWNFulqBpuk27f9+05MjlnoczmLufvI5nJg7Go+o=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QaFwanb4XaUUYZRCiYFTg1uvbgH9KZ//DHM+X/pPX5U9z5dOswDlUXntxK+LPNyP/jCYorSz3xj5wX+IAr5PLSuvBZMaAzMz1bEQBGZ6V7FSe6i6L6gppPYyZRveyZ+GtfO1pI9fP3NRURi3/1KNFAR1yrpCzFAPJuczQNEXQqO0Yx5X5duJHnfcxEJj/ZoVxxLvxh2Ezu01C4rOiFLJkgcFn5o79U6SqkcE8XYmz3F9wsLXHB45ZorJMF/adGD2IpvyAUWX+PY0nThJsFc3Gy2glymi8rP2Uq03Zsjg8Ivz5lka0ykAFVBFGqzDGjgPBcRRPfmYQ7usXedJ7Gm/Sv6irDoK/J2aT//XqykqGmTvuHeanZCHrwg2RsOb4If7VBQM87u6GvJkDApRB0wqbKcqAKxFxeVFsmiDsAIhydfsGJjWlvwJE3p62nb5sqkP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:31:49.1087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edaf786-910d-4e61-6944-08df1a50f351
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475

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

v1 -> v2:
  - Add motivation to the commit message: the problem (a guest expecting
    specific devices has no in-band way to match created devices to what it
    expected) and the confidential-VM manifest use case (Parav)
  - Explain in the commit message why the label lives in config space
    rather than being queried over a control virtqueue - a small, static,
    read-once property that should not require negotiating CTRL_VQ (Parav)
  - Correct the feature-bit note: bit 71 is the next free net feature bit
    above the highest currently used (70), not '0-70 are in use'
 acknowledgements.tex             |   1 +
 device-types/net/description.tex | 113 +++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

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
index 9f85bf4..f1d1474 100644
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
 
@@ -276,6 +288,42 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
 Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
 
+The following two fields, \field{label_len} and \field{label}, only
+exist if VIRTIO_NET_F_LABEL is set. Together they convey a
+host-provided, human-readable label describing this network device
+instance.
+
+\field{label_len} specifies the length, in octets, of the label
+value, between 0 and VIRTIO_NET_LABEL_MAX inclusive.
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
@@ -326,6 +374,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
 does not offer VIRTIO_NET_F_CTRL_VQ.
 
+The device MUST NOT offer VIRTIO_NET_F_LABEL unless it populates
+\field{label_len} and \field{label}.
+
+If it offers VIRTIO_NET_F_LABEL, the device MUST set \field{label_len}
+to between 0 and VIRTIO_NET_LABEL_MAX inclusive.
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
@@ -367,6 +436,50 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 A driver SHOULD NOT negotiate VIRTIO_NET_F_CTRL_RX_EXTRA if it
 does not negotiate VIRTIO_NET_F_CTRL_VQ.
 
+The driver MUST NOT read \field{label_len} or \field{label} unless
+VIRTIO_NET_F_LABEL has been negotiated.
+
+If the driver negotiates VIRTIO_NET_F_LABEL, it MUST read
+\field{label_len} before reading \field{label}, and it MUST treat a
+\field{label_len} greater than VIRTIO_NET_LABEL_MAX as a device error
+and MUST NOT read \field{label} beyond VIRTIO_NET_LABEL_MAX octets.
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

