Return-Path: <virtio-comment-return-7582-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A652E784AD
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:16:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EE56C2113B
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:16:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E2FFF9866B7
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:16:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D0628983FE6; Mon,  2 Oct 2023 05:16:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D13D9866CB
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Oct 2023 05:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciXAtysvjUojoaPqpBpPu9ehIbHt3CwN2eacj3vgrc0+qw7q6MPBpsx6UjCl892Y1Ny7kDpWNMBaAUyQdvjqZkKpsbP8g3EnkXk242WnaXjdyahnRUUSyfu2U+yoCGOwkCWj0l9awQssb8e2HD8m675zuHrNU2B/3F80ouvjbtultv5YocVhBK2Y7CevEGR6hXt5qDhMa6ZbaxfJJThr60ITwTPofuIBRoJlUfLc7iP7wqfHnX/eHcGn4va0NmKh7l0UygsA1tuTMP0SBMFgGqmsEgLea89u9YmDDhkNYUkXnmHBMomfFwk1ImjYx2Rpkcsfj+4SGCceawN1ExSKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y74/k0ZxyL8CwEp7YILb/u4XZvk5LpcZs4J3UKceXUo=;
 b=L3lKjEWttjpkfBw772AgxSy+RSA96jUGwIUMeNKNA+El10/xp2cTwMUCMbX45aG4YIHqF0BRs/TbWHWvpzByoE082rGPDpVNZjsdNFe+4urLY3OZW8dWWlpUPPlQOThiJzByyg+qFGlUZiz+qwn7z0IC7vGIv3bSKfxCWVhM6HbKrm30911JqxdDq4GNxpuiDEQzjlaIRlDDJunFNwHVJRhvkH2BKhPiFP7aPyPgpLQSYpHVURhgRXWWE3eZaZSpawKy2/pMmRI+FGKy5/W9lLI5foL1tANdlwqk1MEahFF4eVutH/QEdewaFVpYUP+ZCt01d3sazjDBScd2NYYjGg==
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
Date: Mon, 2 Oct 2023 08:16:01 +0300
Message-ID: <20231002051601.6626-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002051601.6626-1-parav@nvidia.com>
References: <20231002051601.6626-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|DS7PR12MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: df7a54d1-8d20-485d-28a1-08dbc306bea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GgJAmFf5f+KHdeN5w3oqXlf93LtuWaymk61aLej1DU8wVROO531jgQWhJgm1wxYp93EKVIZSFYFmDCRbkdUon0L66cCAaFvdpeZZWf4EfZFz+TiezjGY3g/yXjIQ6LOgKYBlgwrd4uuawEjlqO34OFwAKASOqaWpyTCHv2WsYZmiTIFlIAQ16gmDWpsHFxfOop56dLuvJvezTKKEPet0iPx3SLPcIlxUeOXn15Sw/28de1lYHH4uhXYoEVPB77UoJBQfOUbu80lAFgts9BzEySjE9RAraIcZVDZwwkXaTcJsxqi5/Slra/3+LITB3u+C7W+Fm59U/qB0N4+a5DL3yLHjuFkaW6kY6zVY6F54YMpRRODT1ipWz61d2/4dLoFyJkPdBzSr/aSU1D0AUA50pVB89VEYBKn2pvz53IPLUMhkatYCcxcGarz4GThrGxY60sTtoVCxHsqhG+2z9MdZ0Wxai54bV+tarccJsK1plkTfUxGRJz4XyFrkPsX6BPzrLyxwjaekaSZhwndOhnVKCt/S9F/Eq4sFcOHVtl1OSY+EvnMRLKbbfVBpKNmzUMqk6FOyoWv8sfL5jsynJLAyBpxuJe3FqXcmL2Wfb4ZuPLArx1AWdhFq36QCOgR1nrFf5N9dp4lYMv7NDeS1vYT63n2dNdMUMhBgb4aNc4QhoIv9i/5obL9eW5eN5a7hBRxOggCTW7ENoqUx0+dB4KD/H8lK3EIQu4xlvlXcLdc0HX4bCGvURTMx4bL2LV1622GNNQ46iAyTOUs6aFstBN6BgQZY4k3oWOtw867sR1ooLRFzaNeeAmZIRc3Pmw1vWJU/
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(8936002)(4326008)(8676002)(41300700001)(5660300002)(316002)(70586007)(54906003)(70206006)(110136005)(2906002)(478600001)(966005)(40460700003)(36860700001)(6666004)(86362001)(7636003)(47076005)(40480700001)(26005)(16526019)(336012)(426003)(36756003)(107886003)(1076003)(2616005)(356005)(82740400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 05:16:33.6297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df7a54d1-8d20-485d-28a1-08dbc306bea3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6360
Subject: [virtio-comment] [PATCH v3 2/2] content: Support enabling virtqueue after DRIVER_OK stage

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

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/177
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v2->v3:
- github fixes tag added
v1->v2:
- fixed comments from Michael
- reduced device and driver normatives (simplified)
- replace 'a virtqueue' to 'the virtqueues'
- reworded to remove 'interested'
- avoided repeated 'device initialization text', replaced with
  DRIVER_OK status bit language
- avoided confusing text around 'MAY' in the requirements
- replaced 'the queue' to 'specific virtqueues'
- replaced queue to virtqueue
- simplified commit log to talk about msix
v0->v1:
- fixed comments from Xuan
- removed blank lines
- fixed wrong requirement link to device in driver section
---
 conformance.tex |  2 ++
 content.tex     | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 48 insertions(+), 3 deletions(-)

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
index 0a62dce..1a296a9 100644
--- a/content.tex
+++ b/content.tex
@@ -102,7 +102,7 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \item[24 to 41] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -440,6 +440,38 @@ \subsubsection{Virtqueue Re-enable}\label{sec:Basic Facilities of a Virtio Devic
 as during initial virtqueue discovery, but optionally with different
 parameters.
 
+\subsection{Dynamic Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues}
+
+When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver enables the virtqueues
+during the device initialization sequence, i.e. after the device sets the
+FEATURES_OK status bit and before the driver setting the DRIVER_OK status bit.
+
+When VIRTIO_F_RING_DYNAMIC is negotiated, the driver can avoid enabling the
+virtqueues before setting the DRIVER_OK status bit; the driver can enable the
+specific virtqueues after the driver has set the DRIVER_OK status bit.
+The virtqueue enable mechanism is transport specific.
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
+\item the driver MAY enable some or all the virtqueues after the driver has set the
+      DRIVER_OK status bit.
+
+\item the driver MAY enable some of the virtqueues or all the virtqueues or none of
+      the virtqueues before the driver has set the DRIVER_OK status bit.
+\end{itemize}
+
+When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver MUST enable the
+required number of virtqueues before setting the DRIVER_OK status bit.
+
 \input{split-ring.tex}
 
 \input{packed-ring.tex}
@@ -537,7 +569,9 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
 
 \item\label{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup} Perform device-specific setup, including discovery of virtqueues for the
    device, optional per-bus setup, reading and possibly writing the
-   device's virtio configuration space, and population of virtqueues.
+   device's virtio configuration space.
+
+\item\label{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup} Configure and enable the virtqueues.
 
 \item\label{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this point the device is
    ``live''.
@@ -551,6 +585,10 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
 The driver MUST NOT send any buffer available notifications to
 the device before setting DRIVER_OK.
 
+The driver MAY skip step
+\ref{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup}
+when driver has negotiated VIRTIO_F_RING_DYNAMIC feature.
+
 \subsection{Legacy Interface: Device Initialization}\label{sec:General Initialization And Device Operation / Device Initialization / Legacy Interface: Device Initialization}
 Legacy devices did not support the FEATURES_OK status bit, and thus did
 not have a graceful way for the device to indicate unsupported feature
@@ -569,7 +607,7 @@ \subsection{Legacy Interface: Device Initialization}\label{sec:General Initializ
 Initialization / Re-read FEATURES-OK} were omitted, and steps
 \ref{itm:General Initialization And Device Operation /
 Device Initialization / Read feature bits},
-\ref{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup} and \ref{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK}
+\ref{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup}, \ref{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup} and \ref{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK}
 were conflated.
 
 Therefore, when using the legacy interface:
@@ -872,6 +910,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_RING_DYNAMIC(42)] This feature indicates
+  that the driver can enable the virtqueues individually after the driver has
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

