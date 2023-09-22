Return-Path: <virtio-comment-return-7524-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4D9E6FE33
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9BCA142C4F
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C875998670A
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8DA999866BE; Fri, 22 Sep 2023 13:50:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 94C049866AE
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Sep 2023 13:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMchCSwot0gJn9wCA1TNcgTnRh3OL3/zUBtgrlE89d0uUvtiFBdW+bvxbzsf/G+FzMxjFQ777H2UQD2cIjtoMu0Lb3z74dXN7ySIETZNYOoIXpEMbCgsklCjD4jZ4WS1M3y1FAFoRkoe6WYP01XbT8ZG83VR82snBXI0GaMIoHJuYNnltdQtGElK8BM/RAGYlKiEFKWPrVJRoJt7bmKR8cBc9ikso/D+LNlrUQjq9tR/jwQmp+JrD98ZlnABVXWhK6HEsTtXznU7frGcvlfxI8XsQvEzIqFlRsqZMJii2J9qdJhEOSjUNFpmK8VnDqV4CN2mrYSgzTTcth6LZuyX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bx58XnTvq6CBg8Nkoi768jOtNjdc3N4cdQudIeajbWw=;
 b=hy0IuR7TgIettoK1z95/lsy6tEsBjsPkHg7rGmYyT53o5b9bp3iMFCkMo3ptBigzh/xCRSdqvU+H9gW7dKoQj2jFDvu9DW+wKa59lHkuoIR+X39i1Z5BYVespMU14yJu66XL8zQht5Uoww04DXMzJ6O1Z8i0n4X9Q2gVwu62Fw//nydqI+vWjgkvKkGJt0ZPz5VsT+Y8A2NFcKMC4fFkvGtTdmkh6U9hUu3v9ftuxJVtLUcdhLQKINzToQ0pNcUDPYty9AwnMfcdmO0hVwhYTUxd+ge7vGop8k6io2j/+kZ8cL24UhM1Iu2nP3PI5csj0CD4z6Dhuew1KOf26geSGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Date: Fri, 22 Sep 2023 16:48:36 +0300
Message-ID: <20230922134838.3718-6-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922134838.3718-1-parav@nvidia.com>
References: <20230922134838.3718-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|PH7PR12MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: b179e30a-9443-47f5-2db3-08dbbb72b900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IRdMEjcRhuQQoXKpO7UvG130+5831YfRYwAIBh+5Rn3FihHWiInMmT7XybTJDbMch9kAhCoXGcC6Feg1YXjJ7VK07yXy7itTRUi8pQmlS2jS+uHGAARgHRvynnvUpnLaq9rXvjg4/zjJz9/Zs+0nonJ4nXLq3D3dPByMmZwAc+VOpsU8XmdEP1XWBDcvqtBUroXLRsEGdMgX31lPkarSzUHmE4lPvTGinNqNj+o5fywwtUYUKYKr3VpbAoxiZAcG027Qn01RLG02+tHJ8k8qtXTyhyCxCvwSVLryLMlWNkOQf5S/f/GMJEDDR6EJ5LwbwaYzGTQOZh5BpKiZEZZa7N7prOuIVtE7J+442CNlHJqtJuqUHkCDZRFEK2fJhi/DYc3vcq5m+aPfVe0zMaIBSRYRmocXbQTidBpbR8pH86eLb5EUj4JVkzjMhYqqpDu7VxslKLN5hfHAeZjEeJkN1I4ytmCgt/r/tD0izIeDxRGvb1YOsVbk85flOt5reL2CoWIcWHayM579Hj5g/MhWEmkzTogqHhQ70GYdCbj3vQsCGc0js+VYCS684P762eIV8AiR9AxkTkZtF14kG8oDFSZjCtZDjs9FBzgV5v69FnSueLWy3pmnrPWP4t2Vf5oxhefBUlM7NOAJg7J1sjdeL6cG2G36CvZgpzR9mY9LyzR8TrXvQU41oMQFocQlE/a/zSTMs2++DsdK4OplRqbAim+GVPBWHtTa/zv0nn9qCvuTSmkaqed9Hv9oEveHbQG3pFmSigOE5yiWC3qDiUMW4YDldbsfv2Dm4loqRItvnvaNodXAZ4z6j9ajt31zQEtC
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199024)(1800799009)(230921699003)(186009)(82310400011)(46966006)(36840700001)(40470700004)(2906002)(4326008)(70586007)(70206006)(110136005)(36860700001)(5660300002)(36756003)(41300700001)(316002)(86362001)(8936002)(54906003)(47076005)(8676002)(40480700001)(26005)(2616005)(16526019)(478600001)(426003)(336012)(1076003)(966005)(40460700003)(356005)(82740400003)(6666004)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:49:20.5957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b179e30a-9443-47f5-2db3-08dbbb72b900
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5951
Subject: [virtio-comment] [PATCH 5/7] virtio-net: Add flow filter match values

