Return-Path: <virtio-comment-return-8045-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCDEC4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E3835613C3
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF09A986B49
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D3B92986B37; Mon, 30 Oct 2023 13:20:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C46D0986B38
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 13:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebh7fV+9AOXqyIk6tvTR7d594jw2JfH4zmXgVazhqOobpptoOi/jKVUqDgRRb/cR0fCIRvmEB84otqG24U2M7BAx1VpT3bNqmC5AGLyIkaUsdAG4M0NAtQ2SM245Xf4bpJf+PM+wEKKf/WEV7cYa7UxLCwLQa2kUpY9t0u39YR7+Op6pmjO/D08RQFb/MmLPCpa9+bu5smHBj835+EszIntHF8py0OGwnxDQGVr5c7TOBLyHNQLtOFVxoPQzzGyulKoKBllmIFMpHmPAzaYmqG+hpuQsbKd2KGrcBrfM/ikU/gltuDdelyvLV6qxdfNk49yx0wyOK6Mnyfw50vnn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR+zVpBHXe+KGjrzr2ugwEUk8fmzzpVhb+z/+kd16qQ=;
 b=NtqST2+qqzKf2ysuHBd+R1woZ7FEdeWofk5S9l697VrqaY1wuu1W9uADX9mmWKOu/d5bjsKmhd7ErUPNGXD1v1cD1h9DKsA+soXtlnlTfzapWmMapK5JAm6G/6be/MFJGE9Y8GpRlhFHXBI29x+xsvlEr51fNvItbux71pDGSGz+mTSn2oc9SD4Ey6HlERceY9Pk3DesjUQcusDGsnsboiAvGbRJn9XYCtU6KvbUFSNq+oJwhqZ9TEK8gb9751V++jsJ9BJR1LjUscrzYhzgXarjJ0valbU2nk3t00TBRxWGxKglLvQk8UhuKSZVO9J4Dg3soEoAcaABBMD4WC0D+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Mon, 30 Oct 2023 15:19:54 +0200
