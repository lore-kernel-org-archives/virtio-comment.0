Return-Path: <virtio-comment-return-7523-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7A8E6FE32
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 49432217B7
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A7009867D5
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 32FF4986869; Fri, 22 Sep 2023 13:50:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E44B39866AC
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Sep 2023 13:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIfrrvdY+BbaH3NORzfySsCFTjM8d3tFZFHeaOZDhhLo6orEYFLWN9svKbXIiBVgXbJEg5SpCEAXA4aY27YBB24z8kRDeC4aTYl9wSWk0ZBkVvmX6Lejye8S+sRiwJATyuB5tsbSF1B08ohkEx0LgfMVazXH8faNrCFaj8qOdlz6KUEkeMbyip8LiV/Ep3Wh44LVjqsoCY5Dej7I2X5uyWq3TxzurNVbZcU5gUs7/KYICPwJXOx5loeowtouSu1vcC+up9T35U+l7eziczfIqxMziD1x2EDjrDM/pY3v2P1NdDKdxHHBJ73hfUarK65rz6FVbiadpcXyUyjbhsAViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJw/nKm/3l5je55YeAoVEYtd8iWaRKXIfbwunJBQ2H0=;
 b=C5CvpF5mJusyRLCDBOXrkOh2uTQ8a1od42XBpE/mh5/mc+szbjweFEi4zxn4WHh9PWH3K7yeM6fA2+imP9aTsKSf86dJtLfFLl+8cbXc1RJ7voxbGPqS8huiVHc5/+cm9IgSOewH5UndhcDDoaP7lO8JC4fh/K0L7wZR/tDfDqDG/qrY5iuU6j7pyIjpp7Zr8ANBah63z9HlVpwYvBPSsKEuEfU2yXMMw2fu0YJeRhEf1CoeQUDUrOK4/2gilMcd/qQSdxfgGXcX+aszT3a31yBEfWZw55PvAkhDVuTxiK0TcN7PCntqGA8+c7wO77/Wuka05TI6PetybSBDA1wOeQ==
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
Date: Fri, 22 Sep 2023 16:48:35 +0300
Message-ID: <20230922134838.3718-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|DM4PR12MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: b1166ef1-b0c7-4ce0-1668-08dbbb72b5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	urrOF+S6sSxIcYXbdIMpKvU+El6weAqgPcV9legez/tR7B6YBZy1PpYurOkjYCs2VDKmx3VfOsLdofEhBGu5p/F+WsS+zwrtFeRCGcs1am3IcXmC6FkmFX8tlR21VtwoM73aJCkOCbnfJha7F47XlnVFRug7YIcm/XOsl5/dFHau3amQpzpASLPODLnk4798rb5CUtzVWCUi/6gulALSzNMEvGZWrdY4azdtzf7eufoJJX6tjd/jOD1F5zFHfoQ6fzUrFaJeOO06IXiwqKPwK13McnzKovU46r17S6f8DykgHyRq5n/H2oOm0FdfdgbI+LzkBrTpRCQ8Uoiivw/MNFo40No/HewEj11b6RV6QbJ6PIf5b/IPjztnw7tyFcgGY9mGVPN3aK72KlonlXnEiyQ9t4SsiQWKqQLglyWuXLN9gc/8ttzR+b56Zpf7Eq7jxnAonMsfGTcMnRnaXRzaL+RFzdpOnIArXhnAWMEeT20GtP7axEZzpRBA8kj4Lji/mqMzueEmST26KbLFXYUtRETfPMOdNm5VMwM4XlbYzYOfeqFglbRKwuir+RXPJ6YyeuYyuyWy5o+/B450+4tcC9J79PFtT+hEyWUSXYnDPM4/OvvVmj6KbD/t5WLap6O1rMz2KC8fi+b35wLWVZDx8keAPU919M8eqjI7JUZyNdIDdj5yPUx5wzytYRn2nY3Qe0pI3S4f/TDSmj6666pGhfU3PWQo37BYTw0Q+cjJrDXzLGtcu+fsrVKyehvzAwMisHPbowla8X0NHmXSf0VWhkjSJid9XggN8jSNzhmIzqG8tf7NvAv53NWeS1nKMJtL
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(82310400011)(1800799009)(230921699003)(451199024)(186009)(40470700004)(46966006)(36840700001)(316002)(54906003)(70206006)(70586007)(83380400001)(6666004)(2616005)(336012)(356005)(40480700001)(26005)(16526019)(1076003)(426003)(36756003)(7636003)(478600001)(966005)(47076005)(40460700003)(110136005)(2906002)(5660300002)(82740400003)(8676002)(4326008)(8936002)(36860700001)(86362001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:49:15.5644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1166ef1-b0c7-4ce0-1668-08dbbb72b5fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5325
Subject: [virtio-comment] [PATCH 4/7] virtio-net: Add flow filter transport set command

Flow filter requests can be either sent using a control virtqueue
or using one or more flow filter virtqueues.
The driver can choose one of the transport based on device capability.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
 device-types/net/description.tex | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index caa8c59..3fd22b3 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1180,6 +1180,8 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 at a time, i.e. either control virtqueue or flow filter virtqueues.
 Once the driver sets the flow filter request transport in the device,
 the driver can send flow filter request using the enabled transport.
+The driver selects the flow filter transport using control vq command
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Transport Mode Set}.
 
 The flow filters are grouped using a flow filter group. Each flow filter
 group has a priority. The device first applies the flow filters of the highest
@@ -2043,6 +2045,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
  #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
  #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
  #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
+ #define VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET 4
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2140,6 +2143,25 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 };
 \end{lstlisting}
 
+\subparagraph{Flow Filter Transport Mode Set}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Transport Mode Set}
+
+The command VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET sets the
+transport mode for flow filter requests in the device.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_transport_set {
+        u8 mode;
+};
+
+#define VIRTIO_NET_FF_TRANSPORT_CVQ 0
+#define VIRTIO_NET_FF_TRANSPORT_FFVQ 1
+\end{lstlisting}
+
+The \field{mode} when set to 0, it indicates the driver will use
+control virtqueue for transporting flow filters requests; when the
+\field{mode} is set to 1, it indicates that the driver will use
+flow filter virtqueue(s) for transporting flow filter requests.
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

