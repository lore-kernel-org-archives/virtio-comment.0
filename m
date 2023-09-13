Return-Path: <virtio-comment-return-7400-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F0FEDEC53
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 13:55:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C24626847B
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 13:55:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B235198667C
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 13:55:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A68E6986646; Wed, 13 Sep 2023 13:55:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 981F0986662
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 13:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyNYaWyzAagPXEcPHKDR7/xc0yRMNLw9o3Tdoc0R31B7qY/FLlSaWUfOnft9//stfSN0U+ctiQWLVo9qAvJa2Q6fGGqNqbVoxCWsZ3pxgbiab57t8lCKMGM9khwh+k28oRAVG+zc2BYbFnjRfO/rCnJKR1HFB1gmpYmg4Rxi6tKGs37lcCDQM85njADdNpdjKTKlBGWabD1MMXeCwerbA+lAeew6JuVWQvgdWcVsD1OuQaL35Zc8gn5I9FTWrdoVkbwYQ7cqoUUVVdPFMRiNMaQmm2eI1u8LqcyxZPyYMc6u0Nl4yN2kMEx7/ufFshhibbjJDYFWTfdYN6gv8w2LJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSzESDru/wBFKt73UCnT15Zzm5RvQUNdUTd5SqG2aUE=;
 b=ZfC/bwHHVI4XFU/UmVLk3S/Ua8FQKx0ZuGijaJqPU6+wNfKsWOvdCU5A8zfz0BIpcscv6iiC9C2svORFqDxPNDyPQw+6QJSU4Zu8LonhtAH5YbXQgezDAmSRYjuxWGdvWztujlvKHKvZysNNIhEBCxJzcfmOgsYB/mNTu+GB8yLQvESglMOydGwACjnXbntRGqlqThaQIxIObqp4aI7+bbPoMFXMX3SvysXzQ3LsdRIfwlu+zezJoonqjVhwTI6DCbfApHP/jqFEkhDeqQ+tXaborww5v9rXLDkZWsL8mxKWRjCMZtj6LLLY+auGFwcUTVxIhM6cBzKkMC8IWOCOHg==
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
CC: <hengqi@linux.alibaba.com>, <xuanzhuo@linux.alibaba.com>,
	<shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Wed, 13 Sep 2023 16:55:06 +0300
Message-ID: <20230913135507.560540-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913135507.560540-1-parav@nvidia.com>
References: <20230913135507.560540-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f0de1c-df98-46a9-41c2-08dbb4611ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MoCwzodMbs6n/clqwu8fkckLNaorkm2prusJfeFqQoJTmdXNtFWuIzSagB5RRz+0rR5s0r4aXDG4+MUxY2FzzkduokP9RvRSx5V1XjmbUgapHArcHQArC6bwkiIpoTPIruDeRL1b/7FX9PhD/u1kk2uSOEgFZQwwctfomgKBNOa0aTLhO73G4OxVM82W5DwsTh+4ySLconrwFh0x7yj3XjjxUVKueYqpH/CRvBPIRpa+64dsHiB8dInAFz5q7ClRXraSPCF0TZouTx0HaNskqDViX8kD8UQJNs8Z54SkKNfo0xjFy4j7zzXwEp1QuW4ij+kuPQhqF6hUg/Av8/N9I//2LxcULLENajSNjijOeXNDrHXiN96OLV/JPIaky71fUPnxnsmU6n4eMZq553a75ecDUtXhtIX3w7hfCKKIFQlaMfRbABSVq0nTN7l0d8zqMoJlIheCqgyoXXYj/yzDJbfLjfYMGfcvEq2c/pV0Nwz15i7BLPv1eRgDTDYX+621zpyuyMZ+e8zO6RzoCT6T1ecLDEAK4+sEKYeKzNX2U+cwH/fTcomQm6fMLonW7tG5JWUzna7l0OxQPqyF5BzbNgBVVy+CBuQVXO3gqA4Mk5lJjLGcrLw6CR0AVKvX/rYeX8MSs1fXU0d/oR0/RHqEF/nk7IPh0aVxrRDmZ3aGqZq5zujFXAyAgNILup/tavWd9wqXjkmlKZRK9TeUW25ON+AkapQNV1cDVxsyUCeRQfmtuAxGxQKVamYOO3yoAWIA
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(82310400011)(451199024)(1800799009)(186009)(36840700001)(46966006)(40470700004)(6666004)(478600001)(426003)(107886003)(83380400001)(336012)(16526019)(26005)(1076003)(2616005)(2906002)(316002)(70586007)(41300700001)(110136005)(54906003)(70206006)(8936002)(8676002)(4326008)(5660300002)(86362001)(36756003)(36860700001)(47076005)(356005)(82740400003)(7636003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:55:35.4433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f0de1c-df98-46a9-41c2-08dbb4611ab3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152
Subject: [virtio-comment] [PATCH v1 1/2] conformance: Add missing virtqueue reset conformance references

Add the missing references to the virtqueue reset related conformance
requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 conformance.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index dc00e84..863f9c5 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -76,6 +76,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
@@ -162,6 +163,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
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

