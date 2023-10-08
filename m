Return-Path: <virtio-comment-return-7611-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF20E95A82
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2ADDA70FEA
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1826A986575
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0FDFF986486; Sun,  8 Oct 2023 11:26:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 021AC9864AD
	for <virtio-comment@lists.oasis-open.org>; Sun,  8 Oct 2023 11:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmJHoVYhkDEcwsiCXuHJMO9hFox3ueSoZ+gZIlIxXLVx1BhRdsKjymxypCuVqM11/xtBaXDjhbIF2NHdtEyU5CETTH3SNa1x8TWBmOaFcpFMo8mln1eziHHXO21SxdY71jv6JjCbgXWw7LiFkJ//h8l1PBECX0zms2fYkg7QF8OKfKI9wl0qe9naWbJLizesQT8qPsdUYyRzJ3GskE3qPDMimDAtyeuA9DOQ4V63bJDA76cUrNjNk2zs078ZYuGr2GCA43j3d9f1LqUr7zxYkgQxZI4Kxc4W3pAxd7zC7vtpsIjTD3sPR94fNv8+j4WOe2nEAQd4Y/bEF0xw7jP+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFIL6kRuPkFn+FHASxF7z9OwuFiQmq/l+O1o4nUdZ1g=;
 b=bPWLpoG/37vrxhgylXsgcbxja4HJDLyAc2cKLMOe/yCWk2JWGy4TmAvccgleVkJvKuHSnU8Z6tNvewZO3H6UxkF+WXwCZLr67EIdFH1q5xud3nrH+4PT+DFv1thRqOmhI4irKNXue4HOTh8J7oVS6lQnvjpcUt7Sp2DQfR3zehWwdT5+xNbcr/VSbv1dmv7EeROEoPCaPz2QLsbuomQAwUhtX82uQTsXRMJyGZwotEzw0X12OfZNX6grI6AY9ukK5fOovzyLF6Y462iVgHigs6YuoemSKHIXLB61jBedIAY6wzucSdjwAB1x8n0HHQ8/94neOGK5fnm9TqN+j6I3+A==
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
	<yishaih@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Sun, 8 Oct 2023 14:25:50 +0300