Define flow filter match values for the defined types.

Currently it covers the most common filter types and value
of Ethernet header, IP addresses, TCP and UDP ports.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 79 ++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 3fd22b3..a3cbb29 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1271,6 +1271,10 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
         le32 reserved;
         le64 fields_bmap;
 };
+
+struct virtio_net_ff_match_value {
+        u8 value[];
+};
 \end{lstlisting}
 
 The \field{type} corresponds to following table:
@@ -1293,6 +1297,10 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For each of the \field{type}, a corresponding bitmap for the
+\field{fields_bmap} and the \field{struct virtio_net_ff_match_value}
+is defined as following:
+
 For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} are following:
 
@@ -1308,6 +1316,21 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_ETH_HDR, the match
+entry \field{struct virtio_net_ff_match_value} is in following format:
+
+\begin{lstlisting}
+struct virtio_net_ff_match_eth_hdr {
+        u8 dmac[6];
+        u8 smac[6];
+        le16 ether_type;
+};
+\end{lstlisting}
+
+The \field{dmac} is valid when VIRTIO_NET_FF_DST_MAC is set.
+The \field{smac} is valid when VIRTIO_NET_FF_SRC_MAC is set.
+The \field{ether_type} is valid when VIRTIO_NET_FF_ETHER_TYPE is set.
+
 For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} are following:
 
@@ -1323,6 +1346,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, match entry
+\field{struct virtio_net_ff_match_value} is in following format:
+
+\begin{lstlisting}
+struct virtio_net_ff_match_ipv4_hdr {
+        le32 reserved[3];
+        le32 sip;
+        le32 dip;
+};
+\end{lstlisting}
+
+The \field{sip} is valid when VIRTIO_NET_FF_SRC_IPV4 is set.
+The \field{dip} is valid when VIRTIO_NET_FF_DST_IPV4 is set.
+
 For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} are following:
 
@@ -1338,6 +1375,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, match entry
+\field{struct virtio_net_ff_match_value} is in following format:
+
+\begin{lstlisting}
+struct virtio_net_ff_match_ipv6_hdr {
+        le32 reserved[2];
+        u8 sip[16];
+        u8 dip[16];
+};
+\end{lstlisting}
+
+The \field{sip} is valid when VIRTIO_NET_FF_SRC_IPV6 is set.
+The \field{dip} is valid when VIRTIO_NET_FF_DST_IPV6 is set.
+
 For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} are following:
 
@@ -1353,6 +1404,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_TCP_HDR, match entry
+\field{struct virtio_net_ff_match_value} is in following format:
+
+\begin{lstlisting}
+struct virtio_ndr_ff_match_tcp_hdr {
+        le16 sport;
+        le16 dport;
+        le32 reserved[4];
+};
+\end{lstlisting}
+
+The \field{sport} is valid when VIRTIO_NET_FF_SRC_TCP_PORT is set.
+This \field{dport} is valid when VIRTIO_NET_FF_DST_TCP_PORT is set.
+
 For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} are following:
 
@@ -1368,6 +1433,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_UDP_HDR, match entry
+\field{struct virtio_net_ff_match_value} is in following format:
+
+\begin{lstlisting}
+struct virtio_ndr_ff_match_udp_hdr {
+        le16 sport;
+        le16 dport;
+        le32 reserved;
+};
+\end{lstlisting}
+
+The \field{sport} is valid when VIRTIO_NET_FF_SRC_UDP_PORT is set.
+This \field{dport} is valid when VIRTIO_NET_FF_DST_UDP_PORT is set.
+
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
 
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
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