Message-ID: <20231030131959.1386107-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231030131959.1386107-1-parav@nvidia.com>
References: <20231030131959.1386107-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|SA3PR12MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: e4788da9-921a-41f7-f52f-08dbd94b0507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hp/tsjArEOQSKtofN9RmXACH8m69pr6/cYEh1rFfZRsmrOEN7KyZ54lS6oohPOjPuJkcAYp7CohVtoYaLEn9DhLEITzy/YYMtpZM+N1EP1/8JEJMPvHXqic1LruYOvpW3UAImRYYy8HknWJj2srmRSVny5AMoKLS8SEZ3u5h8AkyoSTXxQncPIl7KIrE5q8gQ9ApFc7RHkEy2YWJiKouruFedmRh6qC0DCZ9xJF76d+qDyZQUgqtOuvbzALw334dPbZiVNuc5jZ0OsCmNVLRCkthQxQ91kqzDhWdY8sl8kJv/1YzM/h1WvRilqpH+oRVP0cB0/gG+y3CYrgnwO9ChXSs/SvBl9072xrPNSRd7GSihRiJUD6mdz0YDK8+xkx/wf5BD0LUkpRce+TViBrnoQ1npsVLczuVjE95ze4Wlhi/i+qSQ/ygZwgUwkZDH0sfy77/m96eXtXTRMmm/EgnL9DoYt58NjAIgboCxFkZiV9nd+lrkjlGVLEypV5Lqwb8Smy6p5k3ofzUQ0jT6fiOHr9OK6raptBtch5rfeeBqHTxnz/pOlgkY4W95uyrzkJT6ZXolAxizWFpFp80+BTAMeD6bWoAQKKyGJh7PZAzzpQDVDYq3+nf98DIVgZFawitYR9x0dtcOJFfMNV0g+1m82dk53jjy2+ilSKr3sHyNAtjXXndBtjnH8MLjHKNvSBij0P2SbxUhZdLxG5Ju2P5MOVP3yJfJk26u4r7gLRsXKqLCXe+/Z++w8f1mmKWzQ4tbl6wDkafR21jP6V/O9afwQyfcxyTJcYtiJkwqsB+1E0=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(40470700004)(46966006)(36840700001)(2906002)(40460700003)(36860700001)(54906003)(70586007)(70206006)(47076005)(7636003)(356005)(82740400003)(316002)(26005)(107886003)(6666004)(966005)(478600001)(110136005)(83380400001)(2616005)(1076003)(336012)(426003)(16526019)(41300700001)(5660300002)(30864003)(8936002)(8676002)(4326008)(86362001)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:20:43.1676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4788da9-921a-41f7-f52f-08dbd94b0507
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7830
Subject: [virtio-comment] [PATCH v3 3/8] device-context: Define the device context fields for device migration

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
 device-context.tex | 241 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 242 insertions(+)
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
index 0000000..06ed43d
--- /dev/null
+++ b/device-context.tex
@@ -0,0 +1,241 @@
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
+        u8 reserved[6];
+        le64 length;
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
+0x3 - 0xFF & - & device context markers \\
+\hline
+\hline
+0x100 & VIRTIO_DEV_CTX_DISCARD & Indicates to discard device context \\
+\hline
+0x101 & VIRTIO_DEV_CTX_DEV_FEATURES & Provides device features \\
+\hline
+0x102 & VIRTIO_DEV_CTX_PCI_COMMON_CFG & Provides common configuration space of device for PCI transport \\
+\hline
+0x103 & VIRTIO_DEV_CTX_PCI_VQ_CFG & Provides Virtqueue configuration for PCI transport \\
+\hline
+0x104 & VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG & Provides Queue run time state \\
+\hline
+0x105 & VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC & Provides list of virtqueue descriptors owned by device  \\
+\hline
+0x106 - 0xFFF & - & Generic device agnostic range reserved for future \\
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
+\item[Context Marker] type indicates the fields to describe the device context itself.
+     They are in the range 0 to 0xFF.
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
+For the field VIRTIO_DEV_CTX_DISCARD, \field{type} is set to 0x100.
+The \field{value} is empty. The \field{length} is set to 0x0.
+
+\field{Device Context Invalidate} indicates that any previous device context
+fields of in \field{Device Common} and in \field{Device Specific} range are invalid.
+
+\subsubsection{Device Features Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Device Features Context}
+
+For the field VIRTIO_DEV_CTX_DEV_FEATURES, \field{type} is set to 0x101.
+The \field{value} is in format of device feature bits listed in
+\ref{sec:Basic Facilities of a Virtio Device / Feature Bits} in the format of \field{struct virtio_dev_ctx_features}.
+The \field{length} is the length of the \field{value}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_pci_vq_cfg {
+        le64 feature_bits[];
+};
+\end{lstlisting}
+
+\subsubsection{PCI Common Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Common Configuration Context}
+
+For the field VIRTIO_DEV_CTX_PCI_COMMON_CFG, \field{type} is set to 0x102.
+The \field{value} is in format of \field{struct virtio_pci_common_cfg}.
+The \field{length} is the length of \field{struct virtio_pci_common_cfg}.
+
+\subsubsection{PCI Virtqueue Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Virtqueue Configuration Context}
+
+For the field VIRTIO_DEV_CTX_PCI_VQ_CFG, \field{type} is set to 0x103.
+The \field{value} is in format of \field{struct virtio_dev_ctx_pci_vq_cfg}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_pci_vq_cfg}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_pci_vq_cfg {
+        le16 vq_index;
+        le16 queue_size;
+        le16 queue_msix_vector;
+        le16 reserved;
+        le64 queue_desc;
+        le64 queue_driver;
+        le64 queue_device;
+};
+\end{lstlisting}
+
+One or multiple entries of PCI Virtqueue Configuration Context may exist, each such
+entry corresponds to a unique virtqueue identified by the \field{vq_index}.
+
+\subsubsection{Virtqueue Split Mode Runtime Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Virtqueue Split Mode Runtime Context}
+
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG, \field{type} is set to 0x104.
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
+        u8 enabled;
+        u8 reserved[7];
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
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC, \field{type} is set to 0x105.
+The \field{value} is in format of \field{struct virtio_dev_ctx_vq_split_runtime}.
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

