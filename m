Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB56B3D0930
	for <virtio-comment@lists.linux.dev>; Tue, 18 Aug 2026 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072767; cv=fail; b=SX2r45jgZJdMsX55SYKSwDQ37DFMshVm72HE/sviZrMnnBDUQig8jT+3wKm1KIVNrrT402SwN41aOHFIZKelpwTM0XBuPAQ4IsS5PH6r/33AV+t8uE7/zo0Ekt/LPOiz70ZH3cI+zSPeMpUyr/NSTp0sE37OnXHzcWhogh38i2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072767; c=relaxed/simple;
	bh=ekUeAaYrz3NNRwnDgeakeouXaEsM5Z4jpWVDccFCFKc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=no4k2lNpY92AeB/lajcy2xuus03ISIW77zXvJQmOB5xslVmpJBepMtNLtoPilnjMiZVmNPHnNPxVrdNEw70cOjxCmw7fZ9WiFoLm16N8B7cQN/nxg3FqI0KqvLtHr6Q+vMx/JsYX93Sjt92XettIxAjKIYSiCLa6/k9hnEAWwbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QpekcNoe; arc=fail smtp.client-ip=52.101.56.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QpekcNoe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2sFiaTKNeJrsFqxLFPzrPk6zODMVA4eGQ+hyCXsrLZttY48NpDHwTcD+J7quFzyebg8xkrShWSyUYdTOAz4y52DFeo9OarZ1Z0E3ROaBtbezzpSddsdEy4PHgCze+3JTj3H0+DsaojBioZdPAIWfiqV4k807EYu8RpJpWw30IKWngnweIXoQOK8gtTa3991gId5ZnD09ub8in3LPlORbt5FBrH5GPHtWFvIdn3x0E9Kdb2oH+jhunw30AmvIGNQXm2YwROhdQh1UcbltkyKlQ6EByRhnJGD9jQr3T5jkGAeYuFRfEKLeUBhY5YDvozIGBZ3G4R+PbYMayXlpgJwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP3QjBIp9mac60LpufVuLimxX+/UKW7pKQLzZc2WeZY=;
 b=owEg6kJQD+TJGc6NzFpfjHboxnUxOkchcv4uWwsn/JG4mejClMEMzzSpKPELTIu2ZSxVZUGYbgKXCZH4Cs4PjgxpLRSQC4IrsOzYlIi5C5oOibgLt2a45d0dk2VkAeq58kpNFsX5NlogLmKrGyJ+aXU2rPpXAGy6oVlT223h3QphiYxffq7WpYJftcBzOZqh6k4Moui2nPKk2alZW8yuHHsffPcIhGmr0ruUEOUwUIUqlcdsP4Nj1aqPGz2Q2y2m/0MJNvTc7QAEpUEmcW/kC37RyQHy8tulNHbDzTURqM33m3H5PgIo0rrvSIxv8MUtsSDJSoSyKk+UCZPLiVJZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EP3QjBIp9mac60LpufVuLimxX+/UKW7pKQLzZc2WeZY=;
 b=QpekcNoecYfmO4r79koeJIBAd59HmpHMUy3VM8bK3vBihRp7quajkYW4wfjQyHADuo34RXSpcB6yk98umzyYuqpxFQdaIye5Bb0sErSinB9R9GgqjDoC30j4yEbQPIsa0RrEuwcecsxMp6J1bMiVhU2imwnv8uvPas3Z8zkzCF4=
