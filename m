Return-Path: <virtio-comment-return-7603-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E09E94133
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6361B2A825
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 548CE986862
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4B4DE98683E; Sat,  7 Oct 2023 05:15:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3D044986845
	for <virtio-comment@lists.oasis-open.org>; Sat,  7 Oct 2023 05:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEtDrnBZS23wuie7JEgTKvR2xomNyzo1xCws/IFLtiS5uAGhAdvz+zo+ee5co8gOIYdTlyeXEnzyllyvp2lkQyXXw3/BXzZB/6Y8Q8ofjsvrXlhKhyPGrxF8rzEesDX5nbOX/Xo4mb8uYPVAf/lO7/Se8SL/+8rn81B4Eqv31b3Jve1VbyGUuJw1lv2bHfEI9LGkFzghLH08gjcScvbr3bPlQF1oQBoNssEWVSc6OP07VktvqyN/RRNOljYcp4iKDrK9evsPglO9NXmlB/M2jNj/mB2VMWlVFq6APjhTCqBK8NUcHl6xSCPxIMLIbRCpyi6Y7xsD7jTFeM9iPedGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87M+E783/nOoXse906d9jbR+Y+bqcCqT6ogMyL3oERI=;
 b=FiiICKbt4Ys22CvSFP/J5ibVWDBVP/nmpPoYvXovdtUx5nPhxg5zwSblB9gQAnNduzDxnKcP8laAyvO9axOiZwtOVPSDLjbynw7fSXIHWzLvZq3fXnbcSwDmEsnEjLX9Il6NCQSBFmJfiRnyCD85L131+38/belVvUijXScOKtgXmJ+nuekf9yzM328ycR290tv9si1PGw9x4X1pTW6HIx2GNDo4hfTdrpjtbSaKub8pqQLARmNSi4aZrSy4uGJXHBWJNwC3FfI/x86rlqLxwacd6xQYcBT+q9BExl+CKevhQVuf/7FpZfwCWn1irkNCcMK0KCtiDBo2sVUvE1RAmQ==
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
Date: Sat, 7 Oct 2023 08:14:39 +0300
Message-ID: <20231007051443.460148-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f387d93-022f-44e2-717c-08dbc6f46822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FmO86yumzm4cc62kDyrapIoQMg6ikPL2Y4zxjJdWiTlhXncC2zig+ZjseMuiqYqMzqcnok1APCkNWGHMTJ1NgnQ9nKBU2v8kAaF4M2kXrYQVCumMOuLly/XjB5yFh1TuIkoLuIRvQnQjwcaNkY/EjpW0GxOpdKsHSWCqWO3sY31VXvb1V4834cXnq64CXTQoCqKbThG2UL5uhrVYTgbglNmBk0gysaBQs2XtsNJSiw+VF24eZSe4/liEr3VyrIj1oniFbe9x94pg6X/9Ox3aj9A5g/F/DgdTYdG1/NaRPlotfYm+Bzuoxv6gEuTfpcH3MEl7lYrXmc1IRj70NZTUtyZyywo2S8xfMJagICywm02kni1RawfVZlMQ/rxL3xFd+Qd/K5aezawpbdccLr6wZmRKzzUvp26GptjwfuDtey3Y8qAewbXWs28TTOyT3v4tr1H9yp8+KDkDOOHT6Lxmn1o+dGNqlzzIMJWGjCKAZKPIlLICUYevVGS9D2DWsh/CYuSOlwIeWy+H54cjnVdWhbwqeU/N7HQp3B+ceFeKr08+c8CaJQ5JH8X+sgsF40JNejBp7bBHn6qZvYlqlPNBDU34BNFt6PzDCHCxNDhqdDqzcUo+c/DuOQ4oRSEHzhnHzUn442h92O0HWq1JBpBzlT/jH+jzk4eitBhZVCZlpDDFKaHBjldJn0GT350K0dpmWUkldAcvNsxjdnoMzC4QSxLCp/6BnLKMC/IpBAPzoNHvPmiw4LnZ54kUrPwTsSUMzMpQoUF4OClEKPi9TelKfg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(966005)(478600001)(6666004)(16526019)(82740400003)(86362001)(356005)(7636003)(36860700001)(54906003)(2906002)(83380400001)(336012)(47076005)(2616005)(426003)(26005)(41300700001)(1076003)(4326008)(70586007)(110136005)(8676002)(36756003)(316002)(5660300002)(70206006)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 05:15:22.3058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f387d93-022f-44e2-717c-08dbc6f46822
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681
Subject: [virtio-comment] [PATCH v1 3/7] virtio-net: Add flow filter group life cycle commands

All the flow filters are managed in the flow filter group. The
device can have one or more flow filter groups. Each flow filter
group has its own priority. The group priority which
defines the packet processing order in the flow filter domain.

Add commands to add and delete the flow filter group.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
 device-types/net/description.tex | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 19f6c60..c7306b6 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1192,6 +1192,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 filter group, a packet may find match to multiple flow filters. In such
 scenario, a flow filter with the highested priority is applied first to the
 packet, if there is no match, the next higher priority flow filter is applied.
+The driver adds and deletes the flow filter group using a control
+virtqueue commands \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Add}
+and
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Delete}
+respectively.
 
 The match fields also optionally consist of a match mask. When a mask is
 specified for the flow filter, first the packet fields are masked before
@@ -2041,6 +2046,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_CTRL_FF 7
  #define VIRTIO_NET_CTRL_FF_CAP_GET 0
  #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
+ #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
+ #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2107,6 +2114,32 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 Each array entry of \field{types} represents supported match fields of
 the packet by the device.
 
+\subparagraph{Flow Filter Group Add}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Add}
+
+The command VIRTIO_NET_CTRL_FF_GROUP_ADD adds a new flow filter
+group with the supplied group identifier \field{id} with assigned
+priority \field{priority}.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_group_add {
+        le16 priority;	/* higher the value, higher priority */
+        le16 id;
+};
+\end{lstlisting}
+
+\subparagraph{Flow Filter Group Delete}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Delete}
+
+The command VIRTIO_NET_CTRL_FF_GROUP_DEL deletes the
+flow filter group that has been previously added using command
+VIRTIO_NET_CTRL_FF_GROUP_ADD. Flow filter group is
+identified using a group identifier \field{id}.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_group_del {
+        le16 id;
+};
+\end{lstlisting}
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