Message-ID: <20231008112555.473895-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008112555.473895-1-parav@nvidia.com>
References: <20231008112555.473895-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|CY5PR12MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 953677fb-84eb-4cdc-73d5-08dbc7f16919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vtJVbmiOuQ2ZkPlSYHEp6CbIsdD3ALRQJZ1z6QIgaN8vyFImR+3qcyQDHHfp08Ys6UfdZ8TNRLd+ylw5ukXa2VyAQcj702VVIEsSZppVg6ycuedUicMp4y8hy91aBZVCOIZyOnboEU1/kUzPsUxr+NOqgq8J95kE2NbjRauhmbCK8ravXoBGy5heqkBpfhjv0Wt4l+Z2rVoC68BSjZZ7RQ2LVpZSB7r7qAyaAKdy72BusER4QZfwQnV+kJf1tgNVWT4WLwFN5iVg+K/ZFQvKrLIBD+anxaHkPxdBvBTAxjfe/WgL03a6QlkblwC+bS36QpGr3Mzts8+0VmGL+CImurgX5maJcXTRfd3hQ7s5Wj7PAZlLY4B46B4yHlrKhxvl/uPk6v2gDXhrTbUYpcatmwW/rW0ntpt/tUHOm/pMSpmQx+q5VsySFoF6TEpT82rLdmmnUzyjj5/f3nLNBYWutxbnOW7198BdXlPIvkBnwvSdDed8u5ymSzX9nce+rgNlSBYRz2cRyy8yqY5dHZqVALM6Ln48GsWXHrlKSXvHtfYBYYffkG8LmDucUq+hJQzbcwCYJxVRQ/H39KqXrfcBJZ5rONEDMQxK0U1l2WR/bLRyXgASrNdNx4AJuBpYK5tTT8CQgc2/BtNdGKwJSgxUzEhtXTqGMpMesVdkVKhG/NdqvJKgbJvu+jzgA42SvvNF76TMtROP1v6sSU+D6LUDpKEjC4eNdzvUBgRYM4/WjCRiXzaQe41Nmb2iJVc6s1/sHDE2KXGYPgb7t9RJ9qD/riU4lsZye8HgDHnF0CQrx7o=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(1076003)(107886003)(40460700003)(36756003)(86362001)(40480700001)(7636003)(356005)(82740400003)(36860700001)(26005)(16526019)(2906002)(47076005)(426003)(336012)(83380400001)(966005)(6666004)(2616005)(478600001)(8676002)(4326008)(41300700001)(70586007)(8936002)(316002)(70206006)(5660300002)(54906003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:26:26.5972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953677fb-84eb-4cdc-73d5-08dbc7f16919
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6153
Subject: [virtio-comment] [PATCH v1 3/8] device-context: Define the device context fields for device migration

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
v0->v1:
- enrich device context to cover feature bits, device configuration
  fields
- corrected alignment of device context fields
---
 content.tex        |   1 +
 device-context.tex | 142 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)
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
index 0000000..5611382
--- /dev/null
+++ b/device-context.tex
@@ -0,0 +1,142 @@
+\section{Device Context}\label{sec:Basic Facilities of a Virtio Device / Device Context}
+
+The device context holds the information that a owner driver can use
+to setup a member device and resume its operation. The device context
+of a member device is read or written by the owner driver using
+administration commands.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_field_tlv {
+        le32 type;
+        le32 reserved;
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
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+type & Name & Description \\
+\hline \hline
+0x0 & VIRTIO_DEV_CTX_PCI_COMMON_RUNTIME_CFG & Provides common configuration space of device for PCI transport \\
+\hline
+0x1 & VIRTIO_DEV_CTX_DEV_CFG_LAYOUT & Provides device specific configuration layout \\
+\hline
+0x2 & VIRTIO_DEV_CTX_DEV_FEATURES & Provides device features \\
+\hline
+0x3 & VIRTIO_DEV_CTX_PCI_VQ_CFG & Provides Virtqueue configuration for PCI transport \\
+\hline
+0x4 & VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG & Provides Queue run time state \\
+\hline
+0x5 & VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC & Provides list of virtqueue descriptors owned by device  \\
+\hline
+0x6 - 0xFFFFFFFF & - & Reserved for future types \\
+\hline
+\end{tabularx}
+
+\subsubsection{Device Context Fields}\label{sec:Basic Facilities of a Virtio Device / Device Context / Device Context Fields}
+
+\paragraph{PCI Common Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Common Configuration Context}
+
+For the field VIRTIO_DEV_CTX_PCI_COMMON_RUNTIME_CFG, \field{type} is set to 0x0.
+The \field{value} is in format of \field{struct virtio_pci_common_cfg}.
+The \field{length} is the length of \field{struct virtio_pci_common_cfg}.
+
+\paragraph{Device Configuration Layout Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Device Configuration Layout Context}
+
+For the field VIRTIO_DEV_CTX_DEV_CFG_LAYOUT, \field{type} is set to 0x1.
+The \field{value} is in format of device specific configuration layout listed
+in each of the device's device configuration layout section.
+The \field{length} is the length of the device configuration layout data.
+
+\paragraph{Device Features Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Device Features Context}
+
+For the field VIRTIO_DEV_CTX_DEV_FEATURES, \field{type} is set to 0x2.
+The \field{value} is in format of device feature bits listed in
+\ref{sec:Basic Facilities of a Virtio Device / Feature Bits} in the format of \field{struct virtio_dev_ctx_features}.
+The \field{length} is the length of the device features.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_pci_vq_cfg {
+        le64 feature_bits[];
+};
+\end{lstlisting}
+
+\paragraph{PCI Virtqueue Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Virtqueue Configuration Context}
+
+For the field VIRTIO_DEV_CTX_PCI_VQ_CFG, \field{type} is set to 0x3.
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
+\paragraph{Virtqueue Split Mode Runtime Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Virtqueue Split Mode Runtime Context}
+
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG, \field{type} is set to 0x4.
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
+\paragraph{Virtqueue Split Mode Device owned Descriptors Context}
+
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC, \field{type} is set to 0x5.
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

