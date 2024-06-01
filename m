Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B74215219A
	for <virtio-comment@lists.linux.dev>; Sat,  1 Jun 2024 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717253498; cv=fail; b=mhcVTNbve5vsszfyfsZh9Iesp8WN2iK4dGNCDXagn3//Ga7HUvadNotWYkE8c72nj0ZEUbn/q0eVLXYwcRvLt/d3ZbzLXsCTCLBoDjf02J63LvvwO6I9sddzHnrRtOLGLay3wwea0lMezbWNplC5y1zwlkMahzOCpZEXwADy5GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717253498; c=relaxed/simple;
	bh=22AtGTmyzYwMyCZSQVrCXUdvofD371Dv9c4o4aYACaU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DkR/MlluwQLXW5thbFJgzP/vKJJVEyIZtfdoufJ+wtT/Io2DUrVEaouiIyVMJTfrdcA7GM2B/EHqaDO6t6gwMwOjfsX8zbFYa+Yg2rhXURrlsUG7loMWGR3+GoZHEEaBcuY9RCUSEwmsXr9Pr8+xGfVIUiQS12p5ukFNlHDWQwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o7rawuFP; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o7rawuFP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLN1U7/rYQ+XtwN5haVxPsX3MAGOyTHtkf7YSym7fE1cHGwv5As6OTP/yHwqbShUB05bTsMB+5jFQ59VNxlYN/0Yasm2Ykvb1o0usQhT3Nt3XhmxjgEVLJM7rCyer5kBmRvco6cV35mJ+GkgPh1SHNBTss+tDGPBkXO6O5ZhR0+ohbGCMX/uc7wfLYLQJ9yhbvKos5Mlf1USSZgqRU6CsWiL1baszW/WgjUR3rjFtlobil3Kk0M5fPHYILi74/N/ej2uROCMxot82I6JpeeEKcNdBzgPY+TPU/Of2Z4UkjGZvkEMYxaPRNt0yJRaspLzngzfw8J64WXBc/ypEcDnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nO2MwOvxABNkzfMIPnSICqso1eYYOKqcJUeSHWaPH8=;
 b=KbVJe7YIMIJK5T9DOIfkRYuhbVGB47jAcSeFLDt7NnslGviUQVrzUOiW77wql0J98MF6l5wEv8FQvR/PxXVLy72HmZprI3A1xH7Y+S4KGq/LB+JZsY/xl5ur2RAZd/wfWcyS+gAdsJb7zS50C6Pfr9D0OE9YIavGv2QTjNa858Tmev7VcHZ+XBJGR/nKUNbIcvKEPXRY5hDaKfWjwAdn7ucOFfS//JRdz8WZYVfbIhjYpSEzMpPhXrf3pbA2oqsurnVrNJKz1t2GfyaMJHt45ITprIpUQtpgs8h+bMw+27qy8nEJrZ/FYYZIa8RFCkUSB0iGUNusDGyLVMgxDP68kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nO2MwOvxABNkzfMIPnSICqso1eYYOKqcJUeSHWaPH8=;
 b=o7rawuFP16css+swSIv+hrCpbR0lrMMhrJZHgqHSnq7NUouBCzOATErGixX2Qf7ZJV1aXILm5w8GZadO1qoIV1YRbRhdPNwVUYB4z5F50xqp9wZnOUjwSe8pMV0zeaiDlEkaulsBG7hGIrM+z7bE+heX91E4ME6Ptuot9eTMkBUrgSFjgDsaMt75gH2O0X93bJCcRBELuv50sFct6nxnwBWrcU9uQI42dH2G4QjrIf5CGnE3XVwLeMnIWGBIWe3iFwpXTjv6yKcH97J/FnoWhYQfBn/DxBhiiaUzSnUNd6C02PZJ9jqUYQGbW5M3MXfzaUaNdUlUC4P96iVL2aceeQ==
