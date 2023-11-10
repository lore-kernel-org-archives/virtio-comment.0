Return-Path: <virtio-comment-return-8317-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BDBC4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3FA458508C
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 34FFA986D38
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2BF05986D06; Fri, 10 Nov 2023 12:32:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1E549986D22
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhpLM2y2HuQIsq1MUrGVa1w1bcf8sa6w+aLAYM6DygAG4GcEug146j7VyXVQWSBMm/FbP1bpUg4LUTTI9MnntZuzK6kRJQYjm6BgQfNpK+ArFfcmQCnFSUGzkrt28TiNa2stH0ILp978ikePWqp5uCGPnGcMlVaXCrrzeSHOf609oCqXidyLKYxsCQnjdEr6MC1qAkv6CpBc//NRXePWDKqAaMNCDiHy8jKKhz3Y5goUYK8d4xfvFqfjAD68E3roA96GraEjRsHunNN2aSGmuoXB83aeq1SdAThGoxTPu/Lg3uPbiNG8konO2ZqPTw2CUpkG2hzphpMiE0bQUd/Z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks8Ps+UxRHp6RxGHkFgzvMNkBUepBNPTJFUBOMb8hgo=;
 b=XdwT41/AwCMDhHpxA48vxqQGld3YDeBSwgb/jfBmCk9TMy+NjRlkUpiCnft2YXeCoJpZr18t9t2HMwFgGxLjuhut5lgazCdmBRtPAkadzskub1XEW5xfv1eAYOghE5afdxrD/ldqhdzEZQ5dfKtrxZarIg8vhSimPgBcpXTwyZqJVaG3gdVANpokisYTlK1sb7++V7XblIeucMg4bf3/zBVZNL4gus+T9/tTmwQSq9UMN9dfU2yDV+gWeby7BT3i1jgsQRYd62ZtuC+0dBp7Uy91RpOjRtR9WZmR5kRWa44TuyjcTvEIlgZQLKaoiEs7ieX8GJxCQxXNKt2fa674Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Fri, 10 Nov 2023 14:31:55 +0200
Message-ID: <20231110123200.2082779-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110123200.2082779-1-parav@nvidia.com>
References: <20231110123200.2082779-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|MN2PR12MB4503:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe071e8-06fe-4fdd-b9e2-08dbe1e91d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UdKVXc/T1X3Aq8ycSibYCDfQxn5yS8rV5+Ne3VuAoKDotrTyqoiVAiLJQLaF2uV2+ofRI42+BELPvZjK0OxvINvigE0xZBNMembNK5wO3tIPpk3O/urXR5h8LZcHISKMZ33blmz3lqYww6HN7z67kQwHEEtI1537bSVdiXxXrZ7Jc/HiUrFPA16FjGZOGGok8Yn3yDqBk3nxwCbOYeHikW24MTnMXsEGg1mrObwxec6O85c26BVyW477FJ+I2eLOcsw+PnxkvShln002jaoWmBlDfWUZbboUICkLqVyNzkQe8ss92oF5TIauL156FX0XTm91bbdLQR977sbPoBUC5xL9jRgfgDkGZJAmNRJXvik9somMMKDYclyaHSUGtId5NI7/28uWj3myzLohfrjehup0PWxy0vxTx7vR+aGjDI890R1yvTwtLiXNfZuJUxkhdtyM2kKTG0716cltLQGB4CPXyp/PRaWMJ0Q0QRBdtKdWaatOJmu4Pjp/lka3t3fjF9J7S6/zGvxWNA0jhWTy9ewfdMs0XXNYEiNI9wdkbZgYB4DuFASMFXaKHyv1mQ2kfrHSODHuzMR/OBPhbYd4Y1WyP68OyyAGHG8V0q2cLzwpO8AkwBCDvGWMSVoiVk8Os+TgRxLC7NklCQIA3KKZHUWN+nLFWcZFH0mMcYtpr7H64WdoG0XhIGKCS3CoG10CKMFIIypcXA2feuFtOAsldIFM6n62ruEPtPQ/9oGGB9rLrBQYWFZZorpoS584nwMsCO5E4KBmBBJMLjwm1NicjWw4EQA2r+cXySYmWS5lkoc=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(16526019)(40460700003)(36756003)(478600001)(4326008)(47076005)(5660300002)(83380400001)(8676002)(8936002)(2906002)(36860700001)(30864003)(2616005)(966005)(70206006)(70586007)(426003)(26005)(110136005)(336012)(54906003)(316002)(40480700001)(107886003)(6666004)(1076003)(86362001)(41300700001)(7636003)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:32:33.5275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe071e8-06fe-4fdd-b9e2-08dbe1e91d34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4503
Subject: [virtio-comment] [PATCH v4 3/8] device-context: Define the device context fields for device migration

