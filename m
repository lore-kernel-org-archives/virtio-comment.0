Return-Path: <virtio-comment-return-8150-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98006C4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 12:17:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C7BA62A89B
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 12:17:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9F401986C39
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 12:17:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 80E42986C35; Fri,  3 Nov 2023 12:17:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 709DB986C36
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 12:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6FZj3Q1GeG7qATKmfBZh1FkfXyjR6NO/fxz2aSkHw+NJwBrcZMc9S7pWjB6eC9/nzTSRcmiwmulgscA2CkHvbBRFmDi4jgqrjgIzKhZ58cdjmORdVlWPGrglwmuGDOkF0+pcLezxfU8AHA2/WS9pMTTqnKlZgTzwKYoqELRtPfBirp6PZUKVbcbwLKCUOJeSvuITf2phY+SLbtOB7qMtEMOX6WxcZ3x6ssEh4zGTMsNimr6t+PB0tMyzzQwrHxACymgpGF+xOvdNH8GwN0OeuRnYg7KYGN6OpTeegn2hGn1f+QZ3o10BBbuN5FID/BYpwiwgPTfw5AbPIZusaK90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXtOV3rvOzacWDQmDT4gQ/ezmKk+wKg46IKVt7b3Rnc=;
 b=Y86zW2WwHdgRIKvvB8X2nO6zTX3jgX9QZbw34cewpf9V3cn7wy+2EUeeYr0rHjw+PQwDuj91VIbFBFAaE5sWBFvHzgkQtcj/+ZpsjcVoyTe0pVgAi0ZcF3GA8pP46R4ELUdBUmaXSI08C+u/8pQ0CUeBuQDplL7v1aLtUlcxQUPHtu6C+X9hUOT3CRESSxa0ito6FgYraqh6+yg2fKCxuGNB0gIBufGTzltR54n/+WLd9XI+wxW/Q6VOXL4t34BYx9GIGpNCnl+F4MAkrT713uqoXNGSgF5zyPImsBnYK78S1NZ2mgya3URXUysuoRA3a+HQTaDuj6wTdwcUiMxH1g==
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
Date: Fri, 3 Nov 2023 14:16:24 +0200
Message-ID: <20231103121624.1901509-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: b00b3e3d-203c-4ee8-0a30-08dbdc66c74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GOgVuk+dut/ImKaqmA1I7RGDiYkhBn5Zr0hrptt6br4JwPWAa1kLz1MTXE0yhqX4OHRxGf6OQVIFThPnx9wRSoQkve9QXu3pa99fk97OcNZy0UEDWDRsbUVM+TrolS5hnvJUVP1HRYCpDzhD1J+LIbgejfIoHXYJgn6uhwYMiTOOwDbX17X2Ti15sfy3Jhmt1CgvBsfZs2Rqpu5fLaHv/DolKBmOsBeBQs0lSimGS0qs3Hp054D+8IkAOYv3L5otZWEvFM6D+wudtREs//IcHdxd44IwNR8NGpBoDopqbHnxhzZzhJvR57duQhemAsrV/uS31VyKdtN0aBOMTHCd2u3dPWF47m/fEv96Y9Vs78vXxcbooTxWvWIDXrUmsE7bMKqJ8jZjPYqcQGgSkHlEEcmO3/3YM3iHs50E1f8aGQ7QSZP98kFnNgILFpFG6owEc47c8xLMF969Az4yK9ovBrCbtdkioRmjMI/m3MP2smiDBblUhcGh1hbIBzsp/vam9MzFwxVXYnHOuXlqX7ZyaRxzPpJU+bOfEuV1qQf85teqA9EBzdeFTjxkENAKLj2Dw4gywwwxmsIeNIdYLAQB3vVcV38NoDPz+WZgDHUA/IUsf6R4stCi+VZC9Y64VXDbKtEmEX3w0z9/mgw3WCn+o74cXLct/K4cNzVBav+9snxX+Rcqt7xZruQ0cEJr2r2tqb9QkJUZC8bZQKi3Jy2O5JEJ1Evgr9WqQ6Vm0X9KmGEB/VcL5VmV+ypKRz6zgo0/4I4Ra4XuJYkgt1vD8bP/mA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(46966006)(40470700004)(36840700001)(41300700001)(5660300002)(40460700003)(316002)(426003)(336012)(8676002)(8936002)(4326008)(36860700001)(356005)(7636003)(83380400001)(86362001)(2906002)(54906003)(40480700001)(36756003)(966005)(47076005)(26005)(6666004)(16526019)(478600001)(1076003)(110136005)(2616005)(107886003)(82740400003)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 12:16:59.0322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b00b3e3d-203c-4ee8-0a30-08dbdc66c74b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523
Subject: [virtio-comment] [PATCH v1] virtio-net: Add device migration context fields

Expand device migration context for fields such as
mac table, vlan table, mq config, rss config.

All of them utilizes already defined infrastructure.

This patch is on top of [1].