Received: from BN8PR15CA0034.namprd15.prod.outlook.com (2603:10b6:408:c0::47)
 by DM4PR12MB6471.namprd12.prod.outlook.com (2603:10b6:8:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Sat, 1 Jun
 2024 14:51:30 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:c0:cafe::83) by BN8PR15CA0034.outlook.office365.com
 (2603:10b6:408:c0::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27 via Frontend
 Transport; Sat, 1 Jun 2024 14:51:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Sat, 1 Jun 2024 14:51:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 1 Jun 2024
 07:51:19 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 1 Jun 2024 07:51:16 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <jasowang@redhat.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<maorg@nvidia.com>, <yishaih@nvidia.com>, <lingshan.zhu@intel.com>, "Parav
 Pandit" <parav@nvidia.com>
Subject: [PATCH v5 4/5] admin: Define common device parts
Date: Sat, 1 Jun 2024 17:50:41 +0300
Message-ID: <20240601145042.2074739-5-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240601145042.2074739-1-parav@nvidia.com>
References: <20240601145042.2074739-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|DM4PR12MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: d92c9192-2a2a-4fcd-4fad-08dc824a5261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uvbz63QU2oFRsFSy7j+qlwD3oDE+wnzOtHE/kN6tPFb2FGtP854aB6Dpn1g/?=
 =?us-ascii?Q?s3kkvTuV+Axiz8jngtsNbYrDNPz+fEZVGOHab89MKu3/0ucEfv5aJfCljDG5?=
 =?us-ascii?Q?w8MfFT7ZQfhhkKEnEaGwvZMZ3O2/YiZhZt//dF2cqjyApyt6wngYHm+H0YVs?=
 =?us-ascii?Q?N+JsLL3wYDFtLjXkIsmCTWH2Aq7y6LYxZuqDFoNtYalXqnSQNEceocV9KJAH?=
 =?us-ascii?Q?kTunqsMIRbuqXLhlR+t+C3spl5xPiWuF7THGMOca++oQSfMOXRyWQMLLYNCK?=
 =?us-ascii?Q?SQb/OH6ohf+0lZHymEDDC+60u32FqWtOaORo6oSM+8ZNN2X8v2ej5CIdYHm4?=
 =?us-ascii?Q?cnkhtNabpp4JYZLYBzPV5u7y26TZHbBYbt93nkq9jaEQgmqtSM/TTtT9TTYd?=
 =?us-ascii?Q?kY+4fJJgkX+f+XCrYKwNP2MDo6seQErsyrkCzAi20AjZotq2v7O//hkOAiPA?=
 =?us-ascii?Q?/eyA4wNS7itRWAZbDEVKRuepkWNZWct30znTHkKN/UxBsZxb8bL5B+alO7C2?=
 =?us-ascii?Q?Wy5FgGJ3Acgcdn9j71YPgQpqUbASkRgYwsScc+o4QkP+3jHHms18+RRm+vbx?=
 =?us-ascii?Q?gT22Eqm5Mv+ve7QQaqFQ6ZdVzyWtilPcoKI8u5eB1RpMIOulWnyKF9UeOwJ9?=
 =?us-ascii?Q?l/0UNiX8779KnFE53HF5bcbIl8SlDiNU/dUF6kdqbI70AggJ9caBpKIxHpAC?=
 =?us-ascii?Q?ko8wQDsusnpZ4CRNZeG2g6fBUuXWq6kgDQofXqom76GDFN6XDwp0XlQB3Nwe?=
 =?us-ascii?Q?rUOMbOuQmuczU+cxtIt3pzW/peOqaA7Nc6UEV8OLkS0f8Fx0ixL5dvub5o80?=
 =?us-ascii?Q?71GgvDET6t5oETQ4O4IoCdcozsjZAfvCNyV4Hnb5+yGhlEGJr032BNhkwe7U?=
 =?us-ascii?Q?0bNyhS2lBAAStvJjIg3CXojE8D8EzEoTuq5HT29WjHg3hrUojqQbGiGaD0F0?=
 =?us-ascii?Q?Zb7u8fy+RjaXIawURkCPe+qN89VO/V19e8Eze5lDOF/A6lDC8pU1wkai+5iT?=
 =?us-ascii?Q?X7g2SJuWMao7qwtHn4R0+zPRL9aNgutb6+45cFBUKQ5TN/KqW60BdagdvAfK?=
 =?us-ascii?Q?qSMd8zzcvT2KxVwDVq0gdWr5MpbVh7E9vDACc6Qgj5tme9/4fINqSIsD6osl?=
 =?us-ascii?Q?3MDAGad0Ud6S3oGj0OBO5ixH1D855Lvpn2q/NAXjwa9GG793D8qfjBXndGrh?=
 =?us-ascii?Q?Kc7EDlQinSSsO8qtzHPAiP44T90acKbxADYyKMeKymM4zG0SXagUMjLmqFIk?=
 =?us-ascii?Q?jCjhCOp4rQZVL3B3gYT0w9XJ7mqpvnjuteOV9cWum3dIKXi1e/igxMTBpsKl?=
 =?us-ascii?Q?TH5ZL7C840zlZIqiwiPxKz3jFQ6bKiGjU5MWNsSr8vySSN1Tbr3zqYVN8oMR?=
 =?us-ascii?Q?H9ShlZ2H1kBiNYS/TEPUFUvYRc/j?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2024 14:51:29.9036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d92c9192-2a2a-4fcd-4fad-08dc824a5261
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6471

Define common device parts that represents the state of the device.
The driver can get and set these device parts using administration
commands.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v5->v6:
- renamed 'device context' to 'device parts'
- use actual part name for the subsection
- moved device part guidance to newdevice.tex file
- VQ_SPLIT changed to SPLIT_VQ
- dropped PCI prefix from the device parts
- moved common fields to its own subsection
- added hyper reference in the table
- split device status to its own TLV so multiple transport can enjoy it
---
 admin-cmds-device-parts.tex |  37 ++++++
 content.tex                 |   1 +
 device-parts.tex            | 231 ++++++++++++++++++++++++++++++++++++
 newdevice.tex               |  24 ++++
 4 files changed, 293 insertions(+)
 create mode 100644 device-parts.tex

diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
index 36a45d3..05d2477 100644
--- a/admin-cmds-device-parts.tex
+++ b/admin-cmds-device-parts.tex
@@ -282,3 +282,40 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 When the command completes successfully and if the \field{flags} field
 is set to zero, the device resumes its operation. If the command completes
 with an error, it does not produce any side effects on the device.
+
+\paragraph{Device parts order}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order}
+
+Device parts are usually captured and restored using get and set administration
+commands respectively; when multiple device parts are captured or restored,
+they are arranged in the specific order listed:
+
+Some of the device parts do not need to be written to the device when restored, such
+device parts are listed as \field{O}. When a such an optional device part is
+exchanged using \field{struct virtio_dev_part}, it is marked as optional by
+setting VIRTIO_DEV_PART_F_OPTIONAL(bit 0) in the \field{flags}.
+
+\begin{table}[H]
+\caption{Device parts order}
+\label{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order}
+\begin{xltabular}{\textwidth}{ |l|l|X| }
+\hline
+Part name & Optional & Mandatory preceding parts \\
+\hline \hline
+\hline
+VIRTIO_DEV_PART_DEV_FEATURES & O & Nil \\
+\hline
+VIRTIO_DEV_PART_DRV_FEATURES & - & Nil \\
+\hline
+VIRTIO_DEV_PART_PCI_COMMON_CFG & - & VIRTIO_DEV_PART_DEV_FEATURES, VIRTIO_DEV_PART_DRV_FEATURES \\
+\hline
+VIRTIO_DEV_PART_DEVICE_STATUS & - & VIRTIO_DEV_PART_DEV_FEATURES, VIRTIO_DEV_PART_DRV_FEATURES, VIRTIO_DEV_PART_PCI_COMMON_CFG \\
+\hline
+VIRTIO_DEV_PART_VQ_CFG & - & VIRTIO_DEV_PART_DEV_FEATURES, VIRTIO_DEV_PART_DRV_FEATURES, VIRTIO_DEV_PART_PCI_COMMON_CFG,
+                             VIRTIO_DEV_PART_DEVICE_STATUS \\
+\hline
+VIRTIO_DEV_PART_VQ_NOTIFY_CFG & - & VIRTIO_DEV_PART_DEV_FEATURES, VIRTIO_DEV_PART_DRV_FEATURES, VIRTIO_DEV_PART_PCI_COMMON_CFG,
+                             VIRTIO_DEV_PART_DEVICE_STATUS, VIRTIO_DEV_PART_VQ_CFG \\
+\hline
+\hline
+\end{xltabular}
+\end{table}
diff --git a/content.tex b/content.tex
index d7d544e..8849522 100644
--- a/content.tex
+++ b/content.tex
@@ -503,6 +503,7 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
 
 \input{admin.tex}
