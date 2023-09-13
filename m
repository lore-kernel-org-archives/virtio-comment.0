Return-Path: <virtio-comment-return-7401-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386A3EDEC4D
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 13:55:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9D41A759CB
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 13:55:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 975A9986660
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 13:55:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8D3E6986633; Wed, 13 Sep 2023 13:55:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7FE04986637
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 13:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyGxxphUA8DbGmw0e5I6/GkyDpuusMBJ/dfdSfkXY/XF1UoLzg+FZekvs5xRqLvmxs8ufStsSO5mY6DFWf19ykWA+UqpIrwJM8LvNEe1e1CMh4Y32V8aaM3H0M7XmrDEwAbKQZjR5XRSbStq8ie4V/c6QiXM6VJnrJwdHwb+giccB8DIoEYEAdZwcUBhJDlloDCXSRw+jZV/ypDcCVxMwo5j30rYzDsRnjli4KhNW+J9tuxFdGjJhAfkMp/QO4v989l++0rnQBo7xMBihdDw5nwWR8pVDihlh1DUecI6M5OkSY9hKavTxxVkIU7Ta/thurEAnuLhUqk1jogTvd6AGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FurM3gzsfZxAYpamw0mtndqCaUjNl5mb+BgaooILGWc=;
 b=nWogKf98roz7dyxJ9HnbqtKW6XduXPXqPLi7WmCz6RzXZUrgH0GIReaJP8lXlc/HAaRUYiN1Rh0mEctn3IiZG51MTzS0KMIQMWkkFryKl1hOf2EK73OrPHay6rwtkK8QUwOmD6F+RspajyvPGnkDh+eQ+Di0l99w7Nl7g1fW/CzxI6jCk4LvnhXt1TalzLkP1Pgig2PxLpNooVzyMhDQyMUUTwCR6WBDXexbLV60FNFtOTcyP2ufg/OUSBxmhOUdwQfXPRtdYJN5Kyfe30Xsy5wxkk/TBijuoZwe0bA8Y4Az1tu4wtS17XAj7FUBVFaKUGNE/OdeQsk7WEJv/jhP+g==
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
CC: <hengqi@linux.alibaba.com>, <xuanzhuo@linux.alibaba.com>,
	<shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Wed, 13 Sep 2023 16:55:07 +0300
