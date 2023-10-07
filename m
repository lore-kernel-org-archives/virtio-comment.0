Return-Path: <virtio-comment-return-7606-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B0EE81E1E
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 14B5945B27
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F885986872
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0602B98682B; Sat,  7 Oct 2023 05:15:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D4F6F9868AC
	for <virtio-comment@lists.oasis-open.org>; Sat,  7 Oct 2023 05:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8byZjIuDLjc5eTJTYJcgT2zVtnG9VoYCi26WzHNgoXYUiZhLOad9B+acpKN7VIU+7wY+QotelK+YyUI0B8Kr+86lpC8Aj+h5Qn/9RG1jBh4opkIpQqRODiKx4TBSAc+lOME43DzlxsMZFuXfHVpH3OI4NLjTDZ712YKbqytzcqvYI/syCwzgEegqkdEak14IjkOv0C6lA3Oq/EcJe6epkuj10cTvt9nqh72WSO6dI2F7WlHKA8XzG+u2cEuZibSb/k62PyeK/Y7XlrBcLrCHpgl29AEroFsv5eOrrZbkGTZ6jPKBjfqkdSyR1Uek23NbsMQRDD3iMYChfaQdJR4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dc8Tuk8s+2hC0KOykmda0Uu/e8MkMspmBlmRc09sMGI=;
 b=XvNzeP/bOupTkGhh8CsGSWwx+AaIgbTD3j76qJrgZu0Din3IIYoz0hBTjkgxy0TMR6/OEnx+32Ekxe1vWSPPOosk0mklquEbBbuwb4BokTB6p0TVkn8b8Dm+yd8mF00VJZxpd41FptLFLviX25pxSMWnUREG2KaV7MgbLOAsqgrR8lia+TJ5xP1FpUiiz4rqTaBiGdvNBz438llHYgG1oIjvWk7GjigwMXmlKW0c2udv4XcoPHDYTxBAvpZefjv1/Km+FdeTjMV3Lk2nngeCOS6DdFEDLzbsNXvom5bZ+N+Pk8oSDWCdbqgd96Jklhdh0LwZyw1kutXrAPIbZfhqlg==
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
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Date: Sat, 7 Oct 2023 08:14:41 +0300
Message-ID: <20231007051443.460148-6-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231007051443.460148-1-parav@nvidia.com>
References: <20231007051443.460148-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|PH7PR12MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fcad28-f9dc-4e94-8e97-08dbc6f46bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jrZvT7cGCyiAOe5EszFI9C1rNtZbdkd5UXuV2SYZuZ8EzSBJL0iCFqbVcH5+wMHTeyLBFeVwiZbaoq81rTqIN0Tu12foo6pJLkpYAD5IwOqYgRnRuGqKAoQYBBN2siWys0Iu4ECDFB3iX0iXasKiFySheYQ136zt44F3NIgAddISOjITwyS7i63T36lnnPefNZYpv4qAwYun9QQ1KzdOvtuh5kY29Z72iApKwPbftl57RF//RvBSGb0MiBmuMzDf+Ria0oDgw1X2rEYBxvNoCQi6Lk/8JioiJ/DP30mOHfCEm0D/9OWgcuLNzkTSjNdLrxutwJqJ2MK+HRWSJkvUPPejktKoFZ73/J2ZzS4xVUBIIGD4j57m1op3yhpOsEMZEQ5Na6Kz0u0YlP8RNcicxdqv9JgILIlBZ8/7+lo1YB2lBDw1lFO9J2nMIjVLtYBD/2ntRahSckqnF5wkEMpj6Xr+njrciNL2et+cODxYBsG0PJgM0CCbVUGYvNWHSaFG5AaP+YZnUJWgYto4ybRsDe4lozQAy/KUUACZiACRHUXwlTLwWnkwTdMpujLTvI20IkC3GPlkKP4DreDRwlwItaxrwbXzBr2mp5QEZY9mhM2E9S8g46gzu+2CqSXnwjQbil9fSDcMLVNdABSksrg3jVckZOwe16bRNi0Y5mLtF2ZduBMP4ZP2cBSKE+nKtkziqlXXmVKRvUF5A05GHG/O/L6r18uE/7ODIU4bX3vEH3HX14gg1jbYoe8PKtwY9Y0LYYswbKKsolk+nBvOPhYUGnxRZ33NYPJ75i5MCgn5n4Y=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(82310400011)(186009)(40470700004)(46966006)(36840700001)(8936002)(54906003)(41300700001)(70206006)(8676002)(2906002)(336012)(110136005)(40480700001)(5660300002)(426003)(4326008)(966005)(70586007)(316002)(478600001)(6666004)(40460700003)(16526019)(36756003)(36860700001)(47076005)(1076003)(26005)(2616005)(7636003)(86362001)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 05:15:28.3727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fcad28-f9dc-4e94-8e97-08dbc6f46bc2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6538
Subject: [virtio-comment] [PATCH v1 5/7] virtio-net: Add flow filter match values

Define flow filter match values for the defined types.

Currently it covers the most common filter types and value
of Ethernet header, IP addresses, TCP and UDP ports.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- added mask flag to the type
---
 device-types/net/description.tex | 79 ++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 17d4f15..19d1655 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1272,6 +1272,10 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
         le32 reserved;
         le64 fields_bmap;
 };
+
+struct virtio_net_ff_match_value {
+        u8 value[];
+};
 \end{lstlisting}
 
 The \field{type} corresponds to following table:
@@ -1298,6 +1302,10 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 supports masking packet content with the supplied mask of the flow filter
 before comparing the resulting value with the flow filter match fields.
 
+For each of the \field{type}, a corresponding bitmap for the
+\field{fields_bmap} and the \field{struct virtio_net_ff_match_value}
+is defined as following:
+
 For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} are following:
 
@@ -1313,6 +1321,21 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
 
@@ -1328,6 +1351,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
 
@@ -1343,6 +1380,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
 
@@ -1358,6 +1409,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
 
@@ -1373,6 +1438,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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