+\input{device-parts.tex}
 
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
 
diff --git a/device-parts.tex b/device-parts.tex
new file mode 100644
index 0000000..7384408
--- /dev/null
+++ b/device-parts.tex
@@ -0,0 +1,231 @@
+\section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device parts}
+
+Device parts represent the device state, with parts for basic
+device facilities such as driver features, as well as transport specific
+and device type specific parts. In memory, each device part consists
+of a header \field{struct virtio_dev_part_hdr} followed by
+the device part data in \field{value}. The driver can get and set
+these device parts using administration commands.
+
+\begin{lstlisting}
+struct virtio_dev_part_hdr {
+        le16 part_type;
+        u8 flags;
+        u8 reserved;
+        union {
+                struct {
+                        le32 offset;
+                        le32 reserved;
+                } pci_common_cfg;
+                struct  {
+                        le16 index;
+                        u8 reserved[6];
+                } vq_index;
+        } selector;
+        le32 length;
+};
+
+#define VIRTIO_DEV_PART_F_OPTIONAL 0
+
+struct virtio_dev_part {
+        struct virtio_dev_part_hdr hdr;
+        u8 value[];
+};
+
+\end{lstlisting}
+
+Each device part consists of a fixed size \field{hdr} followed by optional
+part data in field \field{value}. The device parts are divided into
+two categories and identified by \field{part_type}. The common device parts are
+independent of the device type and, are in the range \field{0x0000 - 0x01FF}. Common
+device parts are listed in
+\ref{table:Basic Facilities of a Virtio Device / Device parts / Common device parts}
+The device parts in the range \field{0x0200 - 0x05FF} are specific to a device type
+such as a network or console device.
+The device part is identified by the \field{part_type} field as listed:
+
+\begin{description}
+\item[0x0000 - 0x01FF] - common part - used to describe a part of the device that
+                         is independent of the device type
+\item[0x0200 - 0x05FF] - device type specific part - used to indicate parts
+                         that are device type specific
+\item[0x0600 - 0xFFFF] - reserved
+\end{description}
+
+Some device parts are optional, the device can function without them.
+For example, such parts can help improve performance, with the device working
+slower, yet still correctly, even without the parts. In another example,
+optional parts can be used for validation, with the device being able to deduce
+the part itself, the part being helpful to detect driver or user errors.
+Such device parts are marked optional by setting bit 0
+(VIRTIO_DEV_PART_F_OPTIONAL) in the \field{flags}.
+
+\field{reserved} is reserved and set to zero.
+
+\field{length} indicates the length of the \field{value} in bytes. The length
+of the device part depends on the device part itself and is described separately.
+The device part data is in \field{value} and is \field{part_type} specific.
+
+\field{selector} further specifies the part. It is only used for some
+\field{part_type} values.
+
+\field{selector.pci_common_cfg.offset} is the offset of the
+field in the \hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout]{Virtio PCI common config space}. It is valid only when the \field{part_type} is set to VIRTIO_DEV_PART_PCI_COMMON_CFG,
+otherwise it is reserved and set to 0.
+
+\field{selector.vq_index.index} is the index of the virtqueue. It is valid
+only when the \field{part_type} is VIRTIO_DEV_PART_VQ_CFG or
+VIRTIO_DEV_PART_VQ_CFG.
+
+\subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts}
+
+Common parts are independent of the device type.
+\field{part_type} and \field{value} for each part are documented as follows:
+
+\begin{table}
+\caption{Common device parts}
+\label{table:Basic Facilities of a Virtio Device / Device parts / Common device parts}
+\begin{xltabular}{\textwidth}{ |l||l|X| }
+\hline
+Type & Name & Description \\
+\hline \hline
+0x100 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEV_FEATURES]{VIRTIO_DEV_PART_DEV_FEATURES} & Device features \\
+\hline
+0x101 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DRV_FEATURES]{VIRTIO_DEV_PART_DRV_FEATURES} & Driver features \\
+\hline
+0x102 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_PCI_COMMON_CFG]{VIRTIO_DEV_PART_PCI_COMMON_CFG} & PCI common configuration \\
+\hline
+0x103 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS]{VIRTIO_DEV_PART_DEVICE_STATUS} & Device status \\
+\hline
+0x104 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_CFG]{VIRTIO_DEV_PART_VQ_CFG} & Virtqueue configuration \\
+\hline
+0x105 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_NOTIFY_CFG]{VIRTIO_DEV_PART_VQ_NOTIFY_CFG} & Virtqueue notification configuration \\
+\hline
+0x106 - 0x2FF & - & Common device parts range reserved for future \\
+\hline
+\hline
+\end{xltabular}
+\end{table}
+
+\subsubsection{VIRTIO_DEV_PART_DEV_FEATURES}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEV_FEATURES}
+
+For VIRTIO_DEV_PART_DEV_FEATURES, \field{part_type} is set to 0x100.
+The VIRTIO_DEV_PART_DEV_FEATURES field indicates features offered by the device.
+\field{value} is in the format of \field{struct virtio_dev_part_features}.
+\field{feature_bits} is in the format listed in
+\ref{sec:Basic Facilities of a Virtio Device / Feature Bits}.
+\field{length} is the length of the \field{struct virtio_dev_part_features}.
+
+If the VIRTIO_DEV_PART_DEV_FEATURES device part is present, there is exactly
+one instance of it in the get or set commands.
+
+The VIRTIO_DEV_PART_DEV_FEATURES part is optional for which
+the VIRTIO_DEV_PART_F_OPTIONAL (bit 0) \field{flags} is set.
+
+\begin{lstlisting}
+struct virtio_dev_part_features {
+        le64 feature_bits[];
+};
+\end{lstlisting}
+
+\subsubsection{VIRTIO_DEV_PART_DRV_FEATURES}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DRV_FEATURES}
+
+For VIRTIO_DEV_PART_DRV_FEATURES, \field{part_type} is set to 0x101.
+The VIRTIO_DEV_PART_DRV_FEATURES field indicates features set by the driver.
+\field{value} is in the format of \field{struct virtio_dev_part_features}.
+\field{feature_bits} is in the format listed in
+\ref{sec:Basic Facilities of a Virtio Device / Feature Bits}.
+\field{length} is the length of the \field{struct virtio_dev_part_features}.
+
+If the VIRTIO_DEV_PART_DEV_FEATURES device part present, there is exactly
+one instance of it in the get or set commands.
+
+\subsubsection{VIRTIO_DEV_PART_PCI_COMMON_CFG}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_PCI_COMMON_CFG}
+
+For VIRTIO_DEV_PART_PCI_COMMON_CFG, \field{part_type} is set to 0x102.
+VIRTIO_DEV_PART_PCI_COMMON_CFG refers to the common device configuration
+fields. \field{offset} refers to the
+byte offset of single field in the common configuration layout described in
+\field{struct virtio_pci_common_cfg}. \field{value} is in the format depending on
+the \field{offset}, for example when \field{cfg_offset = 18}, \field{value}
+is in the format of \field{num_queues}. \field{length} is the length of
+\field{value} in bytes of a single structure field whose offset is \field{offset}.
+
+One or multiple VIRTIO_DEV_PART_PCI_COMMON_CFG parts may exist in the
+get or set commands; each such part corresponds to a unique \field{offset}.
+
+\subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}\label{par:VIRTIO_DEV_PART_DEVICE_STATUS}
+
+For VIRTIO_DEV_PART_DEVICE_STATUS, \field{part_type} is set to 0x103.
+The VIRTIO_DEV_PART_DEVICE_STATUS field indicates the device status as listed in
+\ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
+\field{value} is in the format \field{device_status} of
+\field{struct virtio_pci_common_cfg}.
+
+If the VIRTIO_DEV_PART_DEV_FEATURES device part is present, there is exactly
+one instance of it in the get or set commands.
+
+There is exactly one part may exist in the get or set
+commands.
+
+\subsubsection{VIRTIO_DEV_PART_VQ_CFG}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_CFG}
+
+For VIRTIO_DEV_PART_VQ_CFG, \field{part_type} is set to 0x104.
+\field{value} is in the format \field{struct virtio_dev_part_vq_cfg}.
+\field{length} is the length of \field{struct virtio_dev_part_vq_cfg}.
+
+\begin{lstlisting}
+struct virtio_dev_part_vq_cfg {
+        le16 queue_size;
+        le16 vector;
+        le16 enabled;
+        le16 reserved;
+        le64 queue_desc;
+        le64 queue_driver;
+        le64 queue_device;
+};
+\end{lstlisting}
+
+\field{queue_size}, \field{vector}, \field{queue_desc},
+\field{queue_driver} and \field{queue_device} correspond to the
+fields of \field{struct virtio_pci_common_cfg} when used for PCI transport.
+
+One or multiple instances of the device part VIRTIO_DEV_PART_VQ_CFG may exist in
+the get and set commands. Each such device part corresponds to a unique virtqueue identified
+by the \field{vq_index.index}.
+
+\subsubsection{VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
+
+For VIRTIO_DEV_PART_VQ_NOTIFY_CFG, \field{part_type} is set to 0x105.
+\field{value} is in the format \field{struct virtio_dev_part_vq_notify_data}.
+\field{length} is the length of \field{struct virtio_dev_part_vq_notify_data}.
+
+\begin{lstlisting}
+struct virtio_dev_part_vq_notify_data {
+        le16 queue_notify_off;
+        le16 queue_notif_config_data;
+        u8 reserved[4];
+};
+\end{lstlisting}
+
+\field{queue_notify_off} and \field{queue_notif_config_data} corresponds to the
+fields in \field{struct virtio_pci_common_cfg} described in
+\hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout]{Virtio PCI common configuration space}.
+
+One or multiple instance of the device part VIRTIO_DEV_PART_VQ_NOTIFY_CFG may exist
+in the get and set commands, each such device part corresponds to a unique
+virtqueue identified by the \field{vq_index.index}.
+
+\field{reserved} is reserved and set to 0.
+
+\subsection{Assumptions}
+For the SR-IOV group type, some hypervisors do not allow the driver to access
+the PCI configuration space and the MSI-X Table space directly. Such hypervisors
+query and save these fields without the need for this device parts.
+Therefore, this version of the specification does not have it in the device parts. A future
+extension of the device part may further include them as new device part.
diff --git a/newdevice.tex b/newdevice.tex
index c18689f..870ea68 100644
--- a/newdevice.tex
+++ b/newdevice.tex
@@ -85,3 +85,27 @@ \section{Device Improvements}\label{sec:Creating New Device Types or Extending t
 can use a single bit, but if one feature makes sense without the
 others they should not be gratuitously grouped together to
 conserve feature bits.
+
+\section{How to define a new device part?}\label{sec:Creating New Device Types or Extending the Device / How to define a new device part?}
+Few considerations are necessary when creating new device part or
+when extending the device part structure.
+If the new field is generic for all the device types or most of the device types,
+a new device part should be defined as common device part by claiming a new \field{type} value.
+If the new field is unique to a device type, a new device specific device part should
+be added.
+range.
+
+\section{When to define a new device part?}\label{sec:Creating New Device Types or Extending the Device / When to define a new device part?}
+When the device part for a specific field does not exists, one should
+define a new device part.
+
+\section{How to avoid device part duplication with existing structure?}\label{sec:Creating New Device Types or Extending the Device / How to avoid device part duplication with existing structure?}
+Each device should reuse any existing field definition that may exists as part
+of device control virtqueue or any other existing structure definition.
+
+\section{How to extend the existing device part definition?}\label{sec:Creating New Device Types or Extending the Device / How to extend the existing device part definition?}
+
+When a field is missing in already defined device part, a new field should be added at
+the end of the existing device part. New field MUST not be added at beginning or in
+the middle of the device part structure. Any field which is already present MUST NOT
+be removed.
-- 
2.34.1