Define the device context and its fields for purpose of device
migration. The device context is read and written by the owner driver
on source and destination hypervisor respectively.

Device context fields will experience a rapid growth post this initial
version to cover many details of the device.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Satananda Burla <sburla@marvell.com>
---
changelog:
v3->v4:
- moved vq enabled field to vq config struct so that it can be used
  for packed vq and split vq uniformly.
- reduce length in the field tlv from 64-bit to 32-bit to be realistic
- added missing num_entries in the feature bits tlv
- fixed copy paste error on structure for
  VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC field
- corrected discard field type location and enum values
- enhanced queue context
v2->v3:
- drop fields_count to support dynamic size device context
- instead, define start and end marker context fields
- added split virtqueue's used ring fields at they are read only
  fields for the device, so the device may not be able to read them
  after device is moved to active mode
- added device context invalidate tlv to speed up context migration
  under device reset flow
- split context types in 3 categories, marker, device common and device
  specific
v1->v2:
- addressed comments from Michael
- dropped layout from the enums and definition
- defined more practical fields type range of 16-bit
- split the range to generic and device type range
- added assumptions and device context extension sections for future
  proofing
v0->v1:
- enrich device context to cover feature bits, device configuration
  fields
- corrected alignment of device context fields
---
 content.tex        |   1 +
 device-context.tex | 251 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 252 insertions(+)
 create mode 100644 device-context.tex

diff --git a/content.tex b/content.tex
index 0a62dce..2698931 100644
--- a/content.tex
+++ b/content.tex
@@ -503,6 +503,7 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
 
 \input{admin.tex}
+\input{device-context.tex}
 
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
 
