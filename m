Return-Path: <virtio-comment-return-8116-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CA5C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:20:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5C0682AD4C
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:20:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 41CF5986C03
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:20:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2CC41986BFE; Thu,  2 Nov 2023 13:20:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5AF95986BFF
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 13:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yk/9QGxEhyWzhLayqwOAW0T4pHNz9Amcz3GJ1WcaEax92FM9z+59AxUetgooEd6vnf6yuL0rxKudKwHt1LpxWdOeBXUvn0u+kJVoKO0DDEUN0zBFsYvSDGmqtAYISboo1Y4HBnkRqk2ehuXmnnSG056qZ1RRFDZLrVPH6329FYRCs1UCjWoya5LMKWlPl+nuGNHdTbOJ6NJ2s3AwtUurNJbTc0K1u9zLDEnXP1SRZFYhXtiztPmIowWipM+dsQq23/+l3xMEe9m/6A+kN1qaBkdpShYEDVfR4OAFt3nKyc5LPmH22xfjEl9XE2ucDarsbxM8giY6eG+P7vNpXFkXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFlxOOjXIcqX5qogWpFZmbJwMWQfUGrJTXnU6pu6F1E=;
 b=KVOO0D9jHcdFv4abd/08pul0GtzO7sl9k5NK/qVWADjci7aHzzEjznpRTU6H2hKpjnDrKHGYzVEqfjm0d/ncsgNsKwx6twmIjf9XX7x7M2KKaRwD9CTxVpkgSaMiFdN6LwMem9ZTFT8cNk/PuyDPJ0D5/q5kEIJ0TnAhSL3Deyfka9QuqQi63BvbCci2IEWEcD+gfiigHzJAZsQcOly6zPYLNi405I5HB2Sc0NExNg+FvuQ5/yGP6c/CMBzNwXdtOzojGKFFSPK7JMAXnRT7bCsAR6OOfL1Oj0KqNLwPW/A+MoFqK8jihY80zyVTF8SSwAmZlVH0gNgHajkozuU8XQ==
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
Date: Thu, 2 Nov 2023 15:19:46 +0200
Message-ID: <20231102131946.1864886-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|BY5PR12MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f3b2ac-dace-4c80-cb50-08dbdba67314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wr/eLA7md0E5eF3rAq/KrPu7i7Q07JxurdxfDVc7AQBNU+HTutR5vgjH4fXIAkV4Vglv4dvk+Lhp+T9f574LDBck/+WyoAVLEDMKgHhBAMeo1iS/MPo4Nmy/MpIhVKfFrkd9vmq2FHCgh3OjJvwIAmE+y+MUf7MS7dul/05/HCdN3m1c4TFQhHD6ZmmgupDavR16aFgKqp+swtY+OFkljPhaWnYtsppB8GWbrbIwRVwE5Kk6Tcz0O8wzmSs2nqLJNrPeMx+c7Qqsb4+vuZeoJh0ok7hvVhUKuLUSoBlfHaU/uZH2q95M8SrE1ZUk71BNXt7Bcw50MRUX2y4LVM6QPJVh8FaouTLjpciRhEutLuuUVz0XCis7+imXBJ4b5v6h5p08R4c2EU8b8Zu8rxQpmeIYVRmecUQVaMmUVKxWmel3SSHb0ntpNoOEjR4Hwqzbr7xVRSh/wApeoIa486/kRWYzg8rJOtFfaa3Ew4/DmVVBwOm/T0Ch/24w6lP7JY8XgTTFk24vEdQQNrwNb3T7ZbBLofMrvKLdpcy36rUbgmNpYSxnfMUDV2kY78oRvQ9H5Du0YPyjDE3jYjTpJ4j8wHp4nlk4raTx92om0bPBVnM6At1z8DPb7IsV8JrY4yOE9ZyDh7vp6U3b+5Cm/khaXLliinGdQDIwZkryIheUpS8+esdzI68SRlmY8pvCoiENA/uI21l7rYgFg7PFiok1TIYExepeBz8/lNhThMaQ5LHj4y7mLyfl5m9vLlIlN7SPPSw2PLGOvEDHebmHE3VBsg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(316002)(26005)(40460700003)(1076003)(16526019)(6666004)(36860700001)(8676002)(478600001)(47076005)(107886003)(2906002)(8936002)(5660300002)(70206006)(70586007)(110136005)(966005)(54906003)(83380400001)(4326008)(336012)(426003)(41300700001)(40480700001)(356005)(7636003)(82740400003)(36756003)(86362001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:20:14.3447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f3b2ac-dace-4c80-cb50-08dbdba67314
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258
Subject: [virtio-comment] [PATCH] virtio-net: Add device migration context fields

Expand device migration context for fields such as
mac table, vlan table, mq config, rss config.

All of them utilizes already defined infrastructure.

This patch is on top of [1].

[1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00469.html

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-context.tex                  |  2 +-
 device-types/net/description.tex    |  2 +
 device-types/net/device-context.tex | 58 +++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 device-types/net/device-context.tex

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
index 76585b0..13490ec 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1805,6 +1805,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 
 Upon reset, a device MUST initialize all coalescing parameters to 0.
 
+\input{device-types/net/device-context.tex}
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
diff --git a/device-types/net/device-context.tex b/device-types/net/device-context.tex
new file mode 100644
index 0000000..b78cf37
--- /dev/null
+++ b/device-types/net/device-context.tex
@@ -0,0 +1,58 @@
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
+0x1005 - 0x1FFF & - & reserved for future \\
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
+\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting MAC Address Filtering}.
+The \field{length} is the length of \field{struct virtio_net_ctrl_mac}.
+
+\subsubsection{VLAN Filter Table Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / VLAN Filter Table Context}
+
+For the field VIRTIO_DEV_CTX_NET_VLAN_FILTER_TABLE, \field{type} is set to 0x1002.
+The \field{value} is in format of \field{struct virtio_dev_ctx_net_vlan_table}.
+The \field{length} is the length of \field{struct virtio_dev_ctx_net_vlan_table}.
+
+\begin{lstlisting}
+struct virtio_dev_ctx_net_vlan_table {
+        le16 vlan[];
+};
+\end{lstlisting}
+
+\subsubsection{Multiqueue Pairs Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / Multiqueue Pairs Context}
+
+For the field VIRTIO_DEV_CTX_NET_MQ_PAIRS, \field{type} is set to 0x1003.
+The \field{value} is in format of \field{struct virtio_net_ctrl_mq_pairs_set} as listed
+in section
+\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Automatic receive steering in multiqueue mode}.
+The \field{length} is the length of \field{struct virtio_net_ctrl_mq_pairs_set}.
+
+\subsubsection{Receive Side Scaling Context}\label{sec:Device Types / Network Device / Device Operation / Device Context / Receive Side Scaling Context}
+
+For the field VIRTIO_DEV_CTX_NET_RSS_CONFIG, \field{type} is set to 0x1004.
+The \field{value} is in format of \field{struct virtio_net_rss_config} as listed
+in section
+\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}.
+The \field{length} is the length of \field{struct virtio_net_rss_config}.
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