Received: from BN9PR03CA0672.namprd03.prod.outlook.com (2603:10b6:408:10e::17)
 by DS4PR12MB9771.namprd12.prod.outlook.com (2603:10b6:8:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 17:05:59 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::aa) by BN9PR03CA0672.outlook.office365.com
 (2603:10b6:408:10e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 17:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 17:05:58 +0000
Received: from AUSALIEM01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 12:05:58 -0500
From: Amanda Liem <Amanda.Liem@amd.com>
To: <virtio-comment@lists.linux.dev>
CC: Nathaniel McCallum <nathaniel.mccallum@amd.com>
Subject: [PATCH] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance label
Date: Tue, 18 Aug 2026 12:05:52 -0500
Message-ID: <20260818170552.2127-1-Amanda.Liem@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|DS4PR12MB9771:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4373a1-b24a-4331-44a1-08defd4af991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|56012099006|11063799006|5023799004|10067099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ue6JtRbfVCy+0YqAkAy+r9j9i7sdw1ZMcgazvc/FsiDkyWSLlAtJYvZkM+qowZyJQEGRDAsYzgI5vLgPvsQ52YEFTXKWWtE5i+pxh+TDzEVYu8EQWpMHPMjce/nEhbn816Cf9xS0IsKQfCGAJ38XTURWOsC1ulY1F9LxQaWTyyhM4wmyRsMH6R3s9+ccIb9iAYgdOAMoyJlr6ad2Duxn+Vl5EzjzvmOzt4nspKClFAK66lT3+KgpFwtvSv0aRxlLdXwPpO0HP7OKM0YVvwj/94ccBoaJktyPHZ/SR/nLgC1CRM+xk0V2k8OoiJhDY98buMfiUOUjXSs42r/GG2ad+VLOqBS6HOMXLUtinW6yjdBC5WG1v19ZtLS/OpYz/4IBjAaOLefK118rv3wgjiULjyNkSSOuAP+W/eQ/RfHDBGasUL2v9Xbzq/pJk32qRWWiwcxSK2Kd3c26e9mdPSotEh17wxeUBBXs4tIwWBoK+0fXtCfihHYsONeR23Ba0+YGOykCz9404Wn7cdrIWGs41FOWjHwoXr7efHq0lQ11Ui7XK7d9Z1TofvqbE7AHShF+su0v0QJiZl6++kKO+6P5pX7ndR7werqvb1Zy2FhPFrQUItOYYe6X5DaBKNKz2n51vMRMjr2YX3iRYWaG9X7TDIEZDUwRi+aF4LJhefv5W2eAVYGmXgMCi/ufOCRohY9bhsVdIR7EfFVnyB9Xspi/AA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(5023799004)(10067099003)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	StnJwVstVxWj9erTDC75kcN6qQ13z8ksFD5v8U5zE/4IVdBfja63ZCi5RESSmnOoV+g9ou14HP4kOPgoslZQAxih3yLTkVx7ejIrOjC66IDNvxrj7qTjqYo4CQKlYcOuKBP6oHXDq4rtp4AuAIg0LduFbzjhXI6by1AkpmAFLbVlxDLdQ00Y28nsOP7sL/XjVzU9VXSE5PDQckGLKl7sKu+E12fYM/B2BYxGXf0h9OzTzD0zjd7ts0sTMJ1TGAapVGdZe7rtROEnJNiapBqc8I/3BcQ8A2iPJ+LAwACgvR6aejMAL/dO0qxW2f3ZZYjAiDGZo7pmbfxUvRnGMCVOjh+FBp9Z/LFGunvRshklWj35OgeXhUXUZyNSUugzd7S8sk2giyvg6IVbp1flZ0ikgyM0qXqQEOCVrtAaXgD7RFDC2P3WLpIzyF6fHmjZq7vV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 17:05:58.9094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4373a1-b24a-4331-44a1-08defd4af991
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9771

From: Nathaniel McCallum <nathaniel.mccallum@amd.com>

Add an optional, feature-gated string to the network device
configuration space: a host-provided, guest-readable label
describing a single device instance. The field is modeled on
VIRTIO_NET_F_MTU and lives in config space so that it is plumbed
identically across the PCI, MMIO and CCW transports from one
definition.

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

The feature uses net device-specific bit 71, the next free bit
(0-70 are in use).

Signed-off-by: Nathaniel McCallum <nathaniel.mccallum@amd.com>
Signed-off-by: Amanda Liem <Amanda.Liem@amd.com>
---
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
2.43.0

