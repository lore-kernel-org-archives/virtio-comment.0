Return-Path: <virtio-comment-return-7879-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5E6C07480
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 74409D93EE
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B265986972
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 62142986938; Fri, 20 Oct 2023 12:33:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 54F7D986943
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 12:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuHYeaPYOvNwH1BruoJv6FZB7NOyVoaUv3wPqbwO05gKlPScJPAoPY+yDeCCO6BG8eMbqEA743sEoED4ahrJkhfKFm8+ncGfXu22rI5oT27jkHiVgypyn6eWGw+/4lS72fYQ334xyIBegAgA/pAUZUwvOvJP3sPYNzYNZcMJ+g1ziZSH/Q2mAG/XuJ51c9+G2e9D1gtnIxlRRhmFTE3K5hlEUnhnuPpc2ZLjL/e2bWrpDZrqH1VD5eVoMFZOuHVBNLHECsCG7EMcICIqQhKsFjGAz/ofx+/ulfabiqKE11AWlgerLLdhYvaKSa6V049VkX0CyyEl7J7VPfRXruFPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2H5600u2P5wwragEv7LXq/XS4L78/5i7/Ds//GkLrg=;
 b=AvDkYDwGDiyF4s+DiRbBHm3smWXq+3FwbuIdACliFMSLJ+UDis4/f3LaYlWWmul4DSbJLo8dJC8hv6T1I9l3O65cFjD7UC/Rof5BwTDZYMPyQuj+OzFKW6L4MvQ5iYzXPoX5ko3eqpM8f3IIgWhjGXpbWcNnUv7mki4bic9ag+/FWpvsGT57TLT6+hINDCuHJMeZcFdQm4fEH7ZUzaPtwyJnPgSMacMRCrX1m07Brax7K2FCXQs1M7sqjDAZg57yN6QA/ISlezvn1v0pta2HMvjSYM1OGgqvtFIOk0M5l/bCQ9QHLdB1b6sl+HvOz87HkbtKrH32KKMuIXDCEP5zIw==
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
Date: Fri, 20 Oct 2023 15:33:01 +0300
Message-ID: <20231020123303.1209289-5-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020123303.1209289-1-parav@nvidia.com>
References: <20231020123303.1209289-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|PH8PR12MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 455c679c-2daa-4bfd-98d9-08dbd168cce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WxD7c/a9GFpd4A8KRTRZGp52I57TktclUFVVCUR8nBrxDFcwkbG+xHsYG5ygtBQHgL9BPNFXnGFdEYgcF3AMrB4N/o/tHxjd6LzsWF64HRDmcVT/KU/i+XJF4cWc+rn4sZip2R/N95I70d4Gr9lv0MemIjekZqNsmicXIEeZoWtAnp0mBqksO9BjoG4hb06DiTSn0I3xA23Pxx8LX1E5C/pFBS8aCvHIQoGvUWVjBd1eVDhJTOmATz9iZEbVKh3fINEXvIa9rOBb5BXPj3gaZD4DQmJ4ihR6cOenUC5gtAZnUycfVBrrOLD69hfl0WQd8y7RBugASUR8Jk2xVednkIIF/1vVm4YZ3bkL/cG8aTo+hGNGO8HFMmYf++FOcjuoqRif3QhQQPGEPRFa+Xb6Lv+dCVdD6AboJEhiKLkQbdcR0lleRMtou5aUADw7oeVgA4kWvN7JvgWyp0FSmuR2Sq/DKeRpXMtfN4lVgbwYlaNGmf/Flz/7NwEUltMvFgq2V7sMjjSu28oFE4E4vYsXX4QKOJpXZBAewU6NxztnhEY5HvaNkVXB34W+eE8vaJrbDh9aM+RrGOqsEEi0TovUb3k5XZo6JGWxU68Hk95PMNjePWLzqbGcNLab2bUrqFOY2OAOVnB8vl13oej8RtWJgY9ZeYcf0jY4lB5i//SJ5iTxc7PkimUw941naCyId9bjPWXIMEhGkohW6ibd+mt8PgkXV45rs0yEP/0OOMqUNHIFcT0qp4BuJwCoKvaqfXho3sZtMy+1VGouIGM9SE+3tbtEItOzZcS3kB0bqGEsydw=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(82310400011)(1800799009)(186009)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(54906003)(70206006)(478600001)(70586007)(110136005)(966005)(5660300002)(36860700001)(356005)(26005)(7636003)(47076005)(82740400003)(2616005)(86362001)(1076003)(426003)(336012)(6666004)(36756003)(2906002)(41300700001)(16526019)(83380400001)(8676002)(316002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 12:33:44.5413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 455c679c-2daa-4bfd-98d9-08dbd168cce0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6697
Subject: [virtio-comment] [PATCH v2 4/6] virtio-net: Add flow filter transport set command

Flow filter requests can be either sent using a control virtqueue
or using one or more flow filter virtqueues.
The driver can choose one of the transport based on device capability.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
 device-types/net/description.tex | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 9087d36..5ed095a 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1186,7 +1186,8 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 Once the driver sets the flow filter request transport in the device,
 the driver can send flow filter request using the enabled transport.
 The driver enables the transport for flow filter requests using a control
-virtqueue command.
+virtqueue command
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Transport Mode Set}.
 
 The flow filters are grouped using a flow filter group. Each flow filter
 group has a priority. The device first applies the flow filters of the highest
@@ -2072,6 +2073,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
  #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
  #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
  #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
+ #define VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET 4
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2168,6 +2170,25 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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

