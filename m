Return-Path: <virtio-comment-return-7292-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DB0EEB572
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CD289159D2A
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BB6C4986634
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B0C5B98660D; Sat,  9 Sep 2023 14:29:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 91A1298668F
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJReawM0uhDg6g/Of7lfEUeRj0b72KXVBnBF6QNQVe/F4RR+4Y3Acqphhx+GRWkBUdH6LBKwjqzmS2F9FIUzLaO5GSSDtpcwzTruIc2s8pKx13nsocOHkY+Z9FauMnzSRAJ77FQ8hpa5cnLp1UumWVJ9Tsvr0uXJSBMAiZyd7StmhAMHOjK9Vo/NwxrJpPhXkb4b1fR67nnHph5OHZ0Oa50dzhjQam9dQXatDVWoUnKZQODxjJJgu8ZdVWDpKJUbu2YtWYPyIovRqWVDj6nso6Dtlx/8749QAIXPy7YoYAkOX7MHu0QZ2FeIpbUeGcUBZSH3ftttsFiWtekUXd7b4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+LEdC/XBUMKqjYz2pwEfpgpTZTPUZFdMfOHUAdfCbU=;
 b=nEk0OwyY1P5+v7ICvvKM5pAEKNTok5AAZYEEuVob8q29y51suqEn00ux2ZG5zWMMgwqJ8sk4IB36dN1G+eki17shkSr7MMFBnRgPkhUdB01GosLTwvhrh4gxncqeZ04KU2xVsA4IwCoQrf8TpcfgbaGE7C9Im8M8yQbQkuhy+e3uNtQBbyQwXGDj0M3Is2YWnIs7ixAPvp2ZeZVAO2x8yPsOu/g60g6JANSWxsWzZtyPfc/mSQUUsIfqDM0kWafj5xrg9V9pcVYXYitmmsxBGqEftTVrqnT8gQtGAE7Ppv3bWxifL/5JOEDrZQc4q4PnyRS5ZC+IJ2BePUpt9e7uZQ==
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
Date: Sat, 9 Sep 2023 17:29:06 +0300
Message-ID: <20230909142911.524407-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909142911.524407-1-parav@nvidia.com>
References: <20230909142911.524407-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|SN7PR12MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: 8698150c-adb5-41f8-ea1e-08dbb14135cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4IzJ920kU7v5S6ADZ6Gr3FMtr/QXsucFjOmw613dRKrDY8uIkDKNSy0vmk/SeXbmnUSA6C+vU6rnrGxo1kC9QZJkrLDNgba9xtlHOKKfeWq1qzcBusaK8pGPU9yAfd1oPZC/nFxEaQbfvavtqKIw2l3WbrPLtstpZPD1vXE8Ygq/qwv/chJKW+TYT7bJ6UteXwMpOBAhS6mIaiqFI+GdPkTG3BNHrVYuNlly+IRpdHmbAZVdIl24grGDG+rQYsBeaPcbVhGkAJxltH/Y/dFRM6KUTOPr47Q2rQ9fGDOsFVaXzjjW98bF9T5nDJUaAWPxAPonKPwKFflUxIIotu9raG1KCnQ5Nfxw7OFA8fWsrZ/jSun+NBLhaKdH3tmLf6GbbOusChEUY8rjpvRVx1GTKrJUhuTnqZFPh5siiklW0A7AtklbMzxuWnh4b3Ee9a+Lfzm3RkJ+xR7SUDSafwtLSLGIcRItD4WECmE2JpyXjzCHD2WRuc2PkNOQt8lJeIsEUScD0gjvrQ0jlExxjDbrGRx2S+NXteyMvyyrIw6u3FEuDpQIC60Q6tgKwZ94uTzZx/G/3YwRsSNIU1SMParhS8L8+06e5a3JTnfJccHe3sZW+1xE9IP4MxJfq6PxbBK9nPQKMVSuh/FjGUzqZQ7AgO+kBa6TKiYvhG6NBL9Od91Adowh/2I0XwpUcjyoU1V994Xj7a29jkjKCbeki6KZnfy05aweN/+e0of83RP8KxjYX/rF+s1uDj/aF8aZ5Y3R
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(82310400011)(186009)(451199024)(1800799009)(40470700004)(36840700001)(46966006)(6666004)(478600001)(83380400001)(1076003)(107886003)(26005)(2616005)(16526019)(426003)(336012)(2906002)(54906003)(316002)(70206006)(110136005)(41300700001)(5660300002)(4326008)(8676002)(8936002)(70586007)(40460700003)(40480700001)(47076005)(36860700001)(36756003)(86362001)(82740400003)(356005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:29:43.5263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8698150c-adb5-41f8-ea1e-08dbb14135cc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7979
Subject: [virtio-comment] [PATCH 3/8] device-context: Define the device context fields for device migration

Define the device context and its fields for purpose of device
migration. The device context is read and written by the owner driver
on source and destination hypervisor respectively.

Device context fields will experience a rapid growth post this initial
version to cover many details of the device.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 content.tex        |   1 +
 device-context.tex | 107 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)
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
index 0000000..656eea4
--- /dev/null
+++ b/device-context.tex
@@ -0,0 +1,107 @@
+\section{Device Context}\label{sec:Basic Facilities of a Virtio Device / Device Context}
+
+The device context holds the information that a owner driver can use
+to setup a member device and resume its operation. The device context
+of a member device is read or written by the owner driver using
+administration commands.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_field_tlv {
+	le32 type;
+	le32 reserved;
+        le64 length;
+	u8 value[];
+};
+
+struct virtio_dev_ctx {
+        le32 field_count;
+	struct virtio_dev_ctx_field_tlv fields[];
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
+0x0 & VIRTIO_DEV_CTX_PCI_COMMON_CFG & Provides common configuration space of device for PCI transport \\
+\hline
+0x1 & VIRTIO_DEV_CTX_PCI_VQ_CFG & Provides Virtqueue configuration for PCI transport \\
+\hline
+0x2 & VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG & Provides Queue run time state \\
+\hline
+0x3 & VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC & Provides list of virtqueue descriptors owned by device  \\
+\hline
+0x4 - 0xFFFFFFFF & - & Reserved for future types \\
+\hline
+\end{tabularx}
+
+\subsubsection{Device Context Fields}\label{sec:Basic Facilities of a Virtio Device / Device Context / Device Context Fields}
+
+\paragraph{PCI Common Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Common Configuration Context}
+
+For the field VIRTIO_DEV_CTX_PCI_COMMON_CFG, \field{type} is set to 0x0.
+The \field{value} is in format of \field{struct virtio_pci_common_cfg}.
+The \field{length} is the length of \field{struct virtio_pci_common_cfg}.
+
+\paragraph{PCI Virtqueue Configuration Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ PCI Virtqueue Configuration Context}
+
+For the field VIRTIO_DEV_CTX_PCI_VQ_CFG, \field{type} is set to 0x1.
+The \field{value} is in format of \field{struct virtio_dev_ctx_pci_vq_cfg}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_pci_vq_cfg}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_pci_vq_cfg {
+	le16 vq_index;
+        le16 queue_size;
+        le16 queue_msix_vector;
+	le64 queue_desc;
+        le64 queue_driver;
+        le64 queue_device;
+};
+\end{lstlisting}
+
+\paragraph{Virtqueue Split Mode Runtime Context}
+\label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Virtqueue Split Mode Runtime Context}
+
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_RUNTIME_CFG, \field{type} is set to 0x2.
+The \field{value} is in format of \field{struct virtio_dev_ctx_vq_split_runtime}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_vq_split_runtime}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_vq_split_runtime {
+	le16 vq_index;
+        le16 dev_avail_idx;
+        u8 enabled;
+};
+\end{lstlisting}
+
+The \field{dev_avail_idx} indicates the next available index of the virtqueue from which
+the device must start processing the available ring.
+
+\paragraph{Virtqueue Split Mode Device owned Descriptors}
+
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC, \field{type} is set to 0x3.
+The \field{value} is in format of \field{struct virtio_dev_ctx_vq_split_runtime}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_vq_split_dev_descs}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_vq_split_dev_descs {
+	le16 vq_index;
+	le16 desc_count;
+	le16 desc_idx[];
+};
+\end{lstlisting}
+
+The \field{desc_idx} contains indices of the descriptors in \field{desc_count} of a
+virtqueue identified by \field{vq_index} which is owned by the device.
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

