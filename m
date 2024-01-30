Return-Path: <virtio-comment-return-9041-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0145EC46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6D0C342A6A
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 579D39868B4
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4B3EA986886; Tue, 30 Jan 2024 14:07:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3D8E7986879
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 14:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHWUA3Q3E8N9wSv8EgBOcQGETGKAi1mGQ3rZghPn+TOcd4X0oy7d1Jvpbq3dbR5hXQlx75uvd2+/+s/2qdVzyYjoWCNJSgoH3VoINXYvexYlKKoWzxCdt09c+4VlczcroDdBudKodncUmz4URlHTutRwavANskEG1XalIDoecNi8bDobFQdUj3hhYKHaeS4h1UzlytsJ/lmbiUhXMHOHD12QOOhTpQRDDfYgXcLPgGHR+AmCell3H3Flxz4f7gPMELGfm5CrgobMTQMYRvx5v0N5I1Go513Ve1m8wCZaxSbYP1QmPrbL8/bVDxDD2pKrv9g7nQGNsTIpXImUOUyG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UojhLTV2ylC9va6RTlmbt2+7vz6+cSDwSvSFbZi4S6I=;
 b=KHP0tcYykFIFRH/oNMEalcE2EkHlyE444coUU2iClM6SCSI2Ghw+gorIuBqR5N/QG0/xjdYA5TrgPKJXsfzzMc86+P15vgj5mhQz0R6e2P9lp9kaJ72KAIMfouiVjKS5XSuLXVhAGOq/1zCUWdRvrRnSuCcDOzEiOZ6Dj+4+csPRFJl5fhNZvaMXd2V0I6AAxJNQo9ShF4rtGwp0HTBmEAYfTvCKoRI/nF79/bbl1xZInqmVVKi/reWtVdS2ROC78SnN6K/LOYLenFknH/ZF/ie+2JGJkvKSoEgpcuwJgGP2C866sTcfZ+GiOnxHXF5YRJqawa5M56l2dxx6hmO6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 30 Jan 2024 16:06:32 +0200
Message-ID: <20240130140642.406882-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130140642.406882-1-parav@nvidia.com>
References: <20240130140642.406882-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|BY5PR12MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a847a4e-48fb-47bf-418e-08dc219ccaf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oUcVUnfIqCG21Zh3N3SIdCShgCqnqs4RQSEZaH7QEav7vKQJMBc+wK0GVf61K1Siqm7PNwur1ZoTP+L9duiNazgR6WSkpyU5UFAJwWNSPjQUwdqCgb7XGC0Uuh/V7lboJ60H0gSZPFxzC0YsdOxgd79IVgoa+tqf4qBXR/UHDySYOL1KzaX88lrcl3GIBw1qNFeRXgfb3sBNzbto3K+dg/eGXoFVK31CEMsZYS4cHAu2STwEu92ruRT4cYgiJzs1eU2sJf3kJgI631QSksY2CEfbCa50puMUbnKo7AdBLDOY0cUtKsSOMY1h5S4jIQRDY0OGCyUD8JyCWhacZFbttyoIDsCf8WabQdvzh/NBpxn/5aziluECaGb97Ch1nnctVL9DWbvgzRn5/6nAnKlLveebaqzKuzdkWia35vlIN0s4CuC4wA2fkzT3gKvERsqyEsTo04IVH1UXuuIhCvEo+JImRaWYdliCaoKZwDTDzO4LBrJoJQB9KXz4jXLfPh6zrKGIClU+zZy6Yy5oZuuhZtLWAkxgwAVX8ccp2FIIiv3QzNCIyCnECoJ+RCg4fjxjwht0/aALVYCCiHw6z9iZ8RYUM7oRoeqJgHa3uJE3G7HR3WhVhsXKLb5Eww5wgEglCmXpuUhIIkuMhGquSjTO7SsJDkcFnx8X/tdli4KAJ4+Yi8VSVFoougTM3c2lO8xM54NsLyK5IpzeHfcIkSIT9h6NWSi6UUlD570mgmXIEHG10xGxX+4qA0mgJS1s7OqW0rKwJxXrB9n5LXGd9zw9UgqgHIBdDX7hXriiDEXzSZ0=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(1800799012)(64100799003)(82310400011)(451199024)(186009)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(336012)(2616005)(5660300002)(16526019)(6666004)(4326008)(70206006)(426003)(316002)(8676002)(26005)(110136005)(70586007)(966005)(54906003)(1076003)(8936002)(2906002)(107886003)(47076005)(83380400001)(36860700001)(41300700001)(82740400003)(356005)(478600001)(7636003)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:07:28.1094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a847a4e-48fb-47bf-418e-08dc219ccaf0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4130
Subject: [virtio-comment] [PATCH v8 03/13] capabilities: Add theory of operation for capabilities

Device capabilities indicate supported functionalities and
resources of the device to the driver.

Driver capabilities indicate functionalities and resources which
driver will be using. Driver capabilities are subset of the device
capabilities.

Add theory of operation describing it.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 capabilities.tex | 40 ++++++++++++++++++++++++++++++++++++++++
 content.tex      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 capabilities.tex

diff --git a/capabilities.tex b/capabilities.tex
new file mode 100644
index 0000000..c375089
--- /dev/null
+++ b/capabilities.tex
@@ -0,0 +1,40 @@
+\section{Device and Driver Capabilities}\label{sec:Basic Facilities of a Virtio Device / Device and Driver Capabilities}
+
+Device capabilities indicate supported functionalities and
+resources of the device. Each device capability is identified by its
+unique identifier.The driver uses the administration command to read
+the device capabilities. The device indicates supported capabilities to the
+driver as a bitmap of identifiers. The driver uses the administration command
+to read the supported capabilities bitmap.
+
+The driver writes the capabilities in the device before performing any operation
+related to the capabilities. The driver uses the administration command to write
+the driver capabilities thereby either enable or disable a certain
+device functionality. The driver can write the capabilities at any time
+as long as there is no pending operation in progress at the device level related
+to the capability.
+
+For a defined device capability identifier, the device capability fields do not
+grow. A new capability should be added with a new identifier when a adding a
+device functionality or when extending the existing device functionality.
+This ensures backward and forward compatibility between the driver and the
+device as well as logical separation of related capabilities.
+
+The device capabilities are divided into two ranges by the identifiers
+as listed:
+
+\begin{tabularx}{\textwidth}{ |l|X| }
+\hline
+Identifier & Description  \\
+\hline \hline
+0x0000-0x07ff & Generic capabilities for all device types \\
+\hline
+0x0800-0x0fff & Device type specific capabilities \\
+\hline
+0x1000 - 0xFFFF & Reserved for future \\
+\hline
+\end{tabularx}
+
+Whichever device supports the device specific capabilities, such
+capabilities are described in the respective \field{Device and Driver Capabilities}
+section of the device.
diff --git a/content.tex b/content.tex
index 98b9c31..4938fc0 100644
--- a/content.tex
+++ b/content.tex
@@ -502,6 +502,7 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 types. It is RECOMMENDED that devices generate version 4
 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
 
+\input{capabilities.tex}
 \input{admin.tex}
 
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
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