[1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00469.html

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- addressed comments from Michael for vlan to explain
- avoided new file of device-context.tex
- dropped adding the description to vlan section of net specification as
  entries are added one by one in cvq command.
- extend further for vq notifications coalescing context
- fix label with reference
- added num_entries to self describe the structure
---
 device-context.tex               |  2 +-
 device-types/net/description.tex | 82 ++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/device-context.tex b/device-context.tex
index ab19fc9..348bb25 100644
--- a/device-context.tex
+++ b/device-context.tex
@@ -57,7 +57,7 @@ \section{Device Context}\label{sec:Basic Facilities of a Virtio Device / Device
 \hline
 0x1000 & VIRTIO_DEV_CTX_DEV_CFG & Provides device specific configuration \\
 \hline
-0x1001 - 0x1FFF & - & Device type specific range reserved for future \\
+0x1001 - 0x1FFF & - & Device type specific range defined by the specific device type \\
 \hline
 \hline
 0x2000 - 0xFFFF & - & Reserved for future \\
diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..8c7e626 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1805,6 +1805,88 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 
 Upon reset, a device MUST initialize all coalescing parameters to 0.
 
+\subsection{Device Context}\label{sec:Device Types / Network Device / Device Operation / Device Context}
+
+\begin{table}
+\caption{\label{tab:Network Device Context Fields} Network Device Context Fields}
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+Type & Name & Description \\
+\hline \hline
+\hline
+0x1001 & VIRTIO_DEV_CTX_NET_MAC_ADDR_FILTER_TABLE & Provides MAC Address filter table \\
+\hline
+0x1002 & VIRTIO_DEV_CTX_NET_VLAN_FILTER_TABLE & Provides VLAN filter table \\
+\hline
+0x1003 & VIRTIO_DEV_CTX_NET_MQ_PAIRS & Provides multi queue configuration \\
+\hline
+0x1004 & VIRTIO_DEV_CTX_NET_RSS_CONFIG & Provides RSS configuration \\
+\hline
+0x1005 & VIRTIO_DEV_CTX_VQ_NC & Provides virtqueue notifications Coalescing context \\
+\hline
+0x1006 - 0x1FFF & - & reserved for future \\
+\hline
+\hline
+\end{tabularx}
+\end{table}
+
+\subsubsection{MAC Address Filter Table Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / MAC Address Filter Table Context}
+
+For the field VIRTIO_DEV_CTX_NET_MAC_TABLE, \field{type} is set to 0x1001.
+The \field{value} is in format of \field{struct virtio_net_ctrl_mac} as listed
+in section
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting MAC Address Filtering}.
+The \field{length} is the length of \field{struct virtio_net_ctrl_mac} in bytes.
+
+\subsubsection{VLAN Filter Table Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / VLAN Filter Table Context}
+
+For the field VIRTIO_DEV_CTX_NET_VLAN_FILTER_TABLE, \field{type} is set to 0x1002.
+The \field{value} is in format of \field{struct virtio_dev_ctx_net_vlan_table}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_net_vlan_table} in bytes.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_net_vlan_table {
+        le16 num_entries;
+        u8 reserved[6];
+        le16 vlan[];
+};
+\end{lstlisting}
+
+Each \field{vlan} entry corresponds to the VLAN added using the command VIRTIO_NET_CTRL_VLAN_ADD
+described in section \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / VLAN Filtering}.
+
+The \field{num_entries} indicates number of valid \field{vlan} entries.
+
+\subsubsection{Multiqueue Pairs Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / Multiqueue Pairs Context}
+
+For the field VIRTIO_DEV_CTX_NET_MQ_PAIRS, \field{type} is set to 0x1003.
+The \field{value} is in format of \field{struct virtio_net_ctrl_mq_pairs_set} as listed
+in section
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Automatic receive steering in multiqueue mode}.
+The \field{length} is the length of \field{struct virtio_net_ctrl_mq_pairs_set} in bytes.
+
+\subsubsection{Receive Side Scaling Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / Receive Side Scaling Context}
+
+For the field VIRTIO_DEV_CTX_NET_RSS_CONFIG, \field{type} is set to 0x1004.
+The \field{value} is in format of \field{struct virtio_net_rss_config} as listed
+in section
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}.
+The \field{length} is the length of \field{struct virtio_net_rss_config} in bytes.
+
+\subsubsection{Virtqueue Notifications Coalescing Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / Virtqueue Notifications Coalescing Context}
+
+For the field VIRTIO_DEV_CTX_NET_VQ_NC, \field{type} is set to 0x1005.
+The \field{value} is in format of \field{struct struct virtio_net_ctrl_coal_vq} as listed
+in section
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}.
+The \field{length} is the length of \field{struct virtio_net_rss_config} in bytes.
+
+The device context may contain one or multiple entries of \field{VIRTIO_DEV_CTX_NET_VQ_NC}.
+
+For each of the enabled transmit and receive virtqueue the device context contains individual
+entry identified by its unique \field{vq_index} within
+\field{struct virtio_net_ctrl_coal_vq}.
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
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

