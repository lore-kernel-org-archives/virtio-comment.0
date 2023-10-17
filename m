Return-Path: <virtio-comment-return-7763-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC417CDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 441A877868
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39D98986894
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2C1B59861CC; Tue, 17 Oct 2023 20:07:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A01798687E
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 20:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGWJeXB1wQkf8XpNNtG/bGUAawrDPMcIHRkeTZiETo+Y7w4G1xv3rS3Ifv6t6UhExP3UEJMeTNnOaSQtPnnAbr0A0hGtIsDyHgfso2YTjOVxQTzQJWo5pzXr3Z2oC6MnQ7o8E5tjvfnp0Z6WDjJw++/fNEZhOBEtJR/Xnx4X2W8/mhpuzzLKM67FXlTNn8vAJbL5Z5ih4qlTGKoBepyvzZ/+mQ51o5tkbPJUeMNTt+C75SMpfTDzP9sQ7WTH84PCCDY0+RFoa+k+/nfzz0cs8G16j06L+o4aQDgUNyVFQDqidqcxHve5stRk20cZCqf2lk+99tOitxT6OQl5VJp6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNxGO0RBo5K/3niz+IDRtF2yIAJ9tS1rM5+REdoQAqI=;
 b=GTPvCGjMIvned1fsg8014W6DWwA3CEG0N2tJZH4DywoaS7X4e/FcoerwZOmkK9D4JW4D57pZb3R7Q2WC9MMmdMa8UNRfXerL/vNuYYIJBJu8Z0A+SGNq5ipbMdRBy9VoBaxTEuZBsIA3GonC5plTAD/fKySDIrjbAzNIVHC7J5C8+QDfs0MgE6wRDcY3sQddheA5ixJ2+XFyyCPmx/1bDqo7N2idM+mASBZvKfO2lmbZJsOjMmG/Ly3FK8VHEjmcARzE3TOZUxP/z3ERv3VVyL0yKXvGrIDWeSE4JShp2orJWgPaZx1zDfCzppsh43H2EU2I2Q/UHpORY2rfeYXQYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
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
Date: Tue, 17 Oct 2023 23:06:40 +0300
Message-ID: <20231017200645.779222-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017200645.779222-1-parav@nvidia.com>
References: <20231017200645.779222-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|PH7PR12MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ce7ede-d901-4012-dd61-08dbcf4cabec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vOBJqOCh8fyZloLIgLTfpI5Z4+OZYgposV0LRhYNmvLjTYBhoy76Ag/T71ia/BRBkBCA3IOSj3G9Jm/CorxOEPumUa2MKKMeJp72AHiRV4YQ+ffaB1ihwXweEh1JIFKzTPeijVVZTUtPUaxeWd7+DjfvVTPg28xv4YPMkUvA9KD9NLwAgKe1JelbvlIp20J3TH4jX+0gex3T/TvFxvKq4OBMEfwRogTu9wogKOFB+QjYk+Of8iGeEaj0hp3IUL2JXOIJaKAaSgNM/y4xOHdCRS+8QRyocHOqD7ssMza3JG05kZvNHEglGraXwZLIKjtrhr0WZXHqe8VZrEDCzr+qQ9NdIw4n4vG1KxfxFa4QRnF+BhTxtbizXMu9O+utE74vBTXuXHNmHM2G+DUMlKk3FMjyGBwbOdxRJkTAmFPfpNGtNEPIe+xbaQwqCfv1fQ63bz7Cx+adBcZpCV28+i6DmVRUtGjObD9SqC4Bz9MVe1ae3/D6ZVOrqx8mmHGwXrSflV5vZ6PrTV3HLT/rvWl1ygwNvBZZh6aG/lGmFN1kSYgo1aP91mTnlqZQvcFspUL3Q85XfQvzOgZTRZTttsDJpm7ZvL14oXkcSGbokIZUzFcIPfDIMnTaUrWeanWduOg1iLwhVPCSkNPYRfyHsfzrqetsHW3oAg4ZNMkQ2wCy3SkYRECU/Nmp3LyD+QgR6GkrxBqPMWSlMmFr83AKZBYl+m+AP4PDyb/0FoFxcGHJhLTPfBXR+K2mee1bnp9U4H6UbOUuvZpwoT/624Gws+MXQLdLgEVRynKJDG4CJqpcr6k=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(5660300002)(966005)(36860700001)(40460700003)(110136005)(54906003)(41300700001)(70586007)(70206006)(8676002)(8936002)(4326008)(316002)(40480700001)(107886003)(1076003)(7636003)(83380400001)(26005)(2616005)(356005)(82740400003)(16526019)(2906002)(36756003)(426003)(336012)(86362001)(6666004)(47076005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:07:21.0385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ce7ede-d901-4012-dd61-08dbcf4cabec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5653
Subject: [virtio-comment] [PATCH v2 3/8] device-context: Define the device context fields for device migration

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
 device-context.tex | 189 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)
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
index 0000000..0921f1c
--- /dev/null
+++ b/device-context.tex
@@ -0,0 +1,189 @@
+\section{Device Context}\label{sec:Basic Facilities of a Virtio Device / Device Context}
+
+The device context holds the information that a owner driver can use
+to setup a member device and resume its operation. The device context
+of a member device is read or written by the owner driver using
+administration commands.
+
+The device context mainly consists of two types of fields. One type is generic
+device agnostic fields, this is identified by \field{type} range 0 to 0xFFF. The
+second type is a device type specific fields; the device type specific range
+is reserved from 0x1000 to 0x1FFFF.
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
+        le32 field_count;
+        struct virtio_dev_ctx_field_tlv fields[];
+};
+
+\end{lstlisting}
+
+The \field{struct virtio_dev_ctx} is the device context of a member device.
+The \field{field_count} indicates how many instances of
+\field{struct virtio_dev_ctx_field_tlv} are present.
+
+The \field{struct virtio_dev_ctx_field_tlv} consist of \field{type} indicating
+what data is contained in the \field{value} of length \field{length}.
+The valid values for \field{type} can be found in the following table:
+
+\begin{table}
+\caption{\label{tab:Device Context Fields} Device Context Fields}
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+type & Name & Description \\
+\hline \hline
+0x0 & VIRTIO_DEV_CTX_PCI_COMMON_CFG & Provides common configuration space of device for PCI transport \\
+\hline
+0x1 & VIRTIO_DEV_CTX_DEV_FEATURES & Provides device features \\
+\hline
+0x2 & VIRTIO_DEV_CTX_PCI_VQ_CFG & Provides Virtqueue configuration for PCI transport \\
+\hline
+0x3 & VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG & Provides Queue run time state \\
+\hline
+0x4 & VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC & Provides list of virtqueue descriptors owned by device  \\
+\hline
+0x5 - 0xFFF & - & Generic device agnostic range reserved for future \\
+\hline
+0x1000 & VIRTIO_DEV_CTX_DEV_CFG & Provides device specific configuration \\
+\hline
+0x1001 - 0x1FFF & - & Device type specific range reserved for future \\
+\hline
+0x3000 - 0xFFFF & - & Reserved for future \\
+\hline
+\end{tabularx}
+\end{table}
+
+\subsection{Device Context Fields}\label{sec:Basic Facilities of a Virtio Device / Device Context / Device Context Fields}
+
+\subsubsection{PCI Common Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Common Configuration Context}
+
+For the field VIRTIO_DEV_CTX_PCI_COMMON_CFG, \field{type} is set to 0x0.
+The \field{value} is in format of \field{struct virtio_pci_common_cfg}.
+The \field{length} is the length of \field{struct virtio_pci_common_cfg}.
+
+\subsubsection{Device Features Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Device Features Context}
+
+For the field VIRTIO_DEV_CTX_DEV_FEATURES, \field{type} is set to 0x1.
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
+\subsubsection{PCI Virtqueue Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Virtqueue Configuration Context}
+
+For the field VIRTIO_DEV_CTX_PCI_VQ_CFG, \field{type} is set to 0x2.
+The \field{value} is in format of \field{struct virtio_dev_ctx_pci_vq_cfg}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_pci_vq_cfg}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_pci_vq_cfg {
+        le16 vq_index;
+        le16 queue_size;
+        le16 queue_msix_vector;
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
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG, \field{type} is set to 0x3.
+The \field{value} is in format of \field{struct virtio_dev_ctx_vq_split_runtime}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_vq_split_runtime}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_vq_split_runtime {
+        le16 vq_index;
+        le16 dev_avail_idx;
+        u8 enabled;
+};
+\end{lstlisting}
+
+The \field{dev_avail_idx} indicates the next available index of the virtqueue from which
+the device must start processing the available ring.
+
+One or multiple entries of Virtqueue Split Mode Runtime Context may exist, each such
+entry corresponds to a unique virtqueue identified by the \field{vq_index}.
+
+\subsubsection{Virtqueue Split Mode Device owned Descriptors Context}
+
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC, \field{type} is set to 0x4.
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
+One or multiple entries of Virtqueue Split Mode Device owned Descriptors Context may exist, each such
+entry corresponds to a unique virtqueue identified by the \field{vq_index}.
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