Message-ID: <20230913135507.560540-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913135507.560540-1-parav@nvidia.com>
References: <20230913135507.560540-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e308e5f-aed1-4006-fddc-08dbb4611d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Umz+ESL1uq9CRyJ85QrYkSJW27dG8jnjDJJ6VZYmkArXrn4MpumnM9ttWNWF1YeYvaxJuoMxEECa8UbcsHgGSL7/1+jT22HlWRR9uTozNOEf5ALguDPBSnZGI79LYCo27wth3rjG0fiJIB0DvaKqlB96UYcUvvX7Nc/XghQbSPrfDnBBiUagLuyqyZmM16HGdrxqB+8KGoJG5+x8XLmllLODE/qge9+9M4Vlku9JDbT1xhBpYarWaN8wx3vlHxjwdR9xa0qCmnM3YaLUw1MuybJnBcfCZwj5RsAxr6aK7nYQuoEJPb2J3dGEBfpgkdiE1PzSQNpodA2Uia/+qUkoYUpdVXfUNiuPJvIMDE0fWdtvn6T6pKzdjAB3vg/JU1mznxAnAArnqUy3J9dW67oVlWL/7VAnD2wS7B2kl5hV7da0gLMBR6Zugsu2kfDDHjeaoSoIJws+7Y8zS3JLqc4Fm8LYrLDNHb1hHcGufsK+7zNdIFpsmQyGRFmz42CqVSnFSQscUfYGfpe8TjzIP8S1A8ivDzLUe04/WTD8hych+oqajmK8OWuxfeUbkEDimFGDuur5IEMTIvVqiqd4/JvLJ8cm/18TsHa8MXWZo6xpVy3+MTL5ludvBS4BVqxwLoLyvzVcWefl8HOaFjhQPdR4gnV2cLSl8gZ4rDdLCMQg8vkrYDsfANR/XzkJL7GFqzLXYpSQV+Gzl71ljTbBZEVgDU2um76yTce57Dn0794XO4+A5wRoDZIENqGPfXgdkfMBe0+cB3Koq3YeMuIqH/9FqvrspTRPyqmo9v67lklluH0=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(1800799009)(186009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(2906002)(40460700003)(7636003)(36756003)(82740400003)(86362001)(5660300002)(4326008)(8936002)(8676002)(356005)(6666004)(316002)(54906003)(47076005)(41300700001)(36860700001)(40480700001)(83380400001)(26005)(16526019)(1076003)(70206006)(70586007)(2616005)(107886003)(110136005)(336012)(426003)(478600001)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:55:39.5048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e308e5f-aed1-4006-fddc-08dbb4611d1e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
Subject: [virtio-comment] [PATCH v1 2/2] content: Support enabling virtqueue after DRIVER_OK stage

Currently, a virtqueue must be enabled before driver has set the
DRIVER_OK status bit.

spec citation to section "Driver Requirements: Device Initialization"

"Perform device-specific setup, including discovery of virtqueues
for the device, optional per-bus setup, reading and possibly writing
the device’s virtio configuration space, and population of virtqueues."

This implies that a virtqueue must be enabled before reaching the
DRIVER_OK stage. There was no explicit mention about ability to
enable the virtqueue after DRIVER_OK stage.

In following usecases, creating a virtqueue after DRIVER_OK phase is
desired.

1. Dynamically create aq when administrative commands to be used.
2. Dynamically create the net device tx/rxq when device is
   opened when deploying for a container.
   In a container, number of virtqueues to be used may be <= max queues.
3. Dynamically create flow filter queues of netdevice when
   ARFS or ethtool filters are enabled as listed in [1].
4. Dynamically create rtc functionality related read virtqueue only
   when net device when timestamping to be used.
5. When XDP program is set, one can create additional XDP specific
   queues without affecting existing queues.

Hence, This patch introduces an existing queue enable and disable
(aka reset) facility and a new feature bit to explicitly indicate such
support by the device.

With this feature, drivers can skip optional queues creation during
driver init time. For example, a Linux net device driver
can create/destroy the transmit and receive queues when net device's
ndo_open() and ndo_stop() callbacks are invoked respectively.

As side effect, it also enables driver to not consume MSI-X vectors for
the PCI device at driver load time and utilize(enable) individual vector
when needed. This further helps on some cpus at high scale where a
interrupt line may not be available from the platform.

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- fixed comments from Xuan
- removed blank lines
- fixed wrong requirement link to device in driver section
---
 conformance.tex |  2 ++
 content.tex     | 53 ++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/conformance.tex b/conformance.tex
index 863f9c5..75de58c 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -77,6 +77,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
@@ -164,6 +165,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
diff --git a/content.tex b/content.tex
index 0a62dce..cbbea86 100644
--- a/content.tex
+++ b/content.tex
@@ -102,7 +102,7 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \item[24 to 41] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -440,6 +440,42 @@ \subsubsection{Virtqueue Re-enable}\label{sec:Basic Facilities of a Virtio Devic
 as during initial virtqueue discovery, but optionally with different
 parameters.
 
+\subsection{Dynamic Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues}
+
+When VIRTIO_F_RING_DYNAMIC is not negotiated, the virtqueues are
+enabled when the device is initialized, i.e. after the driver has ensured that
+the device has set the FEATURES_OK status bit and before the driver setting
+the DRIVER_OK status bit.
+
+When VIRTIO_F_RING_DYNAMIC is negotiated, the driver can avoid enabling the queue
+before setting the DRIVER_OK status bit; the driver can enable the queue after
+the driver has set the DRIVER_OK status bit. The queue enable mechanism is
+transport specific.
+
+\devicenormative{\paragraph}{Enable Virtqueues}{Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
+
+When VIRTIO_F_RING_DYNAMIC is negotiated, the device MUST allow enabling the
+virtqueue which was not enabled during the device initialization phase
+i.e. after the device has set the FEATURES_OK status bit and before the
+driver has set the DRIVER_OK status bit.
+
+\drivernormative{\paragraph}{Enable Virtqueues}{Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
+
+When VIRTIO_F_RING_DYNAMIC is negotiated,
+\begin{itemize}
+\item the driver MAY not enable all the virtqueues during the device
+      initialization phase;
+
+\item the driver MAY enable some or all the virtqueues after the driver has set the
+      DRIVER_OK status bit.
+
+\item the driver MAY enable all the virtqueues during the device initialization phase;
+\end{itemize}
+
+The driver interested in enabling and disabling the virtqueue dynamically
+after setting the DRIVER_OK status bit MUST negotiate VIRTIO_F_RING_DYNAMIC
+and VIRTIO_F_RING_RESET features.
+
 \input{split-ring.tex}
 
 \input{packed-ring.tex}
@@ -537,7 +573,9 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
 
 \item\label{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup} Perform device-specific setup, including discovery of virtqueues for the
    device, optional per-bus setup, reading and possibly writing the
-   device's virtio configuration space, and population of virtqueues.
+   device's virtio configuration space.
+
+\item\label{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup} Configure and enable the virtqueues.
 
 \item\label{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this point the device is
    ``live''.
@@ -551,6 +589,10 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
 The driver MUST NOT send any buffer available notifications to
 the device before setting DRIVER_OK.
 
+The driver MAY skip step
+\ref{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup}
+when driver has negotiated VIRTIO_F_RING_DYNAMIC feature.
+
 \subsection{Legacy Interface: Device Initialization}\label{sec:General Initialization And Device Operation / Device Initialization / Legacy Interface: Device Initialization}
 Legacy devices did not support the FEATURES_OK status bit, and thus did
 not have a graceful way for the device to indicate unsupported feature
@@ -569,7 +611,7 @@ \subsection{Legacy Interface: Device Initialization}\label{sec:General Initializ
 Initialization / Re-read FEATURES-OK} were omitted, and steps
 \ref{itm:General Initialization And Device Operation /
 Device Initialization / Read feature bits},
-\ref{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup} and \ref{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK}
+\ref{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup}, \ref{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup} and \ref{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK}
 were conflated.
 
 Therefore, when using the legacy interface:
@@ -872,6 +914,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_RING_DYNAMIC(42)] This feature indicates
+  that the driver can enable a virtqueue individually after the driver has
+  set the status bit of DRIVER_OK.
+  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
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

