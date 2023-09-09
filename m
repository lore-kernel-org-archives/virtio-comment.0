Return-Path: <virtio-comment-return-7298-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213B0EEB580
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:32:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6834345B31
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:32:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5226A986630
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:32:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 43184986608; Sat,  9 Sep 2023 14:32:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32B0B98660D
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2tPiLHUAeX25MMctzb8hZE6qDz1UvPE5djX+zeDZoIqEVDMjI6drh7SsTSaAP20i9ywunUVOVnkZceajElw6qfHXjo0zdraFhMgjirB+s4Fl0xePG/4sdEBtck+mB2IvTDoKsOcvyz7eJQVbhQGBrbwi6sF0jbaPjq/FZCRrslU4+gqzpQAy+G+Q/TZLrh3jBgIY7wiEDJhflLInQSqZv5hFwu+6KZjJdUH8pQ959EyTfLvHMSeIHN3TZEGdTkw8lgMtfG+reTfJUwKemcrenM9WzlgOC1zUPCAtI22hMpFFW2LCUig8+LNiqp54OjrmXqfny17Q+gkfB6Sa51vOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOC6jI71bqqFVtHFqWtOJAOqIaShBjIY3BD0PxfBZVg=;
 b=Q7DZqioRW3XnhEnDSwwWA+T/kYMzlX4RIOG5d1piBQz+DC+2vCdIm1ChbHlTtygJ1F/Y8bDq0twgwAmD/QevyXhkPx3rJoiQJPJ1l+R43SK24FaR0ZOYytaWDBzFf+ukItX6I3OTn4HSULOWEhaUEyv+2535tShMs6uck8OiR/KTdah3RWnldApWvDW85fvbZ1sD3CpytZJgH9HlkE9y2+y00ZsnOKwXK1ex9Y1HCzsj/QhMUS3Jt1rlQFbVlrSdFln7MdEueL2jMj2EEJF/FZmzvQt3bqDV4d3WVTglGfX8ghcvn3fXjZZjP/lIWs6c0JbG860HzeXQ98PTR4kCGg==
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
Date: Sat, 9 Sep 2023 17:32:18 +0300
Message-ID: <20230909143218.524481-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909143218.524481-1-parav@nvidia.com>
References: <20230909143218.524481-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SN7PR12MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 8590f68a-32d7-4f43-36a6-08dbb141a203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MO1PdeS98zM9N65N0O5GUX7lqlWBMNDPxzTkD3fCBl3AwpPWN7V3+CoV98FKd8S1EshFoCFtp5lbyn93RKPxO20urx0JDoaaEQCIP/2WJ5pXfVpXY3q0dCV0UCdVhpJ3SUlHcmoj1ELCVI2L8KvOxT55iMfpQPlMt/+Qo5R4o5sU3bwK6FgnEmc428/aKEK798Mhv3HPoYbL64b0mas4WhD6ddSqpgbLHeXv5omtJvxolQQYW4o4H36/7NaNkssR7vb0Vz1VuqGbvMwJ+1PnoU88Isnafe5tMkbz9Z7MEXzg9NxFVIezIGRr5COsxCA/E1WzURnNzMU76z1oE9/vFADzR9f1e/OtKzpoDtBVxnGqTJ03b5tCSdOzq8iu9Xh8lPqGLWeuGrGIfh+nQywSkj61EhDSB+L+t+3ktVv4wCi0NDxMBsZjmNPWxQpcIARed1rgHw7VAP7zsJqt88QLr8rs7yiuP4m2+mn9w2lIbfxkEFxpgp3KFo5UCG2dcUnGdZZ7fyFg2/jkr/hP5M+JR/ntq0IV2mNlvVguCOFmZLrkOmY/xNfDVPL/Ih0YsWSkWi7nK64miCP0l7Vm3OAYpgaRGsCJGYJcruaZ/84+zL6Hq+dPDhaa3EKE5JF4GrdapG9fX/BtE7n3akgqa00pawq7hpyaQMVp5/PhW6iyciAOOwAjVoCzm6b7Ow0xaC7ZFVxLInTn3mVRq2oF7CG9GaZ0GZQmC8RVKxIZQjgWNDv9gscP3j1svIj7XF3IUG3qwHJtC1xgbPjw53wgTcy4S2FLL3PcxX/Iy3Jo8AT0/jc=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(1800799009)(451199024)(186009)(82310400011)(40470700004)(36840700001)(46966006)(7636003)(66899024)(82740400003)(356005)(36756003)(86362001)(40480700001)(40460700003)(478600001)(966005)(110136005)(2906002)(6666004)(5660300002)(4326008)(8936002)(54906003)(70206006)(70586007)(316002)(41300700001)(8676002)(83380400001)(47076005)(36860700001)(107886003)(426003)(1076003)(336012)(2616005)(16526019)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:32:45.0761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8590f68a-32d7-4f43-36a6-08dbb141a203
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7132
Subject: [virtio-comment] [PATCH 2/2] content: Support enabling virtqueue after DRIVER_OK stage

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
 conformance.tex |  2 ++
 content.tex     | 54 ++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/conformance.tex b/conformance.tex
index 863f9c5..07b0b7b 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -77,6 +77,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
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
index 0a62dce..91aee25 100644
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
+\item
+the driver MAY not enable all the virtqueues during the device initialization phase;
+
+\item the driver MAY enable some or all the virtqueues after the driver has set the
+	DRIVER_OK status bit.
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
@@ -872,8 +914,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_RING_DYNAMIC(42)] This feature indicates
+  that the driver can enable a virtqueue individually after the driver has
+  set the status bit of DRIVER_OK.
+  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues}.
+
 \end{description}
 
+
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
 
 A driver MUST accept VIRTIO_F_VERSION_1 if it is offered.  A driver
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