diff --git a/device-context.tex b/device-context.tex
new file mode 100644
index 0000000..e4d586a
--- /dev/null
+++ b/device-context.tex
@@ -0,0 +1,251 @@
+\section{Device Context}\label{sec:Basic Facilities of a Virtio Device / Device Context}
+
+The device context holds the information that a owner driver can use
+to setup a member device and resume its operation. The device context
+of a member device is read or written by the owner driver using
+administration commands.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_field_tlv {
+        le16 type;
+        u8 reserved[2];
+        le32 length;
+        u8 value[];
+};
+
+struct virtio_dev_ctx {
+        struct virtio_dev_ctx_field_tlv fields[];
+};
+
+\end{lstlisting}
+
+The \field{struct virtio_dev_ctx} is the device context of a member device.
+It consist of two or more \field{struct virtio_dev_ctx_field_tlv} fields in it.
+
+The \field{struct virtio_dev_ctx_field_tlv} consist of \field{type} indicating
+what data is contained in the \field{value} of length \field{length}.
+The valid values for \field{type} can be found in the following table:
+
+\begin{table}
+\caption{\label{tab:Device Context Fields} Device Context Fields}
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+Type & Name & Description \\
+\hline \hline
+\hline
+0x0 & VIRTIO_DEV_CTX_START_MARKER & Indicates start of the device context \\
+\hline
+0x1 & VIRTIO_DEV_CTX_END_MARKER & Indicates end of the device context \\
+\hline
+0x2 & VIRTIO_DEV_CTX_DISCARD & Indicates to discard device context \\
+\hline
+0x3 - 0xFF & - & device context markers reserved for future \\
+\hline
+\hline
+\hline
+0x100 & VIRTIO_DEV_CTX_DEV_FEATURES & Provides device features \\
+\hline
+0x101 & VIRTIO_DEV_CTX_PCI_COMMON_CFG & Provides common configuration space of device for PCI transport \\
+\hline
+0x102 & VIRTIO_DEV_CTX_PCI_VQ_CFG & Provides Virtqueue configuration for PCI transport \\
+\hline
+0x103 & VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG & Provides Queue run time state \\
+\hline
+0x104 & VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC & Provides list of virtqueue descriptors owned by device  \\
+\hline
+0x105 - 0xFFF & - & Generic device agnostic range reserved for future \\
+\hline
+\hline
+0x1000 & VIRTIO_DEV_CTX_DEV_CFG & Provides device specific configuration \\
+\hline
+0x1001 - 0x1FFF & - & Device type specific range reserved for future \\
+\hline
+\hline
+0x2000 - 0xFFFF & - & Reserved for future \\
+\hline
+\end{tabularx}
+\end{table}
+
+\subsection{Device Context Fields}\label{sec:Basic Facilities of a Virtio Device / Device Context / Device Context Fields}
+
+Device Context Fields are of three types:
+
+\begin{description}
+\item[Context Marker] type indicates the fields to describe the device
+     context itself. They are in the range 0 to 0xFF.
+\item[Device Common] type indicates the fields which are common across all devices.
+     They are in the range 0x100 to 0x1FFF.
+\item[Device Specific] type indicates the fields which are device type specific.
+     They are in the range 0x1000 to 0x2FFF.
+\end{description}
+
+\subsubsection{Device Context Start Marker}
+For the field VIRTIO_DEV_CTX_START_MARKER, \field{type} is set to 0x0.
+The \field{value} is empty. The \field{length} is set to 0x0.
+
+\field{Device Context Start Marker} indicates the start of the device context.
+All the other device context fields are located after this field.
+
+\subsubsection{Device Context End Marker}
+For the field VIRTIO_DEV_CTX_END_MARKER, \field{type} is set to 0x1.
+The \field{value} is empty. The \field{length} is set to 0x0.
+
+\field{Device Context End Marker} indicates the end of the device context.
+All the other device context fields are located before this field.
+
+\subsubsection{Device Context Discard}
+For the field VIRTIO_DEV_CTX_DISCARD, \field{type} is set to 0x2.
+The \field{value} is empty. The \field{length} is set to 0x0.
+
+\field{Device Context Discard} indicates that any previous device context
+fields of in \field{Device Common} and in \field{Device Specific} ranges are invalid.
+
+\subsubsection{Device Features Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Device Features Context}
+
+For the field VIRTIO_DEV_CTX_DEV_FEATURES, \field{type} is set to 0x100.
+The \field{value} is in format of device feature bits listed in
+\ref{sec:Basic Facilities of a Virtio Device / Feature Bits} in the format of \field{struct virtio_dev_ctx_features}.
+The \field{length} is the length of the \field{struct virtio_dev_ctx_features}.
+The \field{num_entries} indicates number of entries of the array
+\field{feature_bits}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_pci_vq_cfg {
+        u8 num_entries;
+        u8 reserved[7];
+        le64 feature_bits[];
+};
+\end{lstlisting}
+
+\subsubsection{PCI Common Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Common Configuration Context}
+
+For the field VIRTIO_DEV_CTX_PCI_COMMON_CFG, \field{type} is set to 0x101.
+The \field{value} is in format of \field{struct virtio_pci_common_cfg}.
+The \field{length} is the length of \field{struct virtio_pci_common_cfg}.
+
+\subsubsection{PCI Virtqueue Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Virtqueue Configuration Context}
+
+For the field VIRTIO_DEV_CTX_PCI_VQ_CFG, \field{type} is set to 0x102.
+The \field{value} is in format of \field{struct virtio_dev_ctx_pci_vq_cfg}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_pci_vq_cfg}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_pci_vq_cfg {
+        le16 vq_index;
+        le16 queue_size;
+        le16 queue_msix_vector;
+        le16 enabled;
+        le16 queue_notify_off;
+        le16 queue_notif_config_data;
+        le64 queue_desc;
+        le64 queue_driver;
+        le64 queue_device;
+};
+\end{lstlisting}
+
+One or multiple entries of PCI Virtqueue Configuration Context may exist, each
+such entry corresponds to a unique virtqueue identified by the \field{vq_index}.
+
+If the \field{enabled} is set to 0, all the remaining fields of
+\field{struct virtio_dev_ctx_pci_vq_cfg} are invalid; if the \field{enabled} is
+set to 1, all the remaining fields of  \field{struct virtio_dev_ctx_pci_vq_cfg}
+are valid.
+
+\subsubsection{Virtqueue Split Mode Runtime Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Virtqueue Split Mode Runtime Context}
+
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG, \field{type} is set to 0x103.
+The \field{value} is in format of \field{struct virtio_dev_ctx_vq_split_runtime}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_vq_split_runtime}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_vq_split_runtime {
+        le16 vq_index;
+        le16 dev_avail_idx;
+        le16 used_flags;
+        le16 used_idx;
+        le16 used_avail_event;
+};
+\end{lstlisting}
+
+One or multiple entries of \field{struct virtio_dev_ctx_vq_split_runtime}
+may exist, each such entry corresponds to a virtqueue identified
+by the \field{vq_index}.
+
+The \field{dev_avail_idx} indicates the next available index of the virtqueue from which
+the device must start processing the available ring.
+
+The \field{used_flags} indicates the last value written by the device for the
+field \field{flags} in the used ring \field{struct virtq_used}.
+
+The \field{used_idx} indicates the last value written by the device for the field
+\field{idx} in the used ring \field{struct virtq_used}.
+
+The \field{used_avail_event} indicates the last value written by the device in the
+field \field{avail_event} in the used ring \field{struct virtq_used}.
+
+\subsubsection{Virtqueue Split Mode Device owned Descriptors Context}
+
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC, \field{type} is set to 0x104.
+The \field{value} is in format of \field{struct virtio_dev_ctx_vq_split_dev_descs}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_vq_split_dev_descs}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_vq_split_dev_descs {
+        le16 vq_index;
+        le16 desc_count;
+        le16 desc_idx[];
+};
+\end{lstlisting}
+
+The \field{desc_idx} contains indices of the descriptors in \field{desc_count} of a
+virtqueue identified by \field{vq_index} which is owned by the device.
+
+One or multiple entries of \field{struct virtio_dev_ctx_vq_split_dev_descs} may exist, each such
+entry corresponds to a virtqueue identified by the \field{vq_index}.
+
+\subsubsection{Device Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Device Configuration Context}
+
+For the field VIRTIO_DEV_CTX_DEV_CFG, \field{type} is set to 0x1000.
+The \field{value} is in format of device specific configuration listed
+in each of the device's device configuration layout section.
+For example, for File System Device, \field{value} is in format of
+\field{struct virtio_fs_config}.
+The \field{length} is the length of the device configuration data of
+\field {value}.
+
+\subsubsection{Device Context Extensions}
+Various considerations are necessary when creating new device context field or
+when extending the device context field structure.
+
+1. How to define a new device context field? \\
+If the new field is generic for all the device types or most of the device types,
+it should be added under the generic field range. If the new field is unique to
+a device type, it should be added under the device range type. \\
+
+2. When to define a new device context field? \\
+When the device context field for a specific field does not exists, one should
+define a new device context field. \\
+
+3. How to avoid duplication of device context field definition with device
+   specific structures which may be present as control vq data structures? \\
+Each device should reuse any existing field definition that may exists as part
+of device control virtqueue or any other request structure. \\
+
+4. How to extend the existing device context field definition? \\
+When a element is missing in already defined field, a new field must be added at
+the end of the device context field. New field MUST not be added at beginning or in
+the middle of the field structure. Any field which is already present MUST NOT
+be removed. \\
+
+\subsubsection{Assumptions}
+For the SR-IOV group type, some hypervisor do not permit the driver to access
+PCI configuration space and MSI-X Table space directly. Such hypervisor handles the
+query and saving of these fields without the need of its existence in device context.
+Hence, this version of the specification do not have it in the device context. A future
+extension of the device context may further include them with new field type for
+each of the field.
-- 
2.34.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

